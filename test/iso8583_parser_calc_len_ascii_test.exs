defmodule Iso8583ParserCalcLenAsciiTest do
  use ExUnit.Case
  doctest Iso8583Parser
  alias Iso8583Pasrser.Helpers

  test "calculate len 1, :ascii, :x" do
    assert(Helpers.calc_len(1, :ascii, :x) == 2)
  end

  test "calculate len 2, :ascii, :x" do
    assert(Helpers.calc_len(2, :ascii, :x) == 2)
  end

  test "calculate len 3, :ascii, :x" do
    assert(Helpers.calc_len(3, :ascii, :x) == 2)
  end

  test "calculate len 4, :ascii, :x" do
    assert(Helpers.calc_len(4, :ascii, :x) == 2)
  end

  test "calculate len 5, :ascii, :x" do
    assert(Helpers.calc_len(5, :ascii, :x) == 2)
  end

  test "calculate len 6, :ascii, :x" do
    assert(Helpers.calc_len(6, :ascii, :x) == 2)
  end

  test "calculate len 7, :ascii, :x" do
    assert(Helpers.calc_len(7, :ascii, :x) == 2)
  end

  test "calculate len 8, :ascii, :x" do
    assert(Helpers.calc_len(8, :ascii, :x) == 2)
  end

  test "calculate len 9, :ascii, :x" do
    assert(Helpers.calc_len(9, :ascii, :x) == 4)
  end

  test "calculate len 10, :ascii, :x" do
    assert(Helpers.calc_len(10, :ascii, :x) == 4)
  end

  test "calculate len 11, :ascii, :x" do
    assert(Helpers.calc_len(11, :ascii, :x) == 4)
  end

  test "calculate len 12, :ascii, :x" do
    assert(Helpers.calc_len(12, :ascii, :x) == 4)
  end

  test "calculate len 13, :ascii, :x" do
    assert(Helpers.calc_len(13, :ascii, :x) == 4)
  end

  test "calculate len 14, :ascii, :x" do
    assert(Helpers.calc_len(14, :ascii, :x) == 4)
  end

  test "calculate len 15, :ascii, :x" do
    assert(Helpers.calc_len(15, :ascii, :x) == 4)
  end

  test "calculate len 16, :ascii, :x" do
    assert(Helpers.calc_len(16, :ascii, :x) == 4)
  end

  test "calculate len 17, :ascii, :x" do
    assert(Helpers.calc_len(17, :ascii, :x) == 6)
  end

  test "calculate len 18, :ascii, :x" do
    assert(Helpers.calc_len(18, :ascii, :x) == 6)
  end

  test "calculate len 19, :ascii, :x" do
    assert(Helpers.calc_len(19, :ascii, :x) == 6)
  end

  test "calculate len 20, :ascii, :x" do
    assert(Helpers.calc_len(20, :ascii, :x) == 6)
  end

  test "calculate len 21, :ascii, :x" do
    assert(Helpers.calc_len(21, :ascii, :x) == 6)
  end

  test "calculate len 22, :ascii, :x" do
    assert(Helpers.calc_len(22, :ascii, :x) == 6)
  end

  test "calculate len 23, :ascii, :x" do
    assert(Helpers.calc_len(23, :ascii, :x) == 6)
  end

  test "calculate len 24, :ascii, :x" do
    assert(Helpers.calc_len(24, :ascii, :x) == 6)
  end

  test "calculate len 25, :ascii, :x" do
    assert(Helpers.calc_len(25, :ascii, :x) == 8)
  end

  test "calculate len 26, :ascii, :x" do
    assert(Helpers.calc_len(26, :ascii, :x) == 8)
  end

  test "calculate len 27, :ascii, :x" do
    assert(Helpers.calc_len(27, :ascii, :x) == 8)
  end

  test "calculate len 28, :ascii, :x" do
    assert(Helpers.calc_len(28, :ascii, :x) == 8)
  end

  test "calculate len 29, :ascii, :x" do
    assert(Helpers.calc_len(29, :ascii, :x) == 8)
  end

  test "calculate len 30, :ascii, :x" do
    assert(Helpers.calc_len(30, :ascii, :x) == 8)
  end

  test "calculate len 31, :ascii, :x" do
    assert(Helpers.calc_len(31, :ascii, :x) == 8)
  end

  test "calculate len 32, :ascii, :x" do
    assert(Helpers.calc_len(32, :ascii, :x) == 8)
  end

  test "calculate len 33, :ascii, :x" do
    assert(Helpers.calc_len(33, :ascii, :x) == 10)
  end

  test "calculate len 34, :ascii, :x" do
    assert(Helpers.calc_len(34, :ascii, :x) == 10)
  end

  test "calculate len 35, :ascii, :x" do
    assert(Helpers.calc_len(35, :ascii, :x) == 10)
  end


end
