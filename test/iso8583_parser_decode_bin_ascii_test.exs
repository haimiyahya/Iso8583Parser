defmodule Iso8583ParserDecodeBinAsciiTest do
  use ExUnit.Case, async: true
  doctest Iso8583Parser
  alias Iso8583Pasrser.Helpers

  test "decode bin 1 bytes" do
    assert(Helpers.decode("a", :bin, :a) == "a")
  end

  test "decode bin 2 bytes" do
    assert(Helpers.decode("ab", :bin, :a) == "ab")
  end

  test "decode bin 3 bytes" do
    assert(Helpers.decode("abc", :bin, :a) == "abc")
  end

  test "decode bin 4 bytes" do
    assert(Helpers.decode("abcd", :bin, :a) == "abcd")
  end

  test "decode bin 5 bytes" do
    assert(Helpers.decode("abcde", :bin, :a) == "abcde")
  end

  test "decode bin 6 bytes" do
    assert(Helpers.decode("abcdef", :bin, :a) == "abcdef")
  end

  test "decode bin 7 bytes" do
    assert(Helpers.decode("abcdefg", :bin, :a) == "abcdefg")
  end

  test "decode bin 8 bytes" do
    assert(Helpers.decode("abcdefgh", :bin, :a) == "abcdefgh")
  end

  test "decode bin 9 bytes" do
    assert(Helpers.decode("abcdefghi", :bin, :a) == "abcdefghi")
  end

  test "decode bin 10 bytes" do
    assert(Helpers.decode("abcdefghij", :bin, :a) == "abcdefghij")
  end

  test "decode bin 11 bytes" do
    assert(Helpers.decode("abcdefghijk", :bin, :a) == "abcdefghijk")
  end

  test "decode bin 12 bytes" do
    assert(Helpers.decode("abcdefghijkl", :bin, :a) == "abcdefghijkl")
  end

  test "decode bin 13 bytes" do
    assert(Helpers.decode("abcdefghijklm", :bin, :a) == "abcdefghijklm")
  end
end
