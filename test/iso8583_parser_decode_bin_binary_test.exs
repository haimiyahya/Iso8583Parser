defmodule Iso8583ParserDecodeBinBinaryTest do
  use ExUnit.Case, async: true
  doctest Iso8583Parser
  alias Iso8583Pasrser.Helpers

  test "decode bin 1 bytes" do
    assert(Helpers.decode(<<1>>, :bin, :x) == <<1>>)
  end

  test "decode bin 2 bytes" do
    assert(Helpers.decode(<<1,2>>, :bin, :x) == <<1,2>>)
  end

  test "decode bin 3 bytes" do
    assert(Helpers.decode(<<1,2,3>>, :bin, :x) == <<1,2,3>>)
  end

  test "decode bin 4 bytes" do
    assert(Helpers.decode(<<1,2,3,4>>, :bin, :x) == <<1,2,3,4>>)
  end

  test "decode bin 5 bytes" do
    assert(Helpers.decode(<<1,2,3,4,5>>, :bin, :x) == <<1,2,3,4,5>>)
  end

  test "decode bin 6 bytes" do
    assert(Helpers.decode(<<1,2,3,4,5,6>>, :bin, :x) == <<1,2,3,4,5,6>>)
  end

  test "decode bin 7 bytes" do
    assert(Helpers.decode(<<1,2,3,4,5,6,7>>, :bin, :x) == <<1,2,3,4,5,6,7>>)
  end

  test "decode bin 8 bytes" do
    assert(Helpers.decode(<<1,2,3,4,5,6,7,8>>, :bin, :x) == <<1,2,3,4,5,6,7,8>>)
  end

  test "decode bin 9 bytes" do
    assert(Helpers.decode(<<1,2,3,4,5,6,7,8,9>>, :bin, :x) == <<1,2,3,4,5,6,7,8,9>>)
  end

  test "decode bin 10 bytes" do
    assert(Helpers.decode(<<1,2,3,4,5,6,7,8,9,10>>, :bin, :x) == <<1,2,3,4,5,6,7,8,9,10>>)
  end

  test "decode bin 11 bytes" do
    assert(Helpers.decode(<<1,2,3,4,5,6,7,8,9,10,11>>, :bin, :x) == <<1,2,3,4,5,6,7,8,9,10,11>>)
  end

  test "decode bin 12 bytes" do
    assert(Helpers.decode(<<1,2,3,4,5,6,7,8,9,10,11,12>>, :bin, :x) == <<1,2,3,4,5,6,7,8,9,10,11,12>>)
  end

  test "decode bin 13 bytes" do
    assert(Helpers.decode(<<1,2,3,4,5,6,7,8,9,10,11,12,13>>, :bin, :x) == <<1,2,3,4,5,6,7,8,9,10,11,12,13>>)
  end
end
