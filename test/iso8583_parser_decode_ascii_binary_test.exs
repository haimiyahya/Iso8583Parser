defmodule Iso8583ParserDecodeAsciiBinaryTest do
  use ExUnit.Case, async: true
  doctest Iso8583Parser
  alias Iso8583Pasrser.Helpers

  test "decode bin 1 bytes" do
    assert(Helpers.decode("01", :ascii, :x) == Base.decode16!("01"))
  end

  test "decode bin 2 bytes" do
    assert(Helpers.decode("0102", :ascii, :x) == Base.decode16!("0102"))
  end

  test "decode bin 3 bytes" do
    assert(Helpers.decode("010203", :ascii, :x) == Base.decode16!("010203"))
  end

  test "decode bin 4 bytes" do
    assert(Helpers.decode("01020304", :ascii, :x) == Base.decode16!("01020304"))
  end

  test "decode bin 5 bytes" do
    assert(Helpers.decode("0102030405", :ascii, :x) == Base.decode16!("0102030405"))
  end

  test "decode bin 6 bytes" do
    assert(Helpers.decode("010203040506", :ascii, :x) == Base.decode16!("010203040506"))
  end

  test "decode bin 7 bytes" do
    assert(Helpers.decode("01020304050607", :ascii, :x) == Base.decode16!("01020304050607"))
  end

  test "decode bin 8 bytes" do
    assert(Helpers.decode("0102030405060708", :ascii, :x) == Base.decode16!("0102030405060708"))
  end

  test "decode bin 9 bytes" do
    assert(Helpers.decode("010203040506070809", :ascii, :x) == Base.decode16!("010203040506070809"))
  end

  test "decode bin 10 bytes" do
    assert(Helpers.decode("0102030405060708090A", :ascii, :x) == Base.decode16!("0102030405060708090A"))
  end

  test "decode bin 11 bytes" do
    assert(Helpers.decode("0102030405060708090A0B", :ascii, :x) == Base.decode16!("0102030405060708090A0B"))
  end

  test "decode bin 12 bytes" do
    assert(Helpers.decode("0102030405060708090A0B0C", :ascii, :x) == Base.decode16!("0102030405060708090A0B0C"))
  end

  test "decode bin 13 bytes" do
    assert(Helpers.decode("0102030405060708090A0B0C0D", :ascii, :x) == Base.decode16!("0102030405060708090A0B0C0D"))
  end
end
