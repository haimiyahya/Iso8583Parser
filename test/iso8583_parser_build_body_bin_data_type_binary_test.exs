defmodule Iso8583ParserBuildBodyBinDataTypeBinaryTest do
  use ExUnit.Case, async: true
  doctest Iso8583Parser

  test "build body bin (body size 1) (data type binary) (1 byte)" do
    assert(Iso8583Parser.build_body(1, :x, 8, <<128>>, :bin) == <<128>>)
  end

  test "build body bin (body size 1) (data type binary) (2 bytes)" do
    assert(Iso8583Parser.build_body(1, :x, 16, <<128, 123>>, :bin) == <<128, 123>>)
  end

  test "build body bin (body size 1) (data type binary) (3 bytes)" do
    assert(Iso8583Parser.build_body(1, :x, 24, <<128, 123, 111>>, :bin) == <<128, 123, 111>>)
  end

  test "build body bin (body size 1) (data type binary) (4 bytes)" do
    assert(Iso8583Parser.build_body(1, :x, 24, <<128, 123, 111, 111>>, :bin) == <<128, 123, 111>>)
  end
end
