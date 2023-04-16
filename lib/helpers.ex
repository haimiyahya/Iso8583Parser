
defmodule Iso8583Pasrser.Helpers do

  def chomp(input, len) do
    case byte_size(input) >= len do
      true -> <<head::binary-size(len)>> <> tail = input
              {:ok, head, tail}
      false -> {:error, "len supplied must smaller or equal to input"}
    end
  end

  def type_unit_size(type) do
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
      case profile do
        :bin ->
          case type do
            :x -> case rem(size,8) == 0 do
                    true -> size |> Kernel.*(pro_multiplr(profile)) |> div(type_unit_size(type))
                    false -> (size + (8 - rem(size,8))) |> div(type_unit_size(type)) |> Kernel.*(pro_multiplr(profile))
                  end
            td when td in [:z, :n] -> size + rem(size, 2) |> div(type_unit_size(type))
            _ -> size |> Kernel.*(pro_multiplr(profile)) |> div(type_unit_size(type))
          end
        :ascii ->
          case type do
            :x -> case rem(size,8) == 0 do
              true -> size |> Kernel.*(pro_multiplr(profile)) |> div(type_unit_size(type))
              false -> (size + (8 - rem(size,8))) |> Kernel.*(pro_multiplr(profile)) |> div(type_unit_size(type))
            end
            :z -> size |> Kernel.*(pro_multiplr(profile)) |> div(type_unit_size(type))
            :n -> size |> Kernel.*(pro_multiplr(profile)) |> div(type_unit_size(type))
            _ -> size |> div(type_unit_size(type))
          end
      end
    size
  end

  def translate(raw_data, profile, type) do
    case profile do
      :ascii ->
        case type do
          :x -> Base.decode16!(raw_data)
          :z -> raw_data
          _ -> raw_data
        end
      :bin ->
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

   def form_bmp(disassembled, profile) do

    import Bitwise

    bit_list =
      1..127
        |> Enum.reduce([],
          fn x, acc ->
            case Map.has_key?(disassembled, x) do
              true -> [x|acc]
              false -> acc
            end
          end)
        |> Enum.reverse

    map1 = Enum.reduce(bit_list, %{},
      fn x, acc -> Map.update(
        acc, div(x, 8), (1 <<< (8-rem(x,8))),
          fn cur_val -> cur_val + (1 <<< (8-rem(x,8))) end
        ) end)

    map1 = case Enum.any?(bit_list, fn x -> x > 64 end) do
        true -> Map.update!(map1, (1 <<< 7), fn x -> x + (1 <<< 7) end)
        false -> map1
    end

    bmp = case Enum.any?(bit_list, fn x -> x > 64 end) do
      true -> Enum.reduce(0..15, <<>>, fn x, acc -> acc <> <<Map.get(map1, x, 0)>> end)
      false -> Enum.reduce(0..7, <<>>, fn x, acc -> acc <> <<Map.get(map1, x, 0)>> end)
    end

    case profile do
      :ascii -> Base.encode16(bmp)
      :bin -> bmp
    end

    bmp
   end

  def bitmap_to_list(bitmap) do
    case is_binary(bitmap) do
      true ->
        for(<<r::1 <- bitmap>>, do: r)
        |> Enum.with_index(1)
        |> Enum.map(fn {a, b} -> {b, a} end)
        # remove field where the bit was not set
        |> Enum.filter(fn {_, b} -> b == 1 end)
        |> Enum.map(fn {a, _} -> a end)

      false ->
        []
    end
  end
end
