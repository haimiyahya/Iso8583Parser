defmodule Iso8583ParserDisectBinBmpTest do
  use ExUnit.Case
  doctest Iso8583Parser
  alias Iso8583Pasrser.Helpers

  test "disect bin bmp 8 bytes" do
    assert(Helpers.dissect_first_bmp(<<10,0,0,0,0,0,0,1>>, :bin) == {<<10,0,0,0,0,0,0,1>>, <<>>})
  end

  test "disect bin bmp 9 bytes" do
    assert(Helpers.dissect_first_bmp(<<10,0,0,0,0,0,0,1, 2>>, :bin) == {<<10,0,0,0,0,0,0,1>>, <<2>>})
  end

  test "disect bin bmp 10 bytes" do
    assert(Helpers.dissect_first_bmp(<<10,0,0,0,0,0,0,1, 2,3>>, :bin) == {<<10,0,0,0,0,0,0,1>>, <<2,3>>})
  end

  test "disect bin bmp 11 bytes" do
    assert(Helpers.dissect_first_bmp(<<10,0,0,0,0,0,0,1, 2,3,4>>, :bin) == {<<10,0,0,0,0,0,0,1>>, <<2,3,4>>})
  end

  test "disect bin bmp 12 bytes" do
    assert(Helpers.dissect_first_bmp(<<10,0,0,0,0,0,0,1, 2,3,4,5>>, :bin) == {<<10,0,0,0,0,0,0,1>>, <<2,3,4,5>>})
  end

  test "disect bin bmp 13 bytes" do
    assert(Helpers.dissect_first_bmp(<<10,0,0,0,0,0,0,1, 2,3,4,5,6>>, :bin) == {<<10,0,0,0,0,0,0,1>>, <<2,3,4,5,6>>})
  end

  test "disect bin bmp 14 bytes" do
    assert(Helpers.dissect_first_bmp(<<10,0,0,0,0,0,0,1, 2,3,4,5,6,7>>, :bin) == {<<10,0,0,0,0,0,0,1>>, <<2,3,4,5,6,7>>})
  end

  test "disect bin bmp 15 bytes" do
    assert(Helpers.dissect_first_bmp(<<10,0,0,0,0,0,0,1, 2,3,4,5,6,7,8>>, :bin) == {<<10,0,0,0,0,0,0,1>>, <<2,3,4,5,6,7,8>>})
  end

  test "disect bin bmp 16 bytes" do
    assert(Helpers.dissect_first_bmp(<<10,0,0,0,0,0,0,1, 2,3,4,5,6,7,8,9>>, :bin) == {<<10,0,0,0,0,0,0,1>>, <<2,3,4,5,6,7,8,9>>})
  end

  test "disect bin bmp 17 bytes" do
    assert(Helpers.dissect_first_bmp(<<10,0,0,0,0,0,0,1, 2,3,4,5,6,7,8,9,10>>, :bin) == {<<10,0,0,0,0,0,0,1>>, <<2,3,4,5,6,7,8,9,10>>})
  end

  test "disect bin bmp 18 bytes" do
    assert(Helpers.dissect_first_bmp(<<10,0,0,0,0,0,0,1, 2,3,4,5,6,7,8,9,10,11>>, :bin) == {<<10,0,0,0,0,0,0,1>>, <<2,3,4,5,6,7,8,9,10,11>>})
  end

  test "disect bin bmp 19 bytes" do
    assert(Helpers.dissect_first_bmp(<<10,0,0,0,0,0,0,1, 2,3,4,5,6,7,8,9,10,11,12>>, :bin) == {<<10,0,0,0,0,0,0,1>>, <<2,3,4,5,6,7,8,9,10,11,12>>})
  end

  test "disect bin bmp 20 bytes" do
    assert(Helpers.dissect_first_bmp(<<10,0,0,0,0,0,0,1, 2,3,4,5,6,7,8,9,10,11,12,13>>, :bin) == {<<10,0,0,0,0,0,0,1>>, <<2,3,4,5,6,7,8,9,10,11,12,13>>})
  end



# isomsg = <<128,0,0,0,0,0,0,0, 4,2,3, 55, 5,6,7,8,9,10,11,12,13,14,15,16,17,18,
# 19,20,21,22,23,24,25,26,27,28, 29,30,31,32, 33,34,35,36,37,38,39,
# 40, 41,42,43,44,45,46,47>>

# spec = %{
#   1 => {0, :x, 64},
#   2 => {2, :n, 6},
#   3 => {2, :z, 37},
# }

# diassambled = Iso8583Parser.disassemble(isomsg, spec, :bin)

# IO.inspect diassambled

end
