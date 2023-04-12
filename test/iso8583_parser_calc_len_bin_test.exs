defmodule Iso8583ParserCalcLenBinTest do
  use ExUnit.Case
  doctest Iso8583Parser
  alias Iso8583Pasrser.Helpers

  test "calculate len 1, :bin, :x" do
    assert(Helpers.calc_len(1, :bin, :x) == 1)
  end

  test "calculate len 2, :bin, :x" do
    assert(Helpers.calc_len(2, :bin, :x) == 1)
  end

  test "calculate len 3, :bin, :x" do
    assert(Helpers.calc_len(3, :bin, :x) == 1)
  end

  test "calculate len 4, :bin, :x" do
    assert(Helpers.calc_len(4, :bin, :x) == 1)
  end

  test "calculate len 5, :bin, :x" do
    assert(Helpers.calc_len(5, :bin, :x) == 1)
  end

  test "calculate len 6, :bin, :x" do
    assert(Helpers.calc_len(6, :bin, :x) == 1)
  end

  test "calculate len 7, :bin, :x" do
    assert(Helpers.calc_len(7, :bin, :x) == 1)
  end

  test "calculate len 8, :bin, :x" do
    assert(Helpers.calc_len(8, :bin, :x) == 1)
  end

  test "calculate len 9, :bin, :x" do
    assert(Helpers.calc_len(9, :bin, :x) == 2)
  end

  test "calculate len 10, :bin, :x" do
    assert(Helpers.calc_len(10, :bin, :x) == 2)
  end

  test "calculate len 11, :bin, :x" do
    assert(Helpers.calc_len(11, :bin, :x) == 2)
  end

  test "calculate len 12, :bin, :x" do
    assert(Helpers.calc_len(12, :bin, :x) == 2)
  end

  test "calculate len 13, :bin, :x" do
    assert(Helpers.calc_len(13, :bin, :x) == 2)
  end

  test "calculate len 14, :bin, :x" do
    assert(Helpers.calc_len(14, :bin, :x) == 2)
  end

  test "calculate len 15, :bin, :x" do
    assert(Helpers.calc_len(15, :bin, :x) == 2)
  end

  test "calculate len 16, :bin, :x" do
    assert(Helpers.calc_len(16, :bin, :x) == 2)
  end

  test "calculate len 17, :bin, :x" do
    assert(Helpers.calc_len(17, :bin, :x) == 3)
  end

  test "calculate len 18, :bin, :x" do
    assert(Helpers.calc_len(18, :bin, :x) == 3)
  end

  test "calculate len 19, :bin, :x" do
    assert(Helpers.calc_len(19, :bin, :x) == 3)
  end

  test "calculate len 20, :bin, :x" do
    assert(Helpers.calc_len(20, :bin, :x) == 3)
  end

  test "calculate len 21, :bin, :x" do
    assert(Helpers.calc_len(21, :bin, :x) == 3)
  end

  test "calculate len 22, :bin, :x" do
    assert(Helpers.calc_len(22, :bin, :x) == 3)
  end

  test "calculate len 23, :bin, :x" do
    assert(Helpers.calc_len(23, :bin, :x) == 3)
  end

  test "calculate len 24, :bin, :x" do
    assert(Helpers.calc_len(24, :bin, :x) == 3)
  end

  test "calculate len 25, :bin, :x" do
    assert(Helpers.calc_len(25, :bin, :x) == 4)
  end

  test "calculate len 26, :bin, :x" do
    assert(Helpers.calc_len(26, :bin, :x) == 4)
  end

  test "calculate len 27, :bin, :x" do
    assert(Helpers.calc_len(27, :bin, :x) == 4)
  end

  test "calculate len 28, :bin, :x" do
    assert(Helpers.calc_len(28, :bin, :x) == 4)
  end

  test "calculate len 29, :bin, :x" do
    assert(Helpers.calc_len(29, :bin, :x) == 4)
  end

  test "calculate len 30, :bin, :x" do
    assert(Helpers.calc_len(30, :bin, :x) == 4)
  end

  test "calculate len 31, :bin, :x" do
    assert(Helpers.calc_len(31, :bin, :x) == 4)
  end

  test "calculate len 32, :bin, :x" do
    assert(Helpers.calc_len(32, :bin, :x) == 4)
  end

  test "calculate len 33, :bin, :x" do
    assert(Helpers.calc_len(33, :bin, :x) == 5)
  end


end
