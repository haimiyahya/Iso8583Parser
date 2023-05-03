defmodule Iso8583ParserBuildHeaderBinDataTypeNumTest do
  use ExUnit.Case, async: true
  doctest Iso8583Parser

  # header size 1

  test "build header bin (header size 1) (data type numeric) (data size 1)" do
    assert(Iso8583Parser.build_header(1, :n, 9, "1", :bin) == <<1>>)
  end

  test "build header bin (header size 1) (data type numeric) (data size 2)" do
    assert(Iso8583Parser.build_header(1, :n, 9, "12", :bin) == <<2>>)
  end

  test "build header bin (header size 1) (data type numeric) (data size 3)" do
    assert(Iso8583Parser.build_header(1, :n, 9, "123", :bin) == <<3>>)
  end

  test "build header bin (header size 1) (data type numeric) (data size 4)" do
    assert(Iso8583Parser.build_header(1, :n, 9, "1234", :bin) == <<4>>)
  end

  test "build header bin (header size 1) (data type numeric) (data size 5)" do
    assert(Iso8583Parser.build_header(1, :n, 9, "12345", :bin) == <<5>>)
  end

  test "build header bin (header size 1) (data type numeric) (data size 6)" do
    assert(Iso8583Parser.build_header(1, :n, 9, "123456", :bin) == <<6>>)
  end

  test "build header bin (header size 1) (data type numeric) (data size 7)" do
    assert(Iso8583Parser.build_header(1, :n, 9, "1234567", :bin) == <<7>>)
  end

  test "build header bin (header size 1) (data type numeric) (data size 8)" do
    assert(Iso8583Parser.build_header(1, :n, 9, "12345678", :bin) == <<8>>)
  end

  test "build header bin (header size 1) (data type numeric) (data size 9)" do
    assert(Iso8583Parser.build_header(1, :n, 9, "123456789", :bin) == <<9>>)
  end

  test "build header bin (header size 1) (data type numeric) (data size 10)" do # cap to 9
    assert(Iso8583Parser.build_header(1, :n, 9, "1234567891", :bin) == <<9>>)
  end

  test "build header bin (header size 1) (data type numeric) (data size 11)" do # cap to 9
    assert(Iso8583Parser.build_header(1, :n, 9, "12345678912", :bin) == <<9>>)
  end

  test "build header bin (header size 1) (data type numeric) (data size 12)" do # cap to 8
    assert(Iso8583Parser.build_header(1, :n, 9, "123456789123", :bin) == <<9>>)
  end

  # header size 2

  test "build header bin (header size 2) (data type numeric) (data size 1)" do
    assert(Iso8583Parser.build_header(2, :n, 15, "1", :bin) == <<1>>)
  end

  test "build header bin (header size 2) (data type numeric) (data size 2)" do
    assert(Iso8583Parser.build_header(2, :n, 15, "12", :bin) == <<2>>)
  end

  test "build header bin (header size 2) (data type numeric) (data size 3)" do
    assert(Iso8583Parser.build_header(2, :n, 15, "123", :bin) == <<3>>)
  end

  test "build header bin (header size 2) (data type numeric) (data size 4)" do
    assert(Iso8583Parser.build_header(2, :n, 15, "1234", :bin) == <<4>>)
  end

  test "build header bin (header size 2) (data type numeric) (data size 5)" do
    assert(Iso8583Parser.build_header(2, :n, 15, "12345", :bin) == <<5>>)
  end

  test "build header bin (header size 2) (data type numeric) (data size 6)" do
    assert(Iso8583Parser.build_header(2, :n, 15, "123456", :bin) == <<6>>)
  end

  test "build header bin (header size 2) (data type numeric) (data size 7)" do
    assert(Iso8583Parser.build_header(2, :n, 15, "1234567", :bin) == <<7>>)
  end

  test "build header bin (header size 2) (data type numeric) (data size 8)" do
    assert(Iso8583Parser.build_header(2, :n, 15, "12345678", :bin) == <<8>>)
  end

  test "build header bin (header size 2) (data type numeric) (data size 9)" do
    assert(Iso8583Parser.build_header(2, :n, 15, "123456789", :bin) == <<9>>)
  end

  test "build header bin (header size 2) (data type numeric) (data size 10)" do
    assert(Iso8583Parser.build_header(2, :n, 15, "1234567890", :bin) == Base.decode16!("10"))
  end

  test "build header bin (header size 2) (data type numeric) (data size 11)" do
    assert(Iso8583Parser.build_header(2, :n, 15, "12345678901", :bin) == Base.decode16!("11"))
  end

  test "build header bin (header size 2) (data type numeric) (data size 12)" do
    assert(Iso8583Parser.build_header(2, :n, 15, "123456789012", :bin) == Base.decode16!("12"))
  end

  test "build header bin (header size 2) (data type numeric) (data size 13)" do
    assert(Iso8583Parser.build_header(2, :n, 15, "1234567890123", :bin) == Base.decode16!("13"))
  end

  test "build header bin (header size 2) (data type numeric) (data size 14)" do
    assert(Iso8583Parser.build_header(2, :n, 15, "12345678901234", :bin) == Base.decode16!("14"))
  end

  test "build header bin (header size 2) (data type numeric) (data size 15)" do
    assert(Iso8583Parser.build_header(2, :n, 15, "123456789012345", :bin) == Base.decode16!("15"))
  end

  test "build header bin (header size 2) (data type numeric) (data size 16)" do
    assert(Iso8583Parser.build_header(2, :n, 15, "1234567890123456", :bin) == Base.decode16!("15")) # cap to 15
  end

  test "build header bin (header size 2) (data type numeric) (data size 17)" do
    assert(Iso8583Parser.build_header(2, :n, 15, "12345678901234567", :bin) == Base.decode16!("15")) # cap to 15
  end

  test "build header bin (header size 2) (data type numeric) (data size 18)" do
    assert(Iso8583Parser.build_header(2, :n, 15, "123456789012345678", :bin) == Base.decode16!("15")) # cap to 15
  end

  # header size 3

  # header size 3

  test "build header bin (header size 3) (data type numeric) (data size 1)" do
    assert(Iso8583Parser.build_header(3, :n, 100, "1", :bin) == <<0,1>>)
  end

  test "build header bin (header size 3) (data type numeric) (data size 2)" do
    assert(Iso8583Parser.build_header(3, :n, 100, "12", :bin) == <<0,2>>)
  end

  test "build header bin (header size 3) (data type numeric) (data size 3)" do
    assert(Iso8583Parser.build_header(3, :n, 100, "123", :bin) == <<0,3>>)
  end

  test "build header bin (header size 3) (data type numeric) (data size 4)" do
    assert(Iso8583Parser.build_header(3, :n, 100, "1234", :bin) == <<0,4>>)
  end

  test "build header bin (header size 3) (data type numeric) (data size 5)" do
    assert(Iso8583Parser.build_header(3, :n, 100, "12345", :bin) == <<0,5>>)
  end

  test "build header bin (header size 3) (data type numeric) (data size 6)" do
    assert(Iso8583Parser.build_header(3, :n, 100, "123456", :bin) == <<0,6>>)
  end

  test "build header bin (header size 3) (data type numeric) (data size 7)" do
    assert(Iso8583Parser.build_header(3, :n, 100, "1234567", :bin) == <<0,7>>)
  end

  test "build header bin (header size 3) (data type numeric) (data size 8)" do
    assert(Iso8583Parser.build_header(3, :n, 100, "12345678", :bin) == <<0,8>>)
  end

  test "build header bin (header size 3) (data type numeric) (data size 9)" do
    assert(Iso8583Parser.build_header(3, :n, 100, "123456789", :bin) == <<0,9>>)
  end

  test "build header bin (header size 3) (data type numeric) (data size 10)" do
    assert(Iso8583Parser.build_header(3, :n, 100, "1234567890", :bin) == Base.decode16!("0010"))
  end

  test "build header bin (header size 3) (data type numeric) (data size 11)" do
    assert(Iso8583Parser.build_header(3, :n, 100, "12345678901", :bin) == Base.decode16!("0011"))
  end

  test "build header bin (header size 3) (data type numeric) (data size 12)" do
    assert(Iso8583Parser.build_header(3, :n, 100, "123456789012", :bin) == Base.decode16!("0012"))
  end

  test "build header bin (header size 3) (data type numeric) (data size 13)" do
    assert(Iso8583Parser.build_header(3, :n, 100, "1234567890123", :bin) == Base.decode16!("0013"))
  end

  test "build header bin (header size 3) (data type numeric) (data size 14)" do
    assert(Iso8583Parser.build_header(3, :n, 100, "12345678901234", :bin) == Base.decode16!("0014"))
  end

  test "build header bin (header size 3) (data type numeric) (data size 15)" do
    assert(Iso8583Parser.build_header(3, :n, 100, "123456789012345", :bin) == Base.decode16!("0015"))
  end

  test "build header bin (header size 3) (data type numeric) (data size 16)" do
    assert(Iso8583Parser.build_header(3, :n, 100, "1234567890123456", :bin) == Base.decode16!("0016"))
  end

  test "build header bin (header size 3) (data type numeric) (data size 17)" do
    assert(Iso8583Parser.build_header(3, :n, 100, "12345678901234567", :bin) == Base.decode16!("0017"))
  end

  test "build header bin (header size 3) (data type numeric) (data size 18)" do
    assert(Iso8583Parser.build_header(3, :n, 100, "123456789012345678", :bin) == Base.decode16!("0018"))
  end

  test "build header bin (header size 3) (data type numeric) (data size 50)" do
    assert(Iso8583Parser.build_header(3, :n, 100, String.duplicate("1", 50), :bin) == Base.decode16!("0050"))
  end

  test "build header bin (header size 3) (data type numeric) (data size 71)" do
    assert(Iso8583Parser.build_header(3, :n, 100, String.duplicate("1", 71), :bin) == Base.decode16!("0071"))
  end

  test "build header bin (header size 3) (data type numeric) (data size 96)" do
    assert(Iso8583Parser.build_header(3, :n, 100, String.duplicate("1", 96), :bin) == Base.decode16!("0096"))
  end

  test "build header bin (header size 3) (data type numeric) (data size 97)" do
    assert(Iso8583Parser.build_header(3, :n, 100, String.duplicate("1", 97), :bin) == Base.decode16!("0097"))
  end

  test "build header bin (header size 3) (data type numeric) (data size 98)" do
    assert(Iso8583Parser.build_header(3, :n, 100, String.duplicate("1", 98), :bin) == Base.decode16!("0098"))
  end

  test "build header bin (header size 3) (data type numeric) (data size 99)" do
    assert(Iso8583Parser.build_header(3, :n, 100, String.duplicate("1", 99), :bin) == Base.decode16!("0099"))
  end

  test "build header bin (header size 3) (data type numeric) (data size 100)" do
    assert(Iso8583Parser.build_header(3, :n, 100, String.duplicate("1", 100), :bin) == Base.decode16!("0100"))
  end

  test "build header bin (header size 3) (data type numeric) (data size 101)" do
    assert(Iso8583Parser.build_header(3, :n, 100, String.duplicate("1", 101), :bin) == Base.decode16!("0100"))
  end

  test "build header bin (header size 3) (data type numeric) (data size 102)" do
    assert(Iso8583Parser.build_header(3, :n, 100, String.duplicate("1", 102), :bin) == Base.decode16!("0100"))
  end

  test "build header bin (header size 3) (data type numeric) (data size 103)" do
    assert(Iso8583Parser.build_header(3, :n, 100, String.duplicate("1", 103), :bin) == Base.decode16!("0100"))
  end

  test "build header bin (header size 3) (data type numeric) (data size 104)" do
    assert(Iso8583Parser.build_header(3, :n, 100, String.duplicate("1", 104), :bin) == Base.decode16!("0100"))
  end

  test "build header bin (header size 3) (data type numeric) (data size 105)" do
    assert(Iso8583Parser.build_header(3, :n, 100, String.duplicate("1", 105), :bin) == Base.decode16!("0100"))
  end

end
