
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

  def decode(raw_data, profile, type) do
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
      2..128
        |> Enum.reduce([],
          fn x, acc ->
            case Map.has_key?(disassembled, x) do
              true -> [x|acc]
              false -> acc
            end
          end)
        |> Enum.reverse

    map1 = case Enum.any?(bit_list, fn x -> x > 64 end) do
      true -> %{0 => 128}
      false -> %{}
      end

    # description of logic below:
    # - the destination is map1
    # - map key is the position of byte starting with 0
    # - map value is the byte value
    # - to calculate byte position, division operation is used, however problem if the position is divisible by 8 then it will get the next byte
    # - so need to check if division by 8 will not produce remainder, if yes then minus 1, otherwise use the normal calculation, this detail is regarding this part:
    # -   rem(x,8) == 0 && div(x,8)-1 || div(x, 8)
    # - another similar issue during calculating the bmp value for the position divisible by 8
    # - under situation whenthe pos value divided by 8 produce reminder, since the reminder is actually from the next byte,
    # - the correct way to calculate is to minus the reminder to 8
    # - however this is problematic if the reminder is 0, it will bitshift by 8 that cause a byte to overflow to 256
    # - so, in case reminder is 0, just set as 1
      map1 = Enum.reduce(bit_list, map1,
      fn x, acc -> Map.update(
        acc, rem(x,8) == 0 && div(x,8)-1 || div(x, 8), (rem(x,8) == 0 && 1 || 1 <<< (8-rem(x,8))),
          fn cur_val -> cur_val + (rem(x,8) == 0 && 1 || 1 <<< (8-rem(x,8))) end
        ) end)

    bmp = case Enum.any?(bit_list, fn x -> x > 64 end) do
      true -> Enum.reduce(0..15, <<>>, fn x, acc -> acc <> <<Map.get(map1, x, 0)>> end)
      false -> Enum.reduce(0..7, <<>>, fn x, acc -> acc <> <<Map.get(map1, x, 0)>> end)
    end

    bmp = case profile do
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

  def truncate_data(type, size, data) do
    case type do
      :x ->
        case byte_size(data) > div(size,8) do
          true ->
            {:ok, remain, _removed} = chomp(data, div(size,8))
            remain
          false -> data
        end
      _ ->
        case String.length(data) > size do
          true ->
            {:ok, remain, _removed} = chomp(data, size)
            remain
          false -> data
        end
    end
  end
end
