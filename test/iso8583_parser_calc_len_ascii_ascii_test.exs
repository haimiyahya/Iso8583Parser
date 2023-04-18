defmodule Iso8583ParserCalcLenAsciiAsciiTest do
  use ExUnit.Case, async: true
  doctest Iso8583Parser
  alias Iso8583Pasrser.Helpers

  test "calculate len 1, :ascii, :a" do
    assert(Helpers.calc_len(1, :ascii, :a) == 1)
  end

  test "calculate len 2, :ascii, :a" do
    assert(Helpers.calc_len(2, :ascii, :a) == 2)
  end

  test "calculate len 3, :ascii, :a" do
    assert(Helpers.calc_len(3, :ascii, :a) == 3)
  end

  test "calculate len 4, :ascii, :a" do
    assert(Helpers.calc_len(4, :ascii, :a) == 4)
  end

  test "calculate len 5, :ascii, :a" do
    assert(Helpers.calc_len(5, :ascii, :a) == 5)
  end

  test "calculate len 6, :ascii, :a" do
    assert(Helpers.calc_len(6, :ascii, :a) == 6)
  end

  test "calculate len 7, :ascii, :a" do
    assert(Helpers.calc_len(7, :ascii, :a) == 7)
  end

  test "calculate len 8, :ascii, :a" do
    assert(Helpers.calc_len(8, :ascii, :a) == 8)
  end

  test "calculate len 9, :ascii, :a" do
    assert(Helpers.calc_len(9, :ascii, :a) == 9)
  end

  test "calculate len 10, :ascii, :a" do
    assert(Helpers.calc_len(10, :ascii, :a) == 10)
  end

  test "calculate len 11, :ascii, :a" do
    assert(Helpers.calc_len(11, :ascii, :a) == 11)
  end

  test "calculate len 12, :ascii, :a" do
    assert(Helpers.calc_len(12, :ascii, :a) == 12)
  end

  test "calculate len 13, :ascii, :a" do
    assert(Helpers.calc_len(13, :ascii, :a) == 13)
  end

  test "calculate len 14, :ascii, :a" do
    assert(Helpers.calc_len(14, :ascii, :a) == 14)
  end

  test "calculate len 15, :ascii, :a" do
    assert(Helpers.calc_len(15, :ascii, :a) == 15)
  end

  test "calculate len 16, :ascii, :a" do
    assert(Helpers.calc_len(16, :ascii, :a) == 16)
  end

  test "calculate len 17, :ascii, :a" do
    assert(Helpers.calc_len(17, :ascii, :a) == 17)
  end

  test "calculate len 18, :ascii, :a" do
    assert(Helpers.calc_len(18, :ascii, :a) == 18)
  end

  test "calculate len 19, :ascii, :a" do
    assert(Helpers.calc_len(19, :ascii, :a) == 19)
  end

  test "calculate len 20, :ascii, :a" do
    assert(Helpers.calc_len(20, :ascii, :a) == 20)
  end

  test "calculate len 21, :ascii, :a" do
    assert(Helpers.calc_len(21, :ascii, :a) == 21)
  end

  test "calculate len 22, :ascii, :a" do
    assert(Helpers.calc_len(22, :ascii, :a) == 22)
  end

  test "calculate len 23, :ascii, :a" do
    assert(Helpers.calc_len(23, :ascii, :a) == 23)
  end

  test "calculate len 24, :ascii, :a" do
    assert(Helpers.calc_len(24, :ascii, :a) == 24)
  end

  test "calculate len 25, :ascii, :a" do
    assert(Helpers.calc_len(25, :ascii, :a) == 25)
  end

  test "calculate len 26, :ascii, :a" do
    assert(Helpers.calc_len(26, :ascii, :a) == 26)
  end

  test "calculate len 27, :ascii, :a" do
    assert(Helpers.calc_len(27, :ascii, :a) == 27)
  end

  test "calculate len 28, :ascii, :a" do
    assert(Helpers.calc_len(28, :ascii, :a) == 28)
  end

  test "calculate len 29, :ascii, :a" do
    assert(Helpers.calc_len(29, :ascii, :a) == 29)
  end

  test "calculate len 30, :ascii, :a" do
    assert(Helpers.calc_len(30, :ascii, :a) == 30)
  end

  test "calculate len 31, :ascii, :a" do
    assert(Helpers.calc_len(31, :ascii, :a) == 31)
  end

  test "calculate len 32, :ascii, :a" do
    assert(Helpers.calc_len(32, :ascii, :a) == 32)
  end

  test "calculate len 33, :ascii, :a" do
    assert(Helpers.calc_len(33, :ascii, :a) == 33)
  end

  test "calculate len 34, :ascii, :a" do
    assert(Helpers.calc_len(34, :ascii, :a) == 34)
  end

  test "calculate len 35, :ascii, :a" do
    assert(Helpers.calc_len(35, :ascii, :a) == 35)
  end


end
