defmodule Iso8583ParserDisectAsciiBmpTest do
  use ExUnit.Case
  doctest Iso8583Parser
  alias Iso8583Pasrser.Helpers

  test "disect ascii bmp 8 bytes" do
    assert(Helpers.dissect_first_bmp(Base.encode16(<<10,0,0,0,0,0,0,1>>), :ascii) == {<<10,0,0,0,0,0,0,1>>, Base.encode16(<<>>)})
  end

  test "disect ascii bmp 9 bytes" do
    assert(Helpers.dissect_first_bmp(Base.encode16(<<10,0,0,0,0,0,0,1, 2>>), :ascii) == {<<10,0,0,0,0,0,0,1>>, Base.encode16(<<2>>)})
  end

  test "disect ascii bmp 10 bytes" do
    assert(Helpers.dissect_first_bmp(Base.encode16(<<10,0,0,0,0,0,0,1, 2,3>>), :ascii) == {<<10,0,0,0,0,0,0,1>>, Base.encode16(<<2,3>>)})
  end

  test "disect ascii bmp 11 bytes" do
    assert(Helpers.dissect_first_bmp(Base.encode16(<<10,0,0,0,0,0,0,1, 2,3,4>>), :ascii) == {<<10,0,0,0,0,0,0,1>>, Base.encode16(<<2,3,4>>)})
  end

  test "disect ascii bmp 12 bytes" do
    assert(Helpers.dissect_first_bmp(Base.encode16(<<10,0,0,0,0,0,0,1, 2,3,4,5>>), :ascii) == {<<10,0,0,0,0,0,0,1>>, Base.encode16(<<2,3,4,5>>)})
  end

  test "disect ascii bmp 13 bytes" do
    assert(Helpers.dissect_first_bmp(Base.encode16(<<10,0,0,0,0,0,0,1, 2,3,4,5,6>>), :ascii) == {<<10,0,0,0,0,0,0,1>>, Base.encode16(<<2,3,4,5,6>>)})
  end

  test "disect ascii bmp 14 bytes" do
    assert(Helpers.dissect_first_bmp(Base.encode16(<<10,0,0,0,0,0,0,1, 2,3,4,5,6,7>>), :ascii) == {<<10,0,0,0,0,0,0,1>>, Base.encode16(<<2,3,4,5,6,7>>)})
  end

  test "disect ascii bmp 15 bytes" do
    assert(Helpers.dissect_first_bmp(Base.encode16(<<10,0,0,0,0,0,0,1, 2,3,4,5,6,7,8>>), :ascii) == {<<10,0,0,0,0,0,0,1>>, Base.encode16(<<2,3,4,5,6,7,8>>)})
  end

  test "disect ascii bmp 16 bytes" do
    assert(Helpers.dissect_first_bmp(Base.encode16(<<10,0,0,0,0,0,0,1, 2,3,4,5,6,7,8,9>>), :ascii) == {<<10,0,0,0,0,0,0,1>>, Base.encode16(<<2,3,4,5,6,7,8,9>>)})
  end

  test "disect ascii bmp 17 bytes" do
    assert(Helpers.dissect_first_bmp(Base.encode16(<<10,0,0,0,0,0,0,1, 2,3,4,5,6,7,8,9,10>>), :ascii) == {<<10,0,0,0,0,0,0,1>>, Base.encode16(<<2,3,4,5,6,7,8,9,10>>)})
  end

  test "disect ascii bmp 18 bytes" do
    assert(Helpers.dissect_first_bmp(Base.encode16(<<10,0,0,0,0,0,0,1, 2,3,4,5,6,7,8,9,10,11>>), :ascii) == {<<10,0,0,0,0,0,0,1>>, Base.encode16(<<2,3,4,5,6,7,8,9,10,11>>)})
  end

  test "disect ascii bmp 19 bytes" do
    assert(Helpers.dissect_first_bmp(Base.encode16(<<10,0,0,0,0,0,0,1, 2,3,4,5,6,7,8,9,10,11,12>>), :ascii) == {<<10,0,0,0,0,0,0,1>>, Base.encode16(<<2,3,4,5,6,7,8,9,10,11,12>>)})
  end

  test "disect ascii bmp 20 bytes" do
    assert(Helpers.dissect_first_bmp(Base.encode16(<<10,0,0,0,0,0,0,1, 2,3,4,5,6,7,8,9,10,11,12,13>>), :ascii) == {<<10,0,0,0,0,0,0,1>>, Base.encode16(<<2,3,4,5,6,7,8,9,10,11,12,13>>)})
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
