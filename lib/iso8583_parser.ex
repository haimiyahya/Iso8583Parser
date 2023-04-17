defmodule Iso8583Parser do
  alias Iso8583Pasrser.Helpers

  def process_disassemble(pos, input, output, fmt, profile) do
    %{^pos => {head, type, size}} = fmt

    {body_len, head_val, back} =
      case head do
        0 -> {size, Helpers.calc_len(size, profile, type), input}
        _sz ->
            head_b_len = Helpers.calc_len(head, profile, :n)
            {:ok, front, back} = Helpers.chomp(input, head_b_len)
            body_len = Helpers.decode(front, profile, :n) |> String.to_integer
            body_b_len = Helpers.calc_len(body_len, profile, type)
            {body_len, body_b_len, back}
      end

    {:ok, front, back} = Helpers.chomp(back, head_val)

    body_tsltd = Helpers.decode(front, profile, type)

    body_tsltd =
      case type do
        :bin -> binary_part(body_tsltd, 0, trunc(size/8) )
        _ -> String.slice(body_tsltd, 0, body_len)
      end

    {back, Map.put(output,pos,body_tsltd), fmt, profile}
  end

  def disassemble(msg, spec, profile) do # msg, spec, profile
    {first_bmp, the_rest} = Helpers.dissect_first_bmp(msg, profile)

    bitlist = Helpers.bitmap_to_list(first_bmp)

    init = {the_rest, %{}, spec, profile}

    {the_rest, result, _, _} =
      Enum.reduce(bitlist, init,
        fn pos, {input, output, fmt, profile} ->
          process_disassemble(pos, input, output, fmt, profile) end
      )

    result = case Map.get(result, 1) do
      nil -> result
      second_bmp ->

        bitlist2 = Helpers.bitmap_to_list(<<0,0,0,0,0,0,0,0>> <> second_bmp)
        init = {the_rest, result, spec, profile}

        {_the_rest, result, _, _} =
          Enum.reduce(bitlist2, init,
            fn pos, {input, output, fmt, profile} ->
              process_disassemble(pos, input, output, fmt, profile) end
          )
        result
    end

    result
  end


end
