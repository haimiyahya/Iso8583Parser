defmodule Iso8583Parser do
  alias Iso8583Pasrser.Helpers

  def process(pos, input, output, fmt, profile) do
    %{^pos => {head, type, size}} = fmt

    {body_len, head_val, back} =
      case head do
        0 -> {size, Helpers.calc_len(size, profile, type), input}
        _sz ->
            head_b_len = Helpers.calc_len(head, profile, :n)
            {:ok, front, back} = Helpers.chomp(input, head_b_len)
            body_len = Helpers.translate(front, profile, :n) |> String.to_integer
            body_b_len = Helpers.calc_len(body_len, profile, type)
            {body_len, body_b_len, back}
      end

    {:ok, front, back} = Helpers.chomp(back, head_val)

    body_tsltd = Helpers.translate(front, profile, type)

    body_tsltd =
      case type do
        :bin -> binary_part(body_tsltd, 0, trunc(size/8) )
        _ -> String.slice(body_tsltd, 0, body_len)
      end

    {back, Map.put(output,pos,body_tsltd), fmt, profile}
  end

  def disassemble(msg, spec, profile) do # msg, spec, profile
    # todo: get list of bits present, hardcode for now

    {first_bmp, the_rest} = Helpers.dissect_first_bmp(msg, profile)

    bitlist = Helpers.bitmap_to_list(first_bmp)

    init = {the_rest, %{}, spec, profile}

    {the_rest, result, _, _} =
      Enum.reduce(bitlist, init,
        fn pos, {input, output, fmt, profile} ->
          process(pos, input, output, fmt, profile) end
      )

    # todo, check if inside output contains field 1 (which contains the value of second bitmap)
    # if field 1 exists, reduce again buat start from after 64
    result = case Map.get(result, 1) do
      nil -> result
      second_bmp ->
        bitlist2 = Helpers.bitmap_to_list(second_bmp)
        init = {the_rest, result, spec, profile}

        {the_rest, result, _, _} =
          Enum.reduce(bitlist, init,
            fn pos, {input, output, fmt, profile} ->
              process(pos, input, output, fmt, profile) end
          )
        result
    end

    #IO.inspect("the rest:")
    #IO.inspect(the_rest)

    result
  end

end
