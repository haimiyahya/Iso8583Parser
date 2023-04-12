defmodule Iso8583ParserCalcLenBinNumericTest do
  use ExUnit.Case
  doctest Iso8583Parser
  alias Iso8583Pasrser.Helpers

  test "calculate len 1, :bin, :n" do
    assert(Helpers.calc_len(1, :bin, :n) == 1)
  end

  test "calculate len 2, :bin, :n" do
    assert(Helpers.calc_len(2, :bin, :n) == 1)
  end

  test "calculate len 3, :bin, :n" do
    assert(Helpers.calc_len(3, :bin, :n) == 2)
  end

  test "calculate len 4, :bin, :n" do
    assert(Helpers.calc_len(4, :bin, :n) == 2)
  end

  test "calculate len 5, :bin, :n" do
    assert(Helpers.calc_len(5, :bin, :n) == 3)
  end

  test "calculate len 6, :bin, :n" do
    assert(Helpers.calc_len(6, :bin, :n) == 3)
  end

  test "calculate len 7, :bin, :n" do
    assert(Helpers.calc_len(7, :bin, :n) == 4)
  end

  test "calculate len 8, :bin, :n" do
    assert(Helpers.calc_len(8, :bin, :n) == 4)
  end

  test "calculate len 9, :bin, :n" do
    assert(Helpers.calc_len(9, :bin, :n) == 5)
  end

  test "calculate len 10, :bin, :n" do
    assert(Helpers.calc_len(10, :bin, :n) == 5)
  end

  test "calculate len 11, :bin, :n" do
    assert(Helpers.calc_len(11, :bin, :n) == 6)
  end

  test "calculate len 12, :bin, :n" do
    assert(Helpers.calc_len(12, :bin, :n) == 6)
  end

  test "calculate len 13, :bin, :n" do
    assert(Helpers.calc_len(13, :bin, :n) == 7)
  end

  test "calculate len 14, :bin, :n" do
    assert(Helpers.calc_len(14, :bin, :n) == 7)
  end

  test "calculate len 15, :bin, :n" do
    assert(Helpers.calc_len(15, :bin, :n) == 8)
  end

  test "calculate len 16, :bin, :n" do
    assert(Helpers.calc_len(16, :bin, :n) == 8)
  end

  test "calculate len 17, :bin, :n" do
    assert(Helpers.calc_len(17, :bin, :n) == 9)
  end

  test "calculate len 18, :bin, :n" do
    assert(Helpers.calc_len(18, :bin, :n) == 9)
  end

  test "calculate len 19, :bin, :n" do
    assert(Helpers.calc_len(19, :bin, :n) == 10)
  end

  test "calculate len 20, :bin, :n" do
    assert(Helpers.calc_len(20, :bin, :n) == 10)
  end

  test "calculate len 21, :bin, :n" do
    assert(Helpers.calc_len(21, :bin, :n) == 11)
  end

  test "calculate len 22, :bin, :n" do
    assert(Helpers.calc_len(22, :bin, :n) == 11)
  end

  test "calculate len 23, :bin, :n" do
    assert(Helpers.calc_len(23, :bin, :n) == 12)
  end

  test "calculate len 24, :bin, :n" do
    assert(Helpers.calc_len(24, :bin, :n) == 12)
  end

  test "calculate len 25, :bin, :n" do
    assert(Helpers.calc_len(25, :bin, :n) == 13)
  end

  test "calculate len 26, :bin, :n" do
    assert(Helpers.calc_len(26, :bin, :n) == 13)
  end

  test "calculate len 27, :bin, :n" do
    assert(Helpers.calc_len(27, :bin, :n) == 14)
  end

  test "calculate len 28, :bin, :n" do
    assert(Helpers.calc_len(28, :bin, :n) == 14)
  end

  test "calculate len 29, :bin, :n" do
    assert(Helpers.calc_len(29, :bin, :n) == 15)
  end

  test "calculate len 30, :bin, :n" do
    assert(Helpers.calc_len(30, :bin, :n) == 15)
  end

  test "calculate len 31, :bin, :n" do
    assert(Helpers.calc_len(31, :bin, :n) == 16)
  end

  test "calculate len 32, :bin, :n" do
    assert(Helpers.calc_len(32, :bin, :n) == 16)
  end

  test "calculate len 33, :bin, :n" do
    assert(Helpers.calc_len(33, :bin, :n) == 17)
  end


end
