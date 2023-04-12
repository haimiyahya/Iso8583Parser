
defmodule Iso8583Pasrser.Helpers do

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

  def dissect_first_bmp(msg, profile) do
    case profile do
      :bin ->
        <<bmp1::binary-size(8)>> <> the_rest = msg
        {bmp1, the_rest}
      :ascii ->
        <<bmp1::binary-size(16)>> <> the_rest = msg
        bmp1 = bmp1 |> Base.decode16!()
        {bmp1, the_rest}
    end
  end
end