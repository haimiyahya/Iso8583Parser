defmodule Iso8583ParserEncodeBinAsciiTest do
  use ExUnit.Case, async: true
  doctest Iso8583Parser
  alias Iso8583Pasrser.Helpers

  test "encode bin 1 bytes" do
    assert(Helpers.encode("a", :bin, :a) == "a")
  end

  test "encode bin 2 bytes" do
    assert(Helpers.encode("ab", :bin, :a) == "ab")
  end

  test "encode bin 3 bytes" do
    assert(Helpers.encode("abc", :bin, :a) == "abc")
  end

  test "encode bin 4 bytes" do
    assert(Helpers.encode("abcd", :bin, :a) == "abcd")
  end

  test "encode bin 5 bytes" do
    assert(Helpers.encode("abcde", :bin, :a) == "abcde")
  end

  test "encode bin 6 bytes" do
    assert(Helpers.encode("abcdef", :bin, :a) == "abcdef")
  end

  test "encode bin 7 bytes" do
    assert(Helpers.encode("abcdefg", :bin, :a) == "abcdefg")
  end

  test "encode bin 8 bytes" do
    assert(Helpers.encode("abcdefgh", :bin, :a) == "abcdefgh")
  end

  test "encode bin 9 bytes" do
    assert(Helpers.encode("abcdefghi", :bin, :a) == "abcdefghi")
  end

  test "encode bin 10 bytes" do
    assert(Helpers.encode("abcdefghij", :bin, :a) == "abcdefghij")
  end

  test "encode bin 11 bytes" do
    assert(Helpers.encode("abcdefghijk", :bin, :a) == "abcdefghijk")
  end

  test "encode bin 12 bytes" do
    assert(Helpers.encode("abcdefghijkl", :bin, :a) == "abcdefghijkl")
  end

  test "encode bin 13 bytes" do
    assert(Helpers.encode("abcdefghijklm", :bin, :a) == "abcdefghijklm")
  end
end
