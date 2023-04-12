defmodule Iso8583ParserTranslateAsciiTrack2Test do
  use ExUnit.Case
  doctest Iso8583Parser
  alias Iso8583Pasrser.Helpers

  test "translate bin 1 bytes" do
    assert(Helpers.translate("01", :ascii, :z) == "01")
  end

  test "translate bin 2 bytes" do
    assert(Helpers.translate("0102", :ascii, :z) == "0102")
  end

  test "translate bin 3 bytes" do
    assert(Helpers.translate("010203", :ascii, :z) == "010203")
  end

  test "translate bin 4 bytes" do
    assert(Helpers.translate("01020304", :ascii, :z) == "01020304")
  end

  test "translate bin 5 bytes" do
    assert(Helpers.translate("0102030405", :ascii, :z) == "0102030405")
  end

  test "translate bin 6 bytes" do
    assert(Helpers.translate("010203040506", :ascii, :z) == "010203040506")
  end

  test "translate bin 7 bytes" do
    assert(Helpers.translate("01020304050607", :ascii, :z) == "01020304050607")
  end

  test "translate bin 8 bytes" do
    assert(Helpers.translate("0102030405060708", :ascii, :z) == "0102030405060708")
  end

  test "translate bin 9 bytes" do
    assert(Helpers.translate("010203040506070809", :ascii, :z) == "010203040506070809")
  end

  test "translate bin 10 bytes" do
    assert(Helpers.translate("0102030405060708090A", :ascii, :z) == "0102030405060708090A")
  end

  test "translate bin 11 bytes" do
    assert(Helpers.translate("0102030405060708090A0B", :ascii, :z) == "0102030405060708090A0B")
  end

  test "translate bin 12 bytes" do
    assert(Helpers.translate("0102030405060708090A0B0C", :ascii, :z) == "0102030405060708090A0B0C")
  end

  test "translate bin 13 bytes" do
    assert(Helpers.translate("0102030405060708090A0B0C0D", :ascii, :z) == "0102030405060708090A0B0C0D")
  end
end
