defmodule Iso8583ParserCalcLenAsciiNumTest do
  use ExUnit.Case, async: true
  doctest Iso8583Parser
  alias Iso8583Pasrser.Helpers

  test "calculate len 1, :ascii, :n" do
    assert(Helpers.calc_len(1, :ascii, :n) == 1)
  end

  test "calculate len 2, :ascii, :n" do
    assert(Helpers.calc_len(2, :ascii, :n) == 2)
  end

  test "calculate len 3, :ascii, :n" do
    assert(Helpers.calc_len(3, :ascii, :n) == 3)
  end

  test "calculate len 4, :ascii, :n" do
    assert(Helpers.calc_len(4, :ascii, :n) == 4)
  end

  test "calculate len 5, :ascii, :n" do
    assert(Helpers.calc_len(5, :ascii, :n) == 5)
  end

  test "calculate len 6, :ascii, :n" do
    assert(Helpers.calc_len(6, :ascii, :n) == 6)
  end

  test "calculate len 7, :ascii, :n" do
    assert(Helpers.calc_len(7, :ascii, :n) == 7)
  end

  test "calculate len 8, :ascii, :n" do
    assert(Helpers.calc_len(8, :ascii, :n) == 8)
  end

  test "calculate len 9, :ascii, :n" do
    assert(Helpers.calc_len(9, :ascii, :n) == 9)
  end

  test "calculate len 10, :ascii, :n" do
    assert(Helpers.calc_len(10, :ascii, :n) == 10)
  end

  test "calculate len 11, :ascii, :n" do
    assert(Helpers.calc_len(11, :ascii, :n) == 11)
  end

  test "calculate len 12, :ascii, :n" do
    assert(Helpers.calc_len(12, :ascii, :n) == 12)
  end

  test "calculate len 13, :ascii, :n" do
    assert(Helpers.calc_len(13, :ascii, :n) == 13)
  end

  test "calculate len 14, :ascii, :n" do
    assert(Helpers.calc_len(14, :ascii, :n) == 14)
  end

  test "calculate len 15, :ascii, :n" do
    assert(Helpers.calc_len(15, :ascii, :n) == 15)
  end

  test "calculate len 16, :ascii, :n" do
    assert(Helpers.calc_len(16, :ascii, :n) == 16)
  end

  test "calculate len 17, :ascii, :n" do
    assert(Helpers.calc_len(17, :ascii, :n) == 17)
  end

  test "calculate len 18, :ascii, :n" do
    assert(Helpers.calc_len(18, :ascii, :n) == 18)
  end

  test "calculate len 19, :ascii, :n" do
    assert(Helpers.calc_len(19, :ascii, :n) == 19)
  end

  test "calculate len 20, :ascii, :n" do
    assert(Helpers.calc_len(20, :ascii, :n) == 20)
  end

  test "calculate len 21, :ascii, :n" do
    assert(Helpers.calc_len(21, :ascii, :n) == 21)
  end

  test "calculate len 22, :ascii, :n" do
    assert(Helpers.calc_len(22, :ascii, :n) == 22)
  end

  test "calculate len 23, :ascii, :n" do
    assert(Helpers.calc_len(23, :ascii, :n) == 23)
  end

  test "calculate len 24, :ascii, :n" do
    assert(Helpers.calc_len(24, :ascii, :n) == 24)
  end

  test "calculate len 25, :ascii, :n" do
    assert(Helpers.calc_len(25, :ascii, :n) == 25)
  end

  test "calculate len 26, :ascii, :n" do
    assert(Helpers.calc_len(26, :ascii, :n) == 26)
  end

  test "calculate len 27, :ascii, :n" do
    assert(Helpers.calc_len(27, :ascii, :n) == 27)
  end

  test "calculate len 28, :ascii, :n" do
    assert(Helpers.calc_len(28, :ascii, :n) == 28)
  end

  test "calculate len 29, :ascii, :n" do
    assert(Helpers.calc_len(29, :ascii, :n) == 29)
  end

  test "calculate len 30, :ascii, :n" do
    assert(Helpers.calc_len(30, :ascii, :n) == 30)
  end

  test "calculate len 31, :ascii, :n" do
    assert(Helpers.calc_len(31, :ascii, :n) == 31)
  end

  test "calculate len 32, :ascii, :n" do
    assert(Helpers.calc_len(32, :ascii, :n) == 32)
  end

  test "calculate len 33, :ascii, :n" do
    assert(Helpers.calc_len(33, :ascii, :n) == 33)
  end

  test "calculate len 34, :ascii, :n" do
    assert(Helpers.calc_len(34, :ascii, :n) == 34)
  end

  test "calculate len 35, :ascii, :n" do
    assert(Helpers.calc_len(35, :ascii, :n) == 35)
  end


end
