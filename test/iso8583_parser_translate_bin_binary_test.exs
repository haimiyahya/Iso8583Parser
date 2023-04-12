defmodule Iso8583ParserTranslateBinBinaryTest do
  use ExUnit.Case
  doctest Iso8583Parser
  alias Iso8583Pasrser.Helpers

  test "translate bin 1 bytes" do
    assert(Helpers.translate(<<1>>, :bin, :x) == <<1>>)
  end

  test "translate bin 2 bytes" do
    assert(Helpers.translate(<<1,2>>, :bin, :x) == <<1,2>>)
  end

  test "translate bin 3 bytes" do
    assert(Helpers.translate(<<1,2,3>>, :bin, :x) == <<1,2,3>>)
  end

  test "translate bin 4 bytes" do
    assert(Helpers.translate(<<1,2,3,4>>, :bin, :x) == <<1,2,3,4>>)
  end

  test "translate bin 5 bytes" do
    assert(Helpers.translate(<<1,2,3,4,5>>, :bin, :x) == <<1,2,3,4,5>>)
  end

  test "translate bin 6 bytes" do
    assert(Helpers.translate(<<1,2,3,4,5,6>>, :bin, :x) == <<1,2,3,4,5,6>>)
  end

  test "translate bin 7 bytes" do
    assert(Helpers.translate(<<1,2,3,4,5,6,7>>, :bin, :x) == <<1,2,3,4,5,6,7>>)
  end

  test "translate bin 8 bytes" do
    assert(Helpers.translate(<<1,2,3,4,5,6,7,8>>, :bin, :x) == <<1,2,3,4,5,6,7,8>>)
  end

  test "translate bin 9 bytes" do
    assert(Helpers.translate(<<1,2,3,4,5,6,7,8,9>>, :bin, :x) == <<1,2,3,4,5,6,7,8,9>>)
  end

  test "translate bin 10 bytes" do
    assert(Helpers.translate(<<1,2,3,4,5,6,7,8,9,10>>, :bin, :x) == <<1,2,3,4,5,6,7,8,9,10>>)
  end

  test "translate bin 11 bytes" do
    assert(Helpers.translate(<<1,2,3,4,5,6,7,8,9,10,11>>, :bin, :x) == <<1,2,3,4,5,6,7,8,9,10,11>>)
  end

  test "translate bin 12 bytes" do
    assert(Helpers.translate(<<1,2,3,4,5,6,7,8,9,10,11,12>>, :bin, :x) == <<1,2,3,4,5,6,7,8,9,10,11,12>>)
  end

  test "translate bin 13 bytes" do
    assert(Helpers.translate(<<1,2,3,4,5,6,7,8,9,10,11,12,13>>, :bin, :x) == <<1,2,3,4,5,6,7,8,9,10,11,12,13>>)
  end
end
