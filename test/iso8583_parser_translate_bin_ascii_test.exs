defmodule Iso8583ParserTranslateBinAsciiTest do
  use ExUnit.Case
  doctest Iso8583Parser
  alias Iso8583Pasrser.Helpers

  test "translate bin 1 bytes" do
    assert(Helpers.translate("a", :bin, :a) == "a")
  end

  test "translate bin 2 bytes" do
    assert(Helpers.translate("ab", :bin, :a) == "ab")
  end

  test "translate bin 3 bytes" do
    assert(Helpers.translate("abc", :bin, :a) == "abc")
  end

  test "translate bin 4 bytes" do
    assert(Helpers.translate("abcd", :bin, :a) == "abcd")
  end

  test "translate bin 5 bytes" do
    assert(Helpers.translate("abcde", :bin, :a) == "abcde")
  end

  test "translate bin 6 bytes" do
    assert(Helpers.translate("abcdef", :bin, :a) == "abcdef")
  end

  test "translate bin 7 bytes" do
    assert(Helpers.translate("abcdefg", :bin, :a) == "abcdefg")
  end

  test "translate bin 8 bytes" do
    assert(Helpers.translate("abcdefgh", :bin, :a) == "abcdefgh")
  end

  test "translate bin 9 bytes" do
    assert(Helpers.translate("abcdefghi", :bin, :a) == "abcdefghi")
  end

  test "translate bin 10 bytes" do
    assert(Helpers.translate("abcdefghij", :bin, :a) == "abcdefghij")
  end

  test "translate bin 11 bytes" do
    assert(Helpers.translate("abcdefghijk", :bin, :a) == "abcdefghijk")
  end

  test "translate bin 12 bytes" do
    assert(Helpers.translate("abcdefghijkl", :bin, :a) == "abcdefghijkl")
  end

  test "translate bin 13 bytes" do
    assert(Helpers.translate("abcdefghijklm", :bin, :a) == "abcdefghijklm")
  end
end
