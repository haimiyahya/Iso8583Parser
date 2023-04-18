defmodule Iso8583ParserBuildBodyBinDataTypeNumTest do
  use ExUnit.Case, async: true
  doctest Iso8583Parser

  # h 0

  test "build body bin (head size 0) (data type num) (1 char)" do
    assert(Iso8583Parser.build_body(0, :n, 8, "1", :bin) == Base.decode16!("10000000"))
  end

  test "build body bin (head size 0) (data type num) (2 char)" do
    assert(Iso8583Parser.build_body(0, :n, 8, "12", :bin) == Base.decode16!("12000000"))
  end

  test "build body bin (head size 0) (data type num) (3 char)" do
    assert(Iso8583Parser.build_body(0, :n, 8, "123", :bin) == Base.decode16!("12300000"))
  end

  test "build body bin (head size 0) (data type num) (4 char)" do
    assert(Iso8583Parser.build_body(0, :n, 8, "1234", :bin) == Base.decode16!("12340000"))
  end

  test "build body bin (head size 0) (data type num) (5 char)" do
    assert(Iso8583Parser.build_body(0, :n, 8, "12345", :bin) == Base.decode16!("12345000"))
  end

  test "build body bin (head size 0) (data type num) (6 char)" do
    assert(Iso8583Parser.build_body(0, :n, 8, "123456", :bin) == Base.decode16!("12345600"))
  end

  test "build body bin (head size 0) (data type num) (7 char)" do
    assert(Iso8583Parser.build_body(0, :n, 8, "1234567", :bin) == Base.decode16!("12345670"))
  end

  test "build body bin (head size 0) (data type num) (8 char)" do
    assert(Iso8583Parser.build_body(0, :n, 8, "12345678", :bin) == Base.decode16!("12345678"))
  end

  test "build body bin (head size 0) (data type num) (9 char)" do
    assert(Iso8583Parser.build_body(0, :n, 8, "123456789", :bin) == Base.decode16!("12345678"))
  end

  test "build body bin (head size 0) (data type num) (10 char)" do
    assert(Iso8583Parser.build_body(0, :n, 8, "1234567890", :bin) == Base.decode16!("12345678"))
  end

  # h 1

  test "build body bin (head size 1) (data type num) (1 char)" do
    assert(Iso8583Parser.build_body(1, :n, 8, "1", :bin) == Base.decode16!("10"))
  end

  test "build body bin (head size 1) (data type num) (2 char)" do
    assert(Iso8583Parser.build_body(1, :n, 8, "12", :bin) == Base.decode16!("12"))
  end

  test "build body bin (head size 1) (data type num) (3 char)" do
    assert(Iso8583Parser.build_body(1, :n, 8, "123", :bin) == Base.decode16!("1230"))
  end

  test "build body bin (head size 1) (data type num) (4 char)" do
    assert(Iso8583Parser.build_body(1, :n, 8, "1234", :bin) == Base.decode16!("1234"))
  end

  test "build body bin (head size 1) (data type num) (5 char)" do
    assert(Iso8583Parser.build_body(1, :n, 8, "12345", :bin) == Base.decode16!("123450"))
  end

  test "build body bin (head size 1) (data type num) (6 char)" do
    assert(Iso8583Parser.build_body(1, :n, 8, "123456", :bin) == Base.decode16!("123456"))
  end

  test "build body bin (head size 1) (data type num) (7 char)" do
    assert(Iso8583Parser.build_body(1, :n, 8, "1234567", :bin) == Base.decode16!("12345670"))
  end

  test "build body bin (head size 1) (data type num) (8 char)" do
    assert(Iso8583Parser.build_body(1, :n, 8, "12345678", :bin) == Base.decode16!("12345678"))
  end

  test "build body bin (head size 1) (data type num) (9 char)" do
    assert(Iso8583Parser.build_body(1, :n, 8, "123456789", :bin) == Base.decode16!("12345678"))
  end

  test "build body bin (head size 1) (data type num) (10 char)" do
    assert(Iso8583Parser.build_body(1, :n, 8, "1234567890", :bin) == Base.decode16!("12345678"))
  end


  # h 2

  test "build body bin (head size 2) (data type num) (33 char)" do
    assert(Iso8583Parser.build_body(2, :n, 35, "123456789012345678901234567890123", :bin) == Base.decode16!("1234567890123456789012345678901230"))
  end

  test "build body bin (head size 2) (data type num) (34 char)" do
    assert(Iso8583Parser.build_body(2, :n, 35, "1234567890123456789012345678901234", :bin) == Base.decode16!("1234567890123456789012345678901234"))
  end

  test "build body bin (head size 2) (data type num) (35 char)" do
    assert(Iso8583Parser.build_body(2, :n, 35, "12345678901234567890123456789012345", :bin) == Base.decode16!("123456789012345678901234567890123450"))
  end

  test "build body bin (head size 2) (data type num) (36 char)" do
    assert(Iso8583Parser.build_body(2, :n, 35, "123456789012345678901234567890123456", :bin) == Base.decode16!("123456789012345678901234567890123450"))
  end

  test "build body bin (head size 2) (data type num) (37 char)" do
    assert(Iso8583Parser.build_body(2, :n, 35, "1234567890123456789012345678901234567", :bin) == Base.decode16!("123456789012345678901234567890123450"))
  end

  test "build body bin (head size 2) (data type num) (38 char)" do
    assert(Iso8583Parser.build_body(2, :n, 35, "12345678901234567890123456789012345678", :bin) == Base.decode16!("123456789012345678901234567890123450"))
  end

  test "build body bin (head size 2) (data type num) (39 char)" do
    assert(Iso8583Parser.build_body(2, :n, 35, "123456789012345678901234567890123456789", :bin) == Base.decode16!("123456789012345678901234567890123450"))
  end

  test "build body bin (head size 2) (data type num) (40 char)" do
    assert(Iso8583Parser.build_body(2, :n, 35, "1234567890123456789012345678901234567890", :bin) == Base.decode16!("123456789012345678901234567890123450"))
  end

  test "build body bin (head size 2) (data type num) (41 char)" do
    assert(Iso8583Parser.build_body(2, :n, 35, "12345678901234567890123456789012345678901", :bin) == Base.decode16!("123456789012345678901234567890123450"))
  end

  test "build body bin (head size 2) (data type num) (42 char)" do
    assert(Iso8583Parser.build_body(2, :n, 35, "123456789012345678901234567890123456789012", :bin) == Base.decode16!("123456789012345678901234567890123450"))
  end
end
