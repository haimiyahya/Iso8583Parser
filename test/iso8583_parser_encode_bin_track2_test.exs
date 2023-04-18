defmodule Iso8583ParserEncodeBinTrack2Test do
  use ExUnit.Case, async: true
  doctest Iso8583Parser
  alias Iso8583Pasrser.Helpers

  test "encode bin 1 bytes" do
    assert(Helpers.encode("01", :bin, :z) == <<1>>)
  end

  test "encode bin 2 bytes" do
    assert(Helpers.encode("0102", :bin, :z) == <<1,2>>)
  end

  test "encode bin 3 bytes" do
    assert(Helpers.encode("010203", :bin, :z) == <<1,2,3>>)
  end

  test "encode bin 4 bytes" do
    assert(Helpers.encode("01020304", :bin, :z) == <<1,2,3,4>>)
  end

  test "encode bin 5 bytes" do
    assert(Helpers.encode("0102030405", :bin, :z) == <<1,2,3,4,5>>)
  end

  test "encode bin 6 bytes" do
    assert(Helpers.encode("010203040506", :bin, :z) == <<1,2,3,4,5,6>>)
  end

  test "encode bin 7 bytes" do
    assert(Helpers.encode("01020304050607", :bin, :z) == <<1,2,3,4,5,6,7>>)
  end

  test "encode bin 8 bytes" do
    assert(Helpers.encode("0102030405060708", :bin, :z) == <<1,2,3,4,5,6,7,8>>)
  end

  test "encode bin 9 bytes" do
    assert(Helpers.encode("010203040506070809", :bin, :z) == <<1,2,3,4,5,6,7,8,9>>)
  end

  test "encode bin 10 bytes" do
    assert(Helpers.encode("0102030405060708090A", :bin, :z) == <<1,2,3,4,5,6,7,8,9,10>>)
  end

  test "encode bin 11 bytes" do
    assert(Helpers.encode("0102030405060708090A0B", :bin, :z) == <<1,2,3,4,5,6,7,8,9,10,11>>)
  end

  test "encode bin 12 bytes" do
    assert(Helpers.encode("0102030405060708090A0B0C", :bin, :z) == <<1,2,3,4,5,6,7,8,9,10,11,12>>)
  end

  test "encode bin 13 bytes" do
    assert(Helpers.encode("0102030405060708090A0B0C0D", :bin, :z) == <<1,2,3,4,5,6,7,8,9,10,11,12,13>>)
  end
end
