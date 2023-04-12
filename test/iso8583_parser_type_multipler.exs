defmodule Iso8583ParserTypeMultiplierTest do
  use ExUnit.Case
  doctest Iso8583Parser
  alias Iso8583Pasrser.Helpers

  test "type multipler :x" do
    assert(Helpers.type_multiplr(:x) == 8)
  end

  test "type multipler :n" do
    assert(Helpers.type_multiplr(:n) == 2)
  end

  test "type multipler :z" do
    assert(Helpers.type_multiplr(:z) == 2)
  end

  test "type multipler :a" do
    assert(Helpers.type_multiplr(:a) == 1)
  end


end
