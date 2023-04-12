defmodule Iso8583ParserProMultiplierTest do
  use ExUnit.Case
  doctest Iso8583Parser
  alias Iso8583Pasrser.Helpers

  test "pro multipler :ascii" do
    assert(Helpers.pro_multiplr(:ascii) == 2)
  end

  test "pro multipler :bin" do
    assert(Helpers.pro_multiplr(:bin) == 1)
  end

  test "pro multipler :unknown" do
    assert(Helpers.pro_multiplr(:unknown) == 1)
  end

end
