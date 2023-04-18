defmodule Iso8583ParserDisassableBinFirstAndSecondBmpTest do
  use ExUnit.Case, async: true
  doctest Iso8583Parser

  test "binary msg field bin, numeric(h), track 2(h)" do
    import Bitwise

    bit_list = [1, 30,66,67]

    map1 = Enum.reduce(bit_list, %{},
      fn x, acc -> Map.update(
        acc, div(x, 8), (1 <<< (8-rem(x,8))),
          fn cur_val -> cur_val + (1 <<< (8-rem(x,8))) end
        ) end)

    # produce a binary representation from the map above
    bmp = Enum.reduce(0..15, <<>>, fn x, acc -> acc <> <<Map.get(map1, x, 0)>> end)

    f30_val = <<128,0,0,0,0,0,0,0>>
    f30 = f30_val

    f66_val = "1234"
    f66_len = f66_val |> String.length |> Integer.to_string() |> String.pad_leading(2, "0") |> Base.decode16!()
    f66 = f66_len <> Base.decode16!(f66_val)

    f67_val = "0506070809010011121314151617181920212"
    f67_len = f67_val |> String.length |> Integer.to_string() |> Base.decode16!()
    f67 = f67_len <> Base.decode16!(f67_val <> "0")

    isomsg = bmp <> f30 <> f66 <> f67

    spec = %{
      1 => {0, :x, 64},
      30 => {0, :x, 64},
      66 => {2, :n, 6},
      67 => {2, :z, 37},
    }

    diassambled = Iso8583Parser.disassemble(isomsg, spec, :bin)

    %{
      1 => _,
      30 => f65_out,
      66 => f66_out,
      67 => f67_out
    } = diassambled

    assert(f65_out == f30_val)
    assert(f66_out == f66_val)
    assert(f67_out == f67_val)

  end

  test "binary msg field bin(64), numeric(6), numeric(8)" do

    import Bitwise

    bit_list = [1,30,66,67]

    map1 = Enum.reduce(bit_list, %{},
      fn x, acc -> Map.update(
        acc, div(x, 8), (1 <<< (8-rem(x,8))),
          fn cur_val -> cur_val + (1 <<< (8-rem(x,8))) end
        ) end)

    # produce a binary representation from the map above
    bmp = Enum.reduce(0..15, <<>>, fn x, acc -> acc <> <<Map.get(map1, x, 0)>> end)

    f30_val = <<128,0,0,0,0,0,0,0>>
    f30 = f30_val

    f66_val = "123456"
    f66 = Base.decode16!(f66_val)

    f67_val = "87654321"
    f67 = Base.decode16!(f67_val)

    isomsg = bmp <> f30 <> f66 <> f67

    spec = %{
      1 => {0, :x, 64},
      30 => {0, :x, 64},
      66 => {0, :n, 6},
      67 => {0, :n, 8},
    }

    diassambled = Iso8583Parser.disassemble(isomsg, spec, :bin)

    %{
      1 => _,
      30 => f65_out,
      66 => f66_out,
      67 => f67_out
    } = diassambled

    assert(f65_out == f30_val)
    assert(f66_out == f66_val)
    assert(f67_out == f67_val)

  end

  test "binary msg field bin(64), numeric(26), numeric(18)" do

    import Bitwise

    bit_list = [1,30,66,67]

    map1 = Enum.reduce(bit_list, %{},
      fn x, acc -> Map.update(
        acc, div(x, 8), (1 <<< (8-rem(x,8))),
          fn cur_val -> cur_val + (1 <<< (8-rem(x,8))) end
        ) end)

    # produce a binary representation from the map above
    bmp = Enum.reduce(0..15, <<>>, fn x, acc -> acc <> <<Map.get(map1, x, 0)>> end)

    f30_val = <<128,0,0,0,0,0,0,0>>
    f30 = f30_val

    f66_val = "12345678901234567890123456"
    f66 = Base.decode16!(f66_val)

    f67_val = "876543212346789012"
    f67 = Base.decode16!(f67_val)

    isomsg = bmp <> f30 <> f66 <> f67

    spec = %{
      1 => {0, :x, 64},
      30 => {0, :x, 64},
      66 => {0, :n, 26},
      67 => {0, :n, 18},
    }

    diassambled = Iso8583Parser.disassemble(isomsg, spec, :bin)

    %{
      1 => _,
      30 => f65_out,
      66 => f66_out,
      67 => f67_out
    } = diassambled

    assert(f65_out == f30_val)
    assert(f66_out == f66_val)
    assert(f67_out == f67_val)

  end

  test "binary msg field bin(32), numeric(15), numeric(8)" do

    import Bitwise

    bit_list = [1, 30, 66, 67]

    map1 = Enum.reduce(bit_list, %{},
      fn x, acc -> Map.update(
        acc, div(x, 8), (1 <<< (8-rem(x,8))),
          fn cur_val -> cur_val + (1 <<< (8-rem(x,8))) end
        ) end)

    # produce a binary representation from the map above
    bmp = Enum.reduce(0..15, <<>>, fn x, acc -> acc <> <<Map.get(map1, x, 0)>> end)

    f30_val = <<128,0,0,0>>
    f30 = f30_val

    f66_val = "123456789012345"
    f66 = Base.decode16!(f66_val <> "0")  ## pad right with zero

    f67_val = "87654321"
    f67 = Base.decode16!(f67_val)

    isomsg = bmp <> f30 <> f66 <> f67

    spec = %{
      1 => {0, :x, 64},
      30 => {0, :x, 32},
      66 => {0, :n, 15},
      67 => {0, :n, 8},
    }

    diassambled = Iso8583Parser.disassemble(isomsg, spec, :bin)

    %{
      1 => _,
      30 => f65_out,
      66 => f66_out,
      67 => f67_out
    } = diassambled

    assert(f65_out == f30_val)
    assert(f66_out == f66_val)
    assert(f67_out == f67_val)

  end

  test "binary msg field bin(8), (2)numeric(15), (2)numeric(8)" do

    import Bitwise

    bit_list = [1, 30, 66, 67]

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
    bmp = Enum.reduce(0..15, <<>>, fn x, acc -> acc <> <<Map.get(map1, x, 0)>> end)

    f30_val = <<128,0,0,0>>
    f30 = f30_val

    f66_val = "123456789012"
    f66_len = f66_val |> String.length |> Integer.to_string() |> String.pad_leading(2, "0") |> Base.decode16!()
    f66 = f66_len <> Base.decode16!(f66_val)

    f67_val = "87654321"
    f67_len = f67_val |> String.length |> Integer.to_string() |> String.pad_leading(2, "0") |> Base.decode16!()
    f67 = f67_len <> Base.decode16!(f67_val)

    isomsg = bmp <> f30 <> f66 <> f67

    spec = %{
      1 => {0, :x, 64},
      30 => {0, :x, 32},
      66 => {2, :n, 15},
      67 => {2, :n, 8},
    }

    diassambled = Iso8583Parser.disassemble(isomsg, spec, :bin)

    %{
      1 => _,
      30 => f65_out,
      66 => f66_out,
      67 => f67_out
    } = diassambled

    assert(f65_out == f30_val)
    assert(f66_out == f66_val)
    assert(f67_out == f67_val)

  end

  test "binary msg field (2)numeric(25), (2)numeric(7), ascii(20)" do

    import Bitwise

    bit_list = [1, 30, 66, 67]

    map1 = Enum.reduce(bit_list, %{},
      fn x, acc -> Map.update(
        acc, div(x, 8), (1 <<< (8-rem(x,8))),
          fn cur_val -> cur_val + (1 <<< (8-rem(x,8))) end
        ) end)

    # produce a binary representation from the map above
    bmp = Enum.reduce(0..15, <<>>, fn x, acc -> acc <> <<Map.get(map1, x, 0)>> end)

    f30_val = "123456789012345"
    f65_len = f30_val |> String.length |> Integer.to_string() |> Base.decode16!()
    f30 = f65_len <> Base.decode16!(f30_val <> "0") # pad right because not even

    f66_val = "8765432"
    f66_len = f66_val |> String.length |> Integer.to_string() |> String.pad_leading(2, "0") |> Base.decode16!()
    f66 = f66_len <> Base.decode16!(f66_val <> "0") # pad right because not even

    f67_val = "abcdefghijklmnopqrst"
    f67 = f67_val

    isomsg = bmp <> f30 <> f66 <> f67

    spec = %{
      1 => {0, :x, 64},
      30 => {2, :n, 25},
      66 => {2, :n, 7},
      67 => {0, :a, 20},
    }

    diassambled = Iso8583Parser.disassemble(isomsg, spec, :bin)

    %{
      1 => _,
      30 => f65_out,
      66 => f66_out,
      67 => f67_out
    } = diassambled

    assert(f65_out == f30_val)
    assert(f66_out == f66_val)
    assert(f67_out == f67_val)

  end

  test "binary msg field (2)numeric(2), numeric(7), ascii(19)" do

    import Bitwise

    bit_list = [1, 30, 66, 67]

    map1 = Enum.reduce(bit_list, %{},
      fn x, acc -> Map.update(
        acc, div(x, 8), (1 <<< (8-rem(x,8))),
          fn cur_val -> cur_val + (1 <<< (8-rem(x,8))) end
        ) end)

    # produce a binary representation from the map above
    bmp = Enum.reduce(0..15, <<>>, fn x, acc -> acc <> <<Map.get(map1, x, 0)>> end)

    f30_val = "12"
    f65_len = f30_val |> String.length |> Integer.to_string() |> String.pad_leading(2, "0") |> Base.decode16!()
    f30 = f65_len <> Base.decode16!(f30_val)

    f66_val = "8765432"
    f66 = Base.decode16!(f66_val <> "0") # pad right because not even

    f67_val = "abcdefghijklmnopqrs"
    f67 = f67_val

    isomsg = bmp <> f30 <> f66 <> f67

    spec = %{
      1 => {0, :x, 64},
      30 => {2, :n, 25},
      66 => {0, :n, 7},
      67 => {0, :a, 19},
    }

    diassambled = Iso8583Parser.disassemble(isomsg, spec, :bin)

    %{
      1 => _,
      30 => f65_out,
      66 => f66_out,
      67 => f67_out
    } = diassambled

    assert(f65_out == f30_val)
    assert(f66_out == f66_val)
    assert(f67_out == f67_val)

  end

  test "binary msg field (3)numeric(5), numeric(7), (2)ascii(8)" do

    import Bitwise

    bit_list = [1, 30, 66, 67]

    map1 = Enum.reduce(bit_list, %{},
      fn x, acc -> Map.update(
        acc, div(x, 8), (1 <<< (8-rem(x,8))),
          fn cur_val -> cur_val + (1 <<< (8-rem(x,8))) end
        ) end)

    # produce a binary representation from the map above
    bmp = Enum.reduce(0..15, <<>>, fn x, acc -> acc <> <<Map.get(map1, x, 0)>> end)

    f30_val = "12345"
    f65_len = f30_val |> String.length |> Integer.to_string() |> String.pad_leading(4, "0") |> Base.decode16!()
    f30 = f65_len <> Base.decode16!(f30_val <> "0")

    f66_val = "8765432"
    f66 = Base.decode16!(f66_val <> "0") # pad right because not even

    f67_val = "abcdefgh"
    f67_len = f67_val |> String.length |> Integer.to_string() |> String.pad_leading(2, "0") |> Base.decode16!()
    f67 = f67_len <> f67_val

    isomsg = bmp <> f30 <> f66 <> f67

    spec = %{
      1 => {0, :x, 64},
      30 => {3, :n, 999},
      66 => {0, :n, 7},
      67 => {2, :a, 8},
    }

    diassambled = Iso8583Parser.disassemble(isomsg, spec, :bin)

    %{
      1 => _,
      30 => f65_out,
      66 => f66_out,
      67 => f67_out
    } = diassambled

    assert(f65_out == f30_val)
    assert(f66_out == f66_val)
    assert(f67_out == f67_val)

  end


  test "binary msg field ascii(15), ascii(12), (3)binary(999)" do

    import Bitwise

    bit_list = [1, 30, 66, 67]

    map1 = Enum.reduce(bit_list, %{},
      fn x, acc -> Map.update(
        acc, div(x, 8), (1 <<< (8-rem(x,8))),
          fn cur_val -> cur_val + (1 <<< (8-rem(x,8))) end
        ) end)

    # produce a binary representation from the map above
    bmp = Enum.reduce(0..15, <<>>, fn x, acc -> acc <> <<Map.get(map1, x, 0)>> end)

    f30_val = "123456789012345"
    f30 = f30_val

    f66_val = "876543210123"
    f66 = f66_val

    f67_val = <<1,2,3,4,5,6,7>>
    f67_len = f67_val |> String.length()
    f67_len = f67_len * 8 |> Integer.to_string() |> String.pad_leading(4, "0") |> Base.decode16!()
    f67 = f67_len <> f67_val

    isomsg = bmp <> f30 <> f66 <> f67

    spec = %{
      1 => {0, :x, 64},
      30 => {0, :a, 15},
      66 => {0, :a, 12},
      67 => {3, :x, 999},
    }

    diassambled = Iso8583Parser.disassemble(isomsg, spec, :bin)

    %{
      1 => _,
      30 => f65_out,
      66 => f66_out,
      67 => f67_out
    } = diassambled

    assert(f65_out == f30_val)
    assert(f66_out == f66_val)
    assert(f67_out == f67_val)

  end

  test "binary msg field (2)track2(39), num(12), (3)ascii(999)" do

    import Bitwise

    bit_list = [1, 30, 66, 67]

    map1 = Enum.reduce(bit_list, %{},
      fn x, acc -> Map.update(
        acc, div(x, 8), (1 <<< (8-rem(x,8))),
          fn cur_val -> cur_val + (1 <<< (8-rem(x,8))) end
        ) end)

    # produce a binary representation from the map above
    bmp = Enum.reduce(0..15, <<>>, fn x, acc -> acc <> <<Map.get(map1, x, 0)>> end)

    f30_val = "123456789012345678901234567890123456789"
    f65_len = f30_val |> String.length()
    f65_len = f65_len |> Integer.to_string() |> String.pad_leading(2, "0") |> Base.decode16!()
    f30 = f65_len <> Base.decode16!(f30_val <> "0")

    f66_val = "876543210123"
    f66 = Base.decode16!(f66_val)

    f67_val = "8765432101234567890123456"
    f67_len = f67_val |> String.length()
    f67_len = f67_len |> Integer.to_string() |> String.pad_leading(4, "0") |> Base.decode16!()
    f67 = f67_len <> f67_val

    isomsg = bmp <> f30 <> f66 <> f67

    spec = %{
      1 => {0, :x, 64},
      30 => {2, :z, 39},
      66 => {0, :n, 12},
      67 => {3, :a, 999},
    }

    diassambled = Iso8583Parser.disassemble(isomsg, spec, :bin)

    %{
      30 => f65_out,
      66 => f66_out,
      67 => f67_out
    } = diassambled

    assert(f65_out == f30_val)
    assert(f66_out == f66_val)
    assert(f67_out == f67_val)

  end


  test "binary msg field (2)track2(10), (2)num(50), (2)ascii(999)" do

    import Bitwise

    bit_list = [1, 30, 66, 67]

    map1 = Enum.reduce(bit_list, %{},
      fn x, acc -> Map.update(
        acc, div(x, 8), (1 <<< (8-rem(x,8))),
          fn cur_val -> cur_val + (1 <<< (8-rem(x,8))) end
        ) end)

    # produce a binary representation from the map above
    bmp = Enum.reduce(0..15, <<>>, fn x, acc -> acc <> <<Map.get(map1, x, 0)>> end)

    f30_val = "1234567890"
    f65_len = f30_val |> String.length()
    f65_len = f65_len |> Integer.to_string() |> String.pad_leading(2, "0") |> Base.decode16!()
    f30 = f65_len <> Base.decode16!(f30_val)

    f66_val = "876543210123"
    f66_len = f66_val |> String.length()
    f66_len = f66_len |> Integer.to_string() |> String.pad_leading(2, "0") |> Base.decode16!()
    f66 = f66_len <> Base.decode16!(f66_val)

    f67_val = "8765432101234567890123456"
    f67_len = f67_val |> String.length()
    f67_len = f67_len |> Integer.to_string() |> String.pad_leading(2, "0") |> Base.decode16!()
    f67 = f67_len <> f67_val

    isomsg = bmp <> f30 <> f66 <> f67

    spec = %{
      1 => {0, :x, 64},
      30 => {2, :z, 39},
      66 => {2, :n, 50},
      67 => {2, :a, 999},
    }

    diassambled = Iso8583Parser.disassemble(isomsg, spec, :bin)

    %{
      1 => _,
      30 => f65_out,
      66 => f66_out,
      67 => f67_out
    } = diassambled

    assert(f65_out == f30_val)
    assert(f66_out == f66_val)
    assert(f67_out == f67_val)

  end

  test "binary msg field (2)binary(50), (1)ascii(5), ascii(7)" do

    import Bitwise

    bit_list = [1, 30, 66, 67]

    map1 = Enum.reduce(bit_list, %{},
      fn x, acc -> Map.update(
        acc, div(x, 8), (1 <<< (8-rem(x,8))),
          fn cur_val -> cur_val + (1 <<< (8-rem(x,8))) end
        ) end)

    # produce a binary representation from the map above
    bmp = Enum.reduce(0..15, <<>>, fn x, acc -> acc <> <<Map.get(map1, x, 0)>> end)

    f30_val = <<1,2,3,4,5>>
    f65_len = f30_val |> byte_size()
    f65_len = f65_len * 8
    f65_len = f65_len |> Integer.to_string() |> String.pad_leading(2, "0") |> Base.decode16!()
    f30 = f65_len <> f30_val

    f66_val = "876543210123"
    f66_len = f66_val |> String.length()
    f66_len = f66_len |> Integer.to_string() |> String.pad_leading(2, "0") |> Base.decode16!()
    f66 = f66_len <> f66_val

    f67_val = "8765456"
    f67 = f67_val

    isomsg = bmp <> f30 <> f66 <> f67

    spec = %{
      1 => {0, :x, 64},
      30 => {2, :x, 50},
      66 => {1, :a, 5},
      67 => {0, :a, 7},
    }

    diassambled = Iso8583Parser.disassemble(isomsg, spec, :bin)

    %{
      1 => _,
      30 => f65_out,
      66 => f66_out,
      67 => f67_out
    } = diassambled

    assert(f65_out == f30_val)
    assert(f66_out == f66_val)
    assert(f67_out == f67_val)

  end

  test "binary msg field (1)binary(10), ascii(7), binary(64)" do

    import Bitwise

    bit_list = [1, 30, 66, 67]

    map1 = Enum.reduce(bit_list, %{},
      fn x, acc -> Map.update(
        acc, div(x, 8), (1 <<< (8-rem(x,8))),
          fn cur_val -> cur_val + (1 <<< (8-rem(x,8))) end
        ) end)

    # produce a binary representation from the map above
    bmp = Enum.reduce(0..15, <<>>, fn x, acc -> acc <> <<Map.get(map1, x, 0)>> end)

    f30_val = <<1>>
    f65_len = f30_val |> byte_size()
    f65_len = f65_len * 8
    f65_len = f65_len |> Integer.to_string() |> String.pad_leading(2, "0") |> Base.decode16!()
    f30 = f65_len <> f30_val

    f66_val = "8765432"
    f66 = f66_val

    f67_val = <<1,2,3,4,5,6,7,8>>
    f67 = f67_val

    isomsg = bmp <> f30 <> f66 <> f67

    spec = %{
      1 => {0, :x, 64},
      30 => {1, :x, 10},
      66 => {0, :a, 7},
      67 => {0, :x, 64},
    }

    diassambled = Iso8583Parser.disassemble(isomsg, spec, :bin)

    %{
      1 => _,
      30 => f65_out,
      66 => f66_out,
      67 => f67_out
    } = diassambled

    assert(f65_out == f30_val)
    assert(f66_out == f66_val)
    assert(f67_out == f67_val)

  end


end
