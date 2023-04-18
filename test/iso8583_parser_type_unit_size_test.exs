defmodule Iso8583ParserTypeUnitSizeTest do
  use ExUnit.Case, async: true
  doctest Iso8583Parser
  alias Iso8583Pasrser.Helpers

  test "type multipler :x" do
    assert(Helpers.type_unit_size(:x) == 8)
  end

  test "type multipler :n" do
    assert(Helpers.type_unit_size(:n) == 2)
  end

  test "type multipler :z" do
    assert(Helpers.type_unit_size(:z) == 2)
  end

  test "type multipler :a" do
    assert(Helpers.type_unit_size(:a) == 1)
  end


end
