defmodule Iso8583ParserDisassableBinFirstBmpOnlyTest do
  use ExUnit.Case, async: true
  doctest Iso8583Parser

  test "binary msg field bin, numeric(h), track 2(h)" do
    import Bitwise

    bit_list = [2,3,4]

    map1 = Enum.reduce(bit_list, %{},
      fn x, acc -> Map.update(
        acc, div(x, 8), (1 <<< (8-rem(x,8))),
          fn cur_val -> cur_val + (1 <<< (8-rem(x,8))) end
        ) end)

    # produce a binary representation from the map above
    bmp = Enum.reduce(0..7, <<>>, fn x, acc -> acc <> <<Map.get(map1, x, 0)>> end)

    f2_val = <<128,0,0,0,0,0,0,0>>
    f2 = f2_val

    f3_val = "1234"
    f3_len = f3_val |> String.length |> Integer.to_string() |> String.pad_leading(2, "0") |> Base.decode16!()
    f3 = f3_len <> Base.decode16!(f3_val)

    f4_val = "0506070809010011121314151617181920212"
    f4_len = f4_val |> String.length |> Integer.to_string() |> Base.decode16!()
    f4 = f4_len <> Base.decode16!(f4_val <> "0")

    isomsg = bmp <> f2 <> f3 <> f4

    spec = %{
      2 => {0, :x, 64},
      3 => {2, :n, 6},
      4 => {2, :z, 37},
    }

    diassambled = Iso8583Parser.disassemble(isomsg, spec, :bin)

    %{
      2 => f2,
      3 => f3,
      4 => f4
    } = diassambled

    assert(f2 == f2_val)
    assert(f3 == f3_val)
    assert(f4 == f4_val)

  end

  test "binary msg field bin(64), numeric(6), numeric(8)" do

    import Bitwise

    bit_list = [2,3,4]

    map1 = Enum.reduce(bit_list, %{},
      fn x, acc -> Map.update(
        acc, div(x, 8), (1 <<< (8-rem(x,8))),
          fn cur_val -> cur_val + (1 <<< (8-rem(x,8))) end
        ) end)

    # produce a binary representation from the map above
    bmp = Enum.reduce(0..7, <<>>, fn x, acc -> acc <> <<Map.get(map1, x, 0)>> end)

    f2_val = <<128,0,0,0,0,0,0,0>>
    f2 = f2_val

    f3_val = "123456"
    f3 = Base.decode16!(f3_val)

    f4_val = "87654321"
    f4 = Base.decode16!(f4_val)

    isomsg = bmp <> f2 <> f3 <> f4

    spec = %{
      2 => {0, :x, 64},
      3 => {0, :n, 6},
      4 => {0, :n, 8},
    }

    diassambled = Iso8583Parser.disassemble(isomsg, spec, :bin)

    %{
      2 => f2_out,
      3 => f3_out,
      4 => f4_out
    } = diassambled

    assert(f2_out == f2_val)
    assert(f3_out == f3_val)
    assert(f4_out == f4_val)

  end

  test "binary msg field bin(64), numeric(26), numeric(18)" do

    import Bitwise

    bit_list = [2,3,4]

    map1 = Enum.reduce(bit_list, %{},
      fn x, acc -> Map.update(
        acc, div(x, 8), (1 <<< (8-rem(x,8))),
          fn cur_val -> cur_val + (1 <<< (8-rem(x,8))) end
        ) end)

    # produce a binary representation from the map above
    bmp = Enum.reduce(0..7, <<>>, fn x, acc -> acc <> <<Map.get(map1, x, 0)>> end)

    f2_val = <<128,0,0,0,0,0,0,0>>
    f2 = f2_val

    f3_val = "12345678901234567890123456"
    f3 = Base.decode16!(f3_val)

    f4_val = "876543212346789012"
    f4 = Base.decode16!(f4_val)

    isomsg = bmp <> f2 <> f3 <> f4

    spec = %{
      2 => {0, :x, 64},
      3 => {0, :n, 26},
      4 => {0, :n, 18},
    }

    diassambled = Iso8583Parser.disassemble(isomsg, spec, :bin)

    %{
      2 => f2_out,
      3 => f3_out,
      4 => f4_out
    } = diassambled

    assert(f2_out == f2_val)
    assert(f3_out == f3_val)
    assert(f4_out == f4_val)

  end

  test "binary msg field bin(32), numeric(15), numeric(8)" do

    import Bitwise

    bit_list = [2,3,4]

    map1 = Enum.reduce(bit_list, %{},
      fn x, acc -> Map.update(
        acc, div(x, 8), (1 <<< (8-rem(x,8))),
          fn cur_val -> cur_val + (1 <<< (8-rem(x,8))) end
        ) end)

    # produce a binary representation from the map above
    bmp = Enum.reduce(0..7, <<>>, fn x, acc -> acc <> <<Map.get(map1, x, 0)>> end)

    f2_val = <<128,0,0,0>>
    f2 = f2_val

    f3_val = "123456789012345"
    f3 = Base.decode16!(f3_val <> "0")  ## pad right with zero

    f4_val = "87654321"
    f4 = Base.decode16!(f4_val)

    isomsg = bmp <> f2 <> f3 <> f4

    spec = %{
      2 => {0, :x, 32},
      3 => {0, :n, 15},
      4 => {0, :n, 8},
    }

    diassambled = Iso8583Parser.disassemble(isomsg, spec, :bin)

    %{
      2 => f2_out,
      3 => f3_out,
      4 => f4_out
    } = diassambled

    assert(f2_out == f2_val)
    assert(f3_out == f3_val)
    assert(f4_out == f4_val)

  end

  test "binary msg field bin(8), (2)numeric(15), (2)numeric(8)" do

    import Bitwise

    bit_list = [2,3,4]

    # produce a map like this %{0 => 64, 1=> 96} where the 64 contains all bits set for the byte
    # the flow is:
    # 1. update the map where key is byte position of the bit with formula (bitpos / 8)
    # 2. and value is produced with this formula (8-rem(bitpos,8))
    #     its like that because rem always produce whats left from at the right of they byte however because bitmap start from left, so we do 8 - rem(bitpos,8)
    #     then bitshift 1 to the left as according to the bit position
    # 3. the default value is assigned to the same logic as above in case thats the first iteration the key was encountered
    # 4. if the map byte position already have value, sum the previous value and current value
    map1 = Enum.reduce(bit_list, %{},
      fn x, acc -> Map.update(
        acc, div(x, 8), (1 <<< (8-rem(x,8))),
          fn cur_val -> cur_val + (1 <<< (8-rem(x,8))) end
        ) end)

    # produce a binary representation from the map above
    bmp = Enum.reduce(0..7, <<>>, fn x, acc -> acc <> <<Map.get(map1, x, 0)>> end)

    f2_val = <<128,0,0,0>>
    f2 = f2_val

    f3_val = "123456789012"
    f3_len = f3_val |> String.length |> Integer.to_string() |> String.pad_leading(2, "0") |> Base.decode16!()
    f3 = f3_len <> Base.decode16!(f3_val)

    f4_val = "87654321"
    f4_len = f4_val |> String.length |> Integer.to_string() |> String.pad_leading(2, "0") |> Base.decode16!()
    f4 = f4_len <> Base.decode16!(f4_val)

    isomsg = bmp <> f2 <> f3 <> f4

    spec = %{
      2 => {0, :x, 32},
      3 => {2, :n, 15},
      4 => {2, :n, 8},
    }

    diassambled = Iso8583Parser.disassemble(isomsg, spec, :bin)

    %{
      2 => f2_out,
      3 => f3_out,
      4 => f4_out
    } = diassambled

    assert(f2_out == f2_val)
    assert(f3_out == f3_val)
    assert(f4_out == f4_val)

  end

  test "binary msg field (2)numeric(25), (2)numeric(7), ascii(20)" do

    import Bitwise

    bit_list = [2,3,4]

    map1 = Enum.reduce(bit_list, %{},
      fn x, acc -> Map.update(
        acc, div(x, 8), (1 <<< (8-rem(x,8))),
          fn cur_val -> cur_val + (1 <<< (8-rem(x,8))) end
        ) end)

    # produce a binary representation from the map above
    bmp = Enum.reduce(0..7, <<>>, fn x, acc -> acc <> <<Map.get(map1, x, 0)>> end)

    f2_val = "123456789012345"
    f2_len = f2_val |> String.length |> Integer.to_string() |> Base.decode16!()
    f2 = f2_len <> Base.decode16!(f2_val <> "0") # pad right because not even

    f3_val = "8765432"
    f3_len = f3_val |> String.length |> Integer.to_string() |> String.pad_leading(2, "0") |> Base.decode16!()
    f3 = f3_len <> Base.decode16!(f3_val <> "0") # pad right because not even

    f4_val = "abcdefghijklmnopqrst"
    f4 = f4_val

    isomsg = bmp <> f2 <> f3 <> f4

    spec = %{
      2 => {2, :n, 25},
      3 => {2, :n, 7},
      4 => {0, :a, 20},
    }

    diassambled = Iso8583Parser.disassemble(isomsg, spec, :bin)

    %{
      2 => f2_out,
      3 => f3_out,
      4 => f4_out
    } = diassambled

    assert(f2_out == f2_val)
    assert(f3_out == f3_val)
    assert(f4_out == f4_val)

  end

  test "binary msg field (2)numeric(2), numeric(7), ascii(19)" do

    import Bitwise

    bit_list = [2,3,4]

    map1 = Enum.reduce(bit_list, %{},
      fn x, acc -> Map.update(
        acc, div(x, 8), (1 <<< (8-rem(x,8))),
          fn cur_val -> cur_val + (1 <<< (8-rem(x,8))) end
        ) end)

    # produce a binary representation from the map above
    bmp = Enum.reduce(0..7, <<>>, fn x, acc -> acc <> <<Map.get(map1, x, 0)>> end)

    f2_val = "12"
    f2_len = f2_val |> String.length |> Integer.to_string() |> String.pad_leading(2, "0") |> Base.decode16!()
    f2 = f2_len <> Base.decode16!(f2_val)

    f3_val = "8765432"
    f3 = Base.decode16!(f3_val <> "0") # pad right because not even

    f4_val = "abcdefghijklmnopqrs"
    f4 = f4_val

    isomsg = bmp <> f2 <> f3 <> f4

    spec = %{
      2 => {2, :n, 25},
      3 => {0, :n, 7},
      4 => {0, :a, 19},
    }

    diassambled = Iso8583Parser.disassemble(isomsg, spec, :bin)

    %{
      2 => f2_out,
      3 => f3_out,
      4 => f4_out
    } = diassambled

    assert(f2_out == f2_val)
    assert(f3_out == f3_val)
    assert(f4_out == f4_val)

  end

  test "binary msg field (3)numeric(5), numeric(7), (2)ascii(8)" do

    import Bitwise

    bit_list = [2,3,4]

    map1 = Enum.reduce(bit_list, %{},
      fn x, acc -> Map.update(
        acc, div(x, 8), (1 <<< (8-rem(x,8))),
          fn cur_val -> cur_val + (1 <<< (8-rem(x,8))) end
        ) end)

    # produce a binary representation from the map above
    bmp = Enum.reduce(0..7, <<>>, fn x, acc -> acc <> <<Map.get(map1, x, 0)>> end)

    f2_val = "12345"
    f2_len = f2_val |> String.length |> Integer.to_string() |> String.pad_leading(4, "0") |> Base.decode16!()
    f2 = f2_len <> Base.decode16!(f2_val <> "0")

    f3_val = "8765432"
    f3 = Base.decode16!(f3_val <> "0") # pad right because not even

    f4_val = "abcdefgh"
    f4_len = f4_val |> String.length |> Integer.to_string() |> String.pad_leading(2, "0") |> Base.decode16!()
    f4 = f4_len <> f4_val

    isomsg = bmp <> f2 <> f3 <> f4

    spec = %{
      2 => {3, :n, 999},
      3 => {0, :n, 7},
      4 => {2, :a, 8},
    }

    diassambled = Iso8583Parser.disassemble(isomsg, spec, :bin)

    %{
      2 => f2_out,
      3 => f3_out,
      4 => f4_out
    } = diassambled

    assert(f2_out == f2_val)
    assert(f3_out == f3_val)
    assert(f4_out == f4_val)

  end


  test "binary msg field ascii(15), ascii(12), (3)binary(999)" do

    import Bitwise

    bit_list = [2,3,4]

    map1 = Enum.reduce(bit_list, %{},
      fn x, acc -> Map.update(
        acc, div(x, 8), (1 <<< (8-rem(x,8))),
          fn cur_val -> cur_val + (1 <<< (8-rem(x,8))) end
        ) end)

    # produce a binary representation from the map above
    bmp = Enum.reduce(0..7, <<>>, fn x, acc -> acc <> <<Map.get(map1, x, 0)>> end)

    f2_val = "123456789012345"
    f2 = f2_val

    f3_val = "876543210123"
    f3 = f3_val

    f4_val = <<1,2,3,4,5,6,7>>
    f4_len = f4_val |> String.length()
    f4_len = f4_len * 8 |> Integer.to_string() |> String.pad_leading(4, "0") |> Base.decode16!()
    f4 = f4_len <> f4_val

    isomsg = bmp <> f2 <> f3 <> f4

    spec = %{
      2 => {0, :a, 15},
      3 => {0, :a, 12},
      4 => {3, :x, 999},
    }

    diassambled = Iso8583Parser.disassemble(isomsg, spec, :bin)

    %{
      2 => f2_out,
      3 => f3_out,
      4 => f4_out
    } = diassambled

    assert(f2_out == f2_val)
    assert(f3_out == f3_val)
    assert(f4_out == f4_val)

  end

  test "binary msg field (2)track2(39), num(12), (3)ascii(999)" do

    import Bitwise

    bit_list = [2,3,4]

    map1 = Enum.reduce(bit_list, %{},
      fn x, acc -> Map.update(
        acc, div(x, 8), (1 <<< (8-rem(x,8))),
          fn cur_val -> cur_val + (1 <<< (8-rem(x,8))) end
        ) end)

    # produce a binary representation from the map above
    bmp = Enum.reduce(0..7, <<>>, fn x, acc -> acc <> <<Map.get(map1, x, 0)>> end)

    f2_val = "123456789012345678901234567890123456789"
    f2_len = f2_val |> String.length()
    f2_len = f2_len |> Integer.to_string() |> String.pad_leading(2, "0") |> Base.decode16!()
    f2 = f2_len <> Base.decode16!(f2_val <> "0")

    f3_val = "876543210123"
    f3 = Base.decode16!(f3_val)

    f4_val = "8765432101234567890123456"
    f4_len = f4_val |> String.length()
    f4_len = f4_len |> Integer.to_string() |> String.pad_leading(4, "0") |> Base.decode16!()
    f4 = f4_len <> f4_val

    isomsg = bmp <> f2 <> f3 <> f4

    spec = %{
      2 => {2, :z, 39},
      3 => {0, :n, 12},
      4 => {3, :a, 999},
    }

    diassambled = Iso8583Parser.disassemble(isomsg, spec, :bin)

    %{
      2 => f2_out,
      3 => f3_out,
      4 => f4_out
    } = diassambled

    assert(f2_out == f2_val)
    assert(f3_out == f3_val)
    assert(f4_out == f4_val)

  end


  test "binary msg field (2)track2(10), (2)num(50), (2)ascii(999)" do

    import Bitwise

    bit_list = [2,3,4]

    map1 = Enum.reduce(bit_list, %{},
      fn x, acc -> Map.update(
        acc, div(x, 8), (1 <<< (8-rem(x,8))),
          fn cur_val -> cur_val + (1 <<< (8-rem(x,8))) end
        ) end)

    # produce a binary representation from the map above
    bmp = Enum.reduce(0..7, <<>>, fn x, acc -> acc <> <<Map.get(map1, x, 0)>> end)

    f2_val = "1234567890"
    f2_len = f2_val |> String.length()
    f2_len = f2_len |> Integer.to_string() |> String.pad_leading(2, "0") |> Base.decode16!()
    f2 = f2_len <> Base.decode16!(f2_val)

    f3_val = "876543210123"
    f3_len = f3_val |> String.length()
    f3_len = f3_len |> Integer.to_string() |> String.pad_leading(2, "0") |> Base.decode16!()
    f3 = f3_len <> Base.decode16!(f3_val)

    f4_val = "8765432101234567890123456"
    f4_len = f4_val |> String.length()
    f4_len = f4_len |> Integer.to_string() |> String.pad_leading(2, "0") |> Base.decode16!()
    f4 = f4_len <> f4_val

    isomsg = bmp <> f2 <> f3 <> f4

    spec = %{
      2 => {2, :z, 39},
      3 => {2, :n, 50},
      4 => {2, :a, 999},
    }

    diassambled = Iso8583Parser.disassemble(isomsg, spec, :bin)

    %{
      2 => f2_out,
      3 => f3_out,
      4 => f4_out
    } = diassambled

    assert(f2_out == f2_val)
    assert(f3_out == f3_val)
    assert(f4_out == f4_val)

  end

  test "binary msg field (2)binary(50), (1)ascii(5), ascii(7)" do

    import Bitwise

    bit_list = [2,3,4]

    map1 = Enum.reduce(bit_list, %{},
      fn x, acc -> Map.update(
        acc, div(x, 8), (1 <<< (8-rem(x,8))),
          fn cur_val -> cur_val + (1 <<< (8-rem(x,8))) end
        ) end)

    # produce a binary representation from the map above
    bmp = Enum.reduce(0..7, <<>>, fn x, acc -> acc <> <<Map.get(map1, x, 0)>> end)

    f2_val = <<1,2,3,4,5>>
    f2_len = f2_val |> byte_size()
    f2_len = f2_len * 8
    f2_len = f2_len |> Integer.to_string() |> String.pad_leading(2, "0") |> Base.decode16!()
    f2 = f2_len <> f2_val

    f3_val = "876543210123"
    f3_len = f3_val |> String.length()
    f3_len = f3_len |> Integer.to_string() |> String.pad_leading(2, "0") |> Base.decode16!()
    f3 = f3_len <> f3_val

    f4_val = "8765456"
    f4 = f4_val

    isomsg = bmp <> f2 <> f3 <> f4

    spec = %{
      2 => {2, :x, 50},
      3 => {1, :a, 5},
      4 => {0, :a, 7},
    }

    diassambled = Iso8583Parser.disassemble(isomsg, spec, :bin)

    %{
      2 => f2_out,
      3 => f3_out,
      4 => f4_out
    } = diassambled

    assert(f2_out == f2_val)
    assert(f3_out == f3_val)
    assert(f4_out == f4_val)

  end

  test "binary msg field (1)binary(10), ascii(7), binary(64)" do

    import Bitwise

    bit_list = [2,3,4]

    map1 = Enum.reduce(bit_list, %{},
      fn x, acc -> Map.update(
        acc, div(x, 8), (1 <<< (8-rem(x,8))),
          fn cur_val -> cur_val + (1 <<< (8-rem(x,8))) end
        ) end)

    # produce a binary representation from the map above
    bmp = Enum.reduce(0..7, <<>>, fn x, acc -> acc <> <<Map.get(map1, x, 0)>> end)

    f2_val = <<1>>
    f2_len = f2_val |> byte_size()
    f2_len = f2_len * 8
    f2_len = f2_len |> Integer.to_string() |> String.pad_leading(2, "0") |> Base.decode16!()
    f2 = f2_len <> f2_val

    f3_val = "8765432"
    f3 = f3_val

    f4_val = <<1,2,3,4,5,6,7,8>>
    f4 = f4_val

    isomsg = bmp <> f2 <> f3 <> f4

    spec = %{
      2 => {1, :x, 10},
      3 => {0, :a, 7},
      4 => {0, :x, 64},
    }

    diassambled = Iso8583Parser.disassemble(isomsg, spec, :bin)

    %{
      2 => f2_out,
      3 => f3_out,
      4 => f4_out
    } = diassambled

    assert(f2_out == f2_val)
    assert(f3_out == f3_val)
    assert(f4_out == f4_val)

  end


end
