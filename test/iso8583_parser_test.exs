defmodule Iso8583ParserTest do
  use ExUnit.Case
  doctest Iso8583Parser

  test "greets the world" do
    assert Iso8583Parser.hello() == :world
  end
end