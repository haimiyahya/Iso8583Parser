defmodule Iso8583ParserCalcLenTest do
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



end
