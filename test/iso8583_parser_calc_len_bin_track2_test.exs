defmodule Iso8583ParserCalcLenBinTrack2Test do
  use ExUnit.Case
  doctest Iso8583Parser
  alias Iso8583Pasrser.Helpers

  test "calculate len 1, :bin, :z" do
    assert(Helpers.calc_len(1, :bin, :z) == 1)
  end

  test "calculate len 2, :bin, :z" do
    assert(Helpers.calc_len(2, :bin, :z) == 1)
  end

  test "calculate len 3, :bin, :z" do
    assert(Helpers.calc_len(3, :bin, :z) == 2)
  end

  test "calculate len 4, :bin, :z" do
    assert(Helpers.calc_len(4, :bin, :z) == 2)
  end

  test "calculate len 5, :bin, :z" do
    assert(Helpers.calc_len(5, :bin, :z) == 3)
  end

  test "calculate len 6, :bin, :z" do
    assert(Helpers.calc_len(6, :bin, :z) == 3)
  end

  test "calculate len 7, :bin, :z" do
    assert(Helpers.calc_len(7, :bin, :z) == 4)
  end

  test "calculate len 8, :bin, :z" do
    assert(Helpers.calc_len(8, :bin, :z) == 4)
  end

  test "calculate len 9, :bin, :z" do
    assert(Helpers.calc_len(9, :bin, :z) == 5)
  end

  test "calculate len 10, :bin, :z" do
    assert(Helpers.calc_len(10, :bin, :z) == 5)
  end

  test "calculate len 11, :bin, :z" do
    assert(Helpers.calc_len(11, :bin, :z) == 6)
  end

  test "calculate len 12, :bin, :z" do
    assert(Helpers.calc_len(12, :bin, :z) == 6)
  end

  test "calculate len 13, :bin, :z" do
    assert(Helpers.calc_len(13, :bin, :z) == 7)
  end

  test "calculate len 14, :bin, :z" do
    assert(Helpers.calc_len(14, :bin, :z) == 7)
  end

  test "calculate len 15, :bin, :z" do
    assert(Helpers.calc_len(15, :bin, :z) == 8)
  end

  test "calculate len 16, :bin, :z" do
    assert(Helpers.calc_len(16, :bin, :z) == 8)
  end

  test "calculate len 17, :bin, :z" do
    assert(Helpers.calc_len(17, :bin, :z) == 9)
  end

  test "calculate len 18, :bin, :z" do
    assert(Helpers.calc_len(18, :bin, :z) == 9)
  end

  test "calculate len 19, :bin, :z" do
    assert(Helpers.calc_len(19, :bin, :z) == 10)
  end

  test "calculate len 20, :bin, :z" do
    assert(Helpers.calc_len(20, :bin, :z) == 10)
  end

  test "calculate len 21, :bin, :z" do
    assert(Helpers.calc_len(21, :bin, :z) == 11)
  end

  test "calculate len 22, :bin, :z" do
    assert(Helpers.calc_len(22, :bin, :z) == 11)
  end

  test "calculate len 23, :bin, :z" do
    assert(Helpers.calc_len(23, :bin, :z) == 12)
  end

  test "calculate len 24, :bin, :z" do
    assert(Helpers.calc_len(24, :bin, :z) == 12)
  end

  test "calculate len 25, :bin, :z" do
    assert(Helpers.calc_len(25, :bin, :z) == 13)
  end

  test "calculate len 26, :bin, :z" do
    assert(Helpers.calc_len(26, :bin, :z) == 13)
  end

  test "calculate len 27, :bin, :z" do
    assert(Helpers.calc_len(27, :bin, :z) == 14)
  end

  test "calculate len 28, :bin, :z" do
    assert(Helpers.calc_len(28, :bin, :z) == 14)
  end

  test "calculate len 29, :bin, :z" do
    assert(Helpers.calc_len(29, :bin, :z) == 15)
  end

  test "calculate len 30, :bin, :z" do
    assert(Helpers.calc_len(30, :bin, :z) == 15)
  end

  test "calculate len 31, :bin, :z" do
    assert(Helpers.calc_len(31, :bin, :z) == 16)
  end

  test "calculate len 32, :bin, :z" do
    assert(Helpers.calc_len(32, :bin, :z) == 16)
  end

  test "calculate len 33, :bin, :z" do
    assert(Helpers.calc_len(33, :bin, :z) == 17)
  end


end
