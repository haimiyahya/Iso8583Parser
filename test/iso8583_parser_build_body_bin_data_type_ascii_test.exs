defmodule Iso8583ParserBuildBodyBinDataTypeAsciiTest do
  use ExUnit.Case, async: true
  doctest Iso8583Parser

  # h 0

  test "build body bin (head size 0) (data type ascii) (1 char)" do
    assert(Iso8583Parser.build_body(0, :a, 8, "a", :bin) == "a       ")
  end

  test "build body bin (head size 0) (data type ascii) (2 char)" do
    assert(Iso8583Parser.build_body(0, :a, 8, "ab", :bin) == "ab      ")
  end

  test "build body bin (head size 0) (data type ascii) (3 char)" do
    assert(Iso8583Parser.build_body(0, :a, 8, "abc", :bin) == "abc     ")
  end

  test "build body bin (head size 0) (data type ascii) (4 char)" do
    assert(Iso8583Parser.build_body(0, :a, 8, "abcd", :bin) == "abcd    ")
  end

  test "build body bin (head size 0) (data type ascii) (5 char)" do
    assert(Iso8583Parser.build_body(0, :a, 8, "abcde", :bin) == "abcde   ")
  end

  test "build body bin (head size 0) (data type ascii) (6 char)" do
    assert(Iso8583Parser.build_body(0, :a, 8, "abcdef", :bin) == "abcdef  ")
  end

  test "build body bin (head size 0) (data type ascii) (7 char)" do
    assert(Iso8583Parser.build_body(0, :a, 8, "abcdefg", :bin) == "abcdefg ")
  end

  test "build body bin (head size 0) (data type ascii) (8 char)" do
    assert(Iso8583Parser.build_body(0, :a, 8, "abcdefgh", :bin) == "abcdefgh")
  end

  test "build body bin (head size 0) (data type ascii) (9 char)" do
    assert(Iso8583Parser.build_body(0, :a, 8, "abcdefghi", :bin) == "abcdefgh")
  end

  test "build body bin (head size 0) (data type ascii) (10 char)" do
    assert(Iso8583Parser.build_body(0, :a, 8, "abcdefghij", :bin) == "abcdefgh")
  end

  # h 1

  test "build body bin (head size 1) (data type ascii) (1 char)" do
    assert(Iso8583Parser.build_body(1, :a, 8, "a", :bin) == "a")
  end

  test "build body bin (head size 1) (data type ascii) (2 char)" do
    assert(Iso8583Parser.build_body(1, :a, 8, "ab", :bin) == "ab")
  end

  test "build body bin (head size 1) (data type ascii) (3 char)" do
    assert(Iso8583Parser.build_body(1, :a, 8, "abc", :bin) == "abc")
  end

  test "build body bin (head size 1) (data type ascii) (4 char)" do
    assert(Iso8583Parser.build_body(1, :a, 8, "abcd", :bin) == "abcd")
  end

  test "build body bin (head size 1) (data type ascii) (5 char)" do
    assert(Iso8583Parser.build_body(1, :a, 8, "abcde", :bin) == "abcde")
  end

  test "build body bin (head size 1) (data type ascii) (6 char)" do
    assert(Iso8583Parser.build_body(1, :a, 8, "abcdef", :bin) == "abcdef")
  end

  test "build body bin (head size 1) (data type ascii) (7 char)" do
    assert(Iso8583Parser.build_body(1, :a, 8, "abcdefg", :bin) == "abcdefg")
  end

  test "build body bin (head size 1) (data type ascii) (8 char)" do
    assert(Iso8583Parser.build_body(1, :a, 8, "abcdefgh", :bin) == "abcdefgh")
  end

  test "build body bin (head size 1) (data type ascii) (9 char)" do
    assert(Iso8583Parser.build_body(1, :a, 8, "abcdefghi", :bin) == "abcdefgh")
  end

  test "build body bin (head size 1) (data type ascii) (10 char)" do
    assert(Iso8583Parser.build_body(1, :a, 8, "abcdefghij", :bin) == "abcdefgh")
  end


  # h 2

  test "build body bin (head size 2) (data type ascii) (33 char)" do
    assert(Iso8583Parser.build_body(2, :a, 35, String.duplicate("a", 33), :bin) == String.duplicate("a", 33))
  end

  test "build body bin (head size 2) (data type ascii) (34 char)" do
    assert(Iso8583Parser.build_body(2, :a, 35, String.duplicate("a", 34), :bin) == String.duplicate("a", 34))
  end

  test "build body bin (head size 2) (data type ascii) (35 char)" do
    assert(Iso8583Parser.build_body(2, :a, 35, String.duplicate("a", 35), :bin) == String.duplicate("a", 35))
  end

  test "build body bin (head size 2) (data type ascii) (36 char)" do
    assert(Iso8583Parser.build_body(2, :a, 35, String.duplicate("a", 36), :bin) == String.duplicate("a", 35))
  end

  test "build body bin (head size 2) (data type ascii) (37 char)" do
    assert(Iso8583Parser.build_body(2, :a, 35, String.duplicate("a", 37), :bin) == String.duplicate("a", 35))
  end

  test "build body bin (head size 2) (data type ascii) (38 char)" do
    assert(Iso8583Parser.build_body(2, :a, 35, String.duplicate("a", 38), :bin) == String.duplicate("a", 35))
  end

  test "build body bin (head size 2) (data type ascii) (39 char)" do
    assert(Iso8583Parser.build_body(2, :a, 35, String.duplicate("a", 39), :bin) == String.duplicate("a", 35))
  end

  test "build body bin (head size 2) (data type ascii) (40 char)" do
    assert(Iso8583Parser.build_body(2, :a, 35, String.duplicate("a", 40), :bin) == String.duplicate("a", 35))
  end

  test "build body bin (head size 2) (data type ascii) (41 char)" do
    assert(Iso8583Parser.build_body(2, :a, 35, String.duplicate("a", 41), :bin) == String.duplicate("a", 35))
  end

  test "build body bin (head size 2) (data type ascii) (42 char)" do
    assert(Iso8583Parser.build_body(2, :a, 35, String.duplicate("a", 42), :bin) == String.duplicate("a", 35))
  end
end
