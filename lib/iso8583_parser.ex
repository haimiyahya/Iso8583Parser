defmodule Iso8583Parser do
  alias Iso8583Pasrser.Helpers

  def process(pos, input, output, fmt, profile) do
    %{^pos => {head, type, size}} = fmt

    {head_val, back} =
      case head do
        0 -> {Helpers.calc_len(size, profile, type), input}
        _sz ->
            head_b_len = Helpers.calc_len(head, profile, :n)
            {front, back} = Helpers.chomp(input, head_b_len)
            body_len = Helpers.translate(front, profile, :n) |> String.to_integer
            body_b_len = Helpers.calc_len(body_len, profile, type)
            {body_b_len, back}
      end

    {front, back} = Helpers.chomp(back, head_val)

    body_tsltd = Helpers.translate(front, profile, type)

    body_tsltd =
      case type do
        :bin -> binary_part(body_tsltd, 0, trunc(size/8) )
        _ -> String.slice(body_tsltd, 0, size)
      end

    {back, Map.put(output,pos,body_tsltd), fmt, profile}
  end

  def disassemble(msg, spec, profile) do # msg, spec, profile
    # todo: get list of bits present, hardcode for now

    {first_bmp, the_rest} = Helpers.dissect_first_bmp(msg, profile)

    bitlist = Helpers.bitmap_to_list(first_bmp)

    init = {the_rest, %{}, spec, profile}

    result =
      Enum.reduce(bitlist, init,
        fn pos, {input, output, fmt, profile} ->
          process(pos, input, output, fmt, profile) end
      )

    # todo, check if inside output contains field 1 (which contains the value of second bitmap)
    # if field 1 exists, reduce again buat start from after 64

    result
  end

end
