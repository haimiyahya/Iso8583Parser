defmodule Iso8583ParserEncodeAsciiTrack2Test do
  use ExUnit.Case, async: true
  doctest Iso8583Parser
  alias Iso8583Pasrser.Helpers

  test "encode bin 1 bytes" do
    assert(Helpers.encode("01", :ascii, :z) == "01")
  end

  test "encode bin 2 bytes" do
    assert(Helpers.encode("0102", :ascii, :z) == "0102")
  end

  test "encode bin 3 bytes" do
    assert(Helpers.encode("010203", :ascii, :z) == "010203")
  end

  test "encode bin 4 bytes" do
    assert(Helpers.encode("01020304", :ascii, :z) == "01020304")
  end

  test "encode bin 5 bytes" do
    assert(Helpers.encode("0102030405", :ascii, :z) == "0102030405")
  end

  test "encode bin 6 bytes" do
    assert(Helpers.encode("010203040506", :ascii, :z) == "010203040506")
  end

  test "encode bin 7 bytes" do
    assert(Helpers.encode("01020304050607", :ascii, :z) == "01020304050607")
  end

  test "encode bin 8 bytes" do
    assert(Helpers.encode("0102030405060708", :ascii, :z) == "0102030405060708")
  end

  test "encode bin 9 bytes" do
    assert(Helpers.encode("010203040506070809", :ascii, :z) == "010203040506070809")
  end

  test "encode bin 10 bytes" do
    assert(Helpers.encode("0102030405060708090A", :ascii, :z) == "0102030405060708090A")
  end

  test "encode bin 11 bytes" do
    assert(Helpers.encode("0102030405060708090A0B", :ascii, :z) == "0102030405060708090A0B")
  end

  test "encode bin 12 bytes" do
    assert(Helpers.encode("0102030405060708090A0B0C", :ascii, :z) == "0102030405060708090A0B0C")
  end

  test "encode bin 13 bytes" do
    assert(Helpers.encode("0102030405060708090A0B0C0D", :ascii, :z) == "0102030405060708090A0B0C0D")
  end
end
