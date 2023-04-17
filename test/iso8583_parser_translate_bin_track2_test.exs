defmodule Iso8583ParserDecodeBinTrack2Test do
  use ExUnit.Case
  doctest Iso8583Parser
  alias Iso8583Pasrser.Helpers

  test "decode bin 1 bytes" do
    assert(Helpers.decode(<<1>>, :bin, :z) == "01")
  end

  test "decode bin 2 bytes" do
    assert(Helpers.decode(<<1,2>>, :bin, :z) == "0102")
  end

  test "decode bin 3 bytes" do
    assert(Helpers.decode(<<1,2,3>>, :bin, :z) == "010203")
  end

  test "decode bin 4 bytes" do
    assert(Helpers.decode(<<1,2,3,4>>, :bin, :z) == "01020304")
  end

  test "decode bin 5 bytes" do
    assert(Helpers.decode(<<1,2,3,4,5>>, :bin, :z) == "0102030405")
  end

  test "decode bin 6 bytes" do
    assert(Helpers.decode(<<1,2,3,4,5,6>>, :bin, :z) == "010203040506")
  end

  test "decode bin 7 bytes" do
    assert(Helpers.decode(<<1,2,3,4,5,6,7>>, :bin, :z) == "01020304050607")
  end

  test "decode bin 8 bytes" do
    assert(Helpers.decode(<<1,2,3,4,5,6,7,8>>, :bin, :z) == "0102030405060708")
  end

  test "decode bin 9 bytes" do
    assert(Helpers.decode(<<1,2,3,4,5,6,7,8,9>>, :bin, :z) == "010203040506070809")
  end

  test "decode bin 10 bytes" do
    assert(Helpers.decode(<<1,2,3,4,5,6,7,8,9,10>>, :bin, :z) == "0102030405060708090A")
  end

  test "decode bin 11 bytes" do
    assert(Helpers.decode(<<1,2,3,4,5,6,7,8,9,10,11>>, :bin, :z) == "0102030405060708090A0B")
  end

  test "decode bin 12 bytes" do
    assert(Helpers.decode(<<1,2,3,4,5,6,7,8,9,10,11,12>>, :bin, :z) == "0102030405060708090A0B0C")
  end

  test "decode bin 13 bytes" do
    assert(Helpers.decode(<<1,2,3,4,5,6,7,8,9,10,11,12,13>>, :bin, :z) == "0102030405060708090A0B0C0D")
  end
end
