defmodule Iso8583ParserDisassableBinTest do
  use ExUnit.Case
  doctest Iso8583Parser
  alias Iso8583Pasrser.Helpers

  test "binary msg field bin, numeric(h), track 2(h)" do
    isomsg = <<224,0,0,0,0,0,0,0, 128,0,0,0,0,0,0,0, 4,2,3, 55, 5,6,7,8,9,10,11,12,13,14,15,16,17,18,
     19,20,21,22,23,24,25,26,27,28, 29,30,31,32, 33,34,35,36,37,38,39,
     40, 41,42,43,44,45,46,47>>

    spec = %{
      1 => {0, :x, 64},
      2 => {2, :n, 6},
      3 => {2, :z, 37},
    }

    diassambled = Iso8583Parser.disassemble(isomsg, spec, :bin)

    %{
      1 => f1,
      2 => f2,
      3 => f3
    } = diassambled

    assert(f1 == <<128,0,0,0,0,0,0,0>>)
    assert(byte_size(f2) == 4)
    assert(f2 == "0203")
    assert(byte_size(f3) == Base.encode16(<<55>>) |> String.to_integer) # check if the field length is equal to the specified len
    assert(f3 == binary_part(Base.encode16(<<5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23>>), 0, 37))

  end

  test "binary msg field bin, numeric(6), numeric(8)" do

    import Bitwise

    bmp1 = 1 <<< 7  |||  1 <<< 6  |||  1 <<< 5
    bmp = <<bmp1>> <> <<0,0,0,0,0,0,0>>

    f2_val = "123456"
    f3_val = "87654321"

    f1_in = <<128,0,0,0,0,0,0,0>>
    f2_in = Base.decode16!(f2_val)
    f3_in = Base.decode16!(f3_val)

    isomsg = bmp <> f1_in <> f2_in <> f3_in

    spec = %{
      1 => {0, :x, 64},
      2 => {0, :n, 6},
      3 => {0, :n, 8},
    }

    diassambled = Iso8583Parser.disassemble(isomsg, spec, :bin)

    %{
      1 => f1,
      2 => f2,
      3 => f3
    } = diassambled

    assert(f1 == f1_in)
    assert(f2 == f2_val)
    assert(f3 == f3_val)

  end


end
