defmodule Iso8583Parser do
  def chomp(input, len) do
    <<head::binary-size(len)>> <> tail = input
    {head, tail}
  end
  
  def type_multiplr(type) do
    case type do
      :x -> 8
      td when td in [:n, :z] -> 2
      _ -> 1
    end
  end

  def pro_multiplr(profile) do
    case profile do
      :ascii -> 2
      _ -> 1
    end
  end

  def calc_len(size, profile, type) do
    size = 
      case type do
        :x -> size
        td when td in [:n, :z] -> size + rem(size, 2)
        _ -> 1
      end

    trunc(size/type_multiplr(type)/pro_multiplr(profile))
  end

  def translate(raw_data, profile, type) do
    case profile do
      :ascii -> 
        case type do
          td when td in [:x,:z] -> Base.decode16!(raw_data)
          _ -> raw_data
        end
      _ -> 
        case type do
          td when td in [:x,:a] -> raw_data
          td when td in [:n,:z] -> Base.encode16(raw_data)
        end
    end
  end

  def process(pos, input, output, fmt, profile) do
    %{^pos => {head, type, size}} = fmt

    {head_val, back} = 
      case head do
        0 -> {calc_len(size, profile, type), input} 
        _sz -> 
            head_b_len = calc_len(head, profile, :n)
            {front, back} = chomp(input, head_b_len)
            body_len = translate(front, profile, :n) |> String.to_integer
            body_b_len = calc_len(body_len, profile, type)
            {body_b_len, back} 
      end

    {front, back} = chomp(back, head_val)

    body_tsltd = translate(front, profile, type)

    body_tsltd = 
      case type do
        :bin -> binary_part(body_tsltd, 0, trunc(size/8) )
        _ -> String.slice(body_tsltd, 0, size)
      end

    {back, Map.put(output,pos,body_tsltd), fmt, profile}
  end

  def disassemble(msg, spec, profile) do # msg, spec, profile
    # todo: get list of bits present, hardcode for now
    bitlist = [1, 2, 3]

    init = {msg, %{}, spec, profile}

    result = 
      Enum.reduce(bitlist, init, 
        fn pos, {input, output, fmt, profile} -> 
          process(pos, input, output, fmt, profile) end
      )

    result
  end
  
end

isomsg = <<128,0,0,0,0,0,0,0, 4,2,3, 55, 5,6,7,8,9,10,11,12,13,14,15,16,17,18,
19,20,21,22,23,24,25,26,27,28, 29,30,31,32, 33,34,35,36,37,38,39,
40, 41,42,43,44,45,46,47>>

spec = %{
  1 => {0, :x, 64},
  2 => {2, :n, 6},
  3 => {2, :z, 37},
}

diassambled = Iso8583Parser.disassemble(isomsg, spec, :bin)

IO.inspect diassambled