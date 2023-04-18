defmodule Iso8583ParserBuildHeaderBinDataTypeStringTest do
  use ExUnit.Case, async: true
  doctest Iso8583Parser

  # header size 1

  test "build header bin (header size 1) (data type string) (data size 1)" do
    assert(Iso8583Parser.build_header(1, :a, 9, "a", :bin) == <<01>>)
  end

  test "build header bin (header size 1) (data type string) (data size 2)" do
    assert(Iso8583Parser.build_header(1, :a, 9, "ab", :bin) == <<02>>)
  end

  test "build header bin (header size 1) (data type string) (data size 3)" do
    assert(Iso8583Parser.build_header(1, :a, 9, "abc", :bin) == <<03>>)
  end

  test "build header bin (header size 1) (data type string) (data size 4)" do
    assert(Iso8583Parser.build_header(1, :a, 9, "abcd", :bin) == <<04>>)
  end

  test "build header bin (header size 1) (data type string) (data size 5)" do
    assert(Iso8583Parser.build_header(1, :a, 9, "abcde", :bin) == <<05>>)
  end

  test "build header bin (header size 1) (data type string) (data size 6)" do
    assert(Iso8583Parser.build_header(1, :a, 9, "abcdef", :bin) == <<06>>)
  end

  test "build header bin (header size 1) (data type string) (data size 7)" do
    assert(Iso8583Parser.build_header(1, :a, 9, "abcdefg", :bin) == <<07>>)
  end

  test "build header bin (header size 1) (data type string) (data size 8)" do
    assert(Iso8583Parser.build_header(1, :a, 9, "abcdefgh", :bin) == <<08>>)
  end

  test "build header bin (header size 1) (data type string) (data size 9)" do
    assert(Iso8583Parser.build_header(1, :a, 9, "abcdefghi", :bin) == <<09>>)
  end

  test "build header bin (header size 1) (data type string) (data size 10)" do # cap to 9
    assert(Iso8583Parser.build_header(1, :a, 9, "abcdefghij", :bin) == <<09>>)
  end

  test "build header bin (header size 1) (data type string) (data size 11)" do # cap to 9
    assert(Iso8583Parser.build_header(1, :a, 9, "abcdefghijk", :bin) == <<09>>)
  end

  test "build header bin (header size 1) (data type string) (data size 12)" do # cap to 9
    assert(Iso8583Parser.build_header(1, :a, 9, "abcdefghijkl", :bin) == <<09>>)
  end

  # header size 2

  test "build header bin (header size 2) (data type string) (data size 1)" do
    assert(Iso8583Parser.build_header(2, :a, 15, "a", :bin) == <<01>>)
  end

  test "build header bin (header size 2) (data type string) (data size 2)" do
    assert(Iso8583Parser.build_header(2, :a, 15, "ab", :bin) == <<02>>)
  end

  test "build header bin (header size 2) (data type string) (data size 3)" do
    assert(Iso8583Parser.build_header(2, :a, 15, "abc", :bin) == <<03>>)
  end

  test "build header bin (header size 2) (data type string) (data size 4)" do
    assert(Iso8583Parser.build_header(2, :a, 15, "abcd", :bin) == <<04>>)
  end

  test "build header bin (header size 2) (data type string) (data size 5)" do
    assert(Iso8583Parser.build_header(2, :a, 15, "abcde", :bin) == <<05>>)
  end

  test "build header bin (header size 2) (data type string) (data size 6)" do
    assert(Iso8583Parser.build_header(2, :a, 15, "abcdef", :bin) == <<06>>)
  end

  test "build header bin (header size 2) (data type string) (data size 7)" do
    assert(Iso8583Parser.build_header(2, :a, 15, "abcdefg", :bin) == <<07>>)
  end

  test "build header bin (header size 2) (data type string) (data size 8)" do
    assert(Iso8583Parser.build_header(2, :a, 15, "abcdefgh", :bin) == <<08>>)
  end

  test "build header bin (header size 2) (data type string) (data size 9)" do
    assert(Iso8583Parser.build_header(2, :a, 15, "abcdefghi", :bin) == <<09>>)
  end

  test "build header bin (header size 2) (data type string) (data size 10)" do
    assert(Iso8583Parser.build_header(2, :a, 15, "abcdefghij", :bin) == Base.decode16!("10"))
  end

  test "build header bin (header size 2) (data type string) (data size 11)" do
    assert(Iso8583Parser.build_header(2, :a, 15, "abcdefghijk", :bin) == Base.decode16!("11"))
  end

  test "build header bin (header size 2) (data type string) (data size 12)" do
    assert(Iso8583Parser.build_header(2, :a, 15, "abcdefghijkl", :bin) == Base.decode16!("12"))
  end

  test "build header bin (header size 2) (data type string) (data size 13)" do
    assert(Iso8583Parser.build_header(2, :a, 15, "abcdefghijklm", :bin) == Base.decode16!("13"))
  end

  test "build header bin (header size 2) (data type string) (data size 14)" do
    assert(Iso8583Parser.build_header(2, :a, 15, "abcdefghijklmn", :bin) == Base.decode16!("14"))
  end

  test "build header bin (header size 2) (data type string) (data size 15)" do
    assert(Iso8583Parser.build_header(2, :a, 15, "abcdefghijklmno", :bin) == Base.decode16!("15"))
  end

  test "build header bin (header size 2) (data type string) (data size 16)" do
    assert(Iso8583Parser.build_header(2, :a, 15, "abcdefghijklmnop", :bin) == Base.decode16!("15")) # cap to 15
  end

  test "build header bin (header size 2) (data type string) (data size 17)" do
    assert(Iso8583Parser.build_header(2, :a, 15, "abcdefghijklmnopq", :bin) == Base.decode16!("15")) # cap to 15
  end

  test "build header bin (header size 2) (data type string) (data size 18)" do
    assert(Iso8583Parser.build_header(2, :a, 15, "abcdefghijklmnopqr", :bin) == Base.decode16!("15")) # cap to 15
  end

  # header size 3

  # header size 3

  test "build header bin (header size 3) (data type string) (data size 1)" do
    assert(Iso8583Parser.build_header(3, :a, 100, "a", :bin) == <<0,1>>)
  end

  test "build header bin (header size 3) (data type string) (data size 2)" do
    assert(Iso8583Parser.build_header(3, :a, 100, "ab", :bin) == <<0,2>>)
  end

  test "build header bin (header size 3) (data type string) (data size 3)" do
    assert(Iso8583Parser.build_header(3, :a, 100, "abc", :bin) == <<0,3>>)
  end

  test "build header bin (header size 3) (data type string) (data size 4)" do
    assert(Iso8583Parser.build_header(3, :a, 100, "abcd", :bin) == <<0,4>>)
  end

  test "build header bin (header size 3) (data type string) (data size 5)" do
    assert(Iso8583Parser.build_header(3, :a, 100, "abcde", :bin) == <<0,5>>)
  end

  test "build header bin (header size 3) (data type string) (data size 6)" do
    assert(Iso8583Parser.build_header(3, :a, 100, "abcdef", :bin) == <<0,6>>)
  end

  test "build header bin (header size 3) (data type string) (data size 7)" do
    assert(Iso8583Parser.build_header(3, :a, 100, "abcdefg", :bin) == <<0,7>>)
  end

  test "build header bin (header size 3) (data type string) (data size 8)" do
    assert(Iso8583Parser.build_header(3, :a, 100, "abcdefgh", :bin) == <<0,8>>)
  end

  test "build header bin (header size 3) (data type string) (data size 9)" do
    assert(Iso8583Parser.build_header(3, :a, 100, "abcdefghi", :bin) == <<0,9>>)
  end

  test "build header bin (header size 3) (data type string) (data size 10)" do
    assert(Iso8583Parser.build_header(3, :a, 100, "abcdefghij", :bin) == Base.decode16!("0010"))
  end

  test "build header bin (header size 3) (data type string) (data size 11)" do
    assert(Iso8583Parser.build_header(3, :a, 100, "abcdefghijk", :bin) == Base.decode16!("0011"))
  end

  test "build header bin (header size 3) (data type string) (data size 12)" do
    assert(Iso8583Parser.build_header(3, :a, 100, "abcdefghijkl", :bin) == Base.decode16!("0012"))
  end

  test "build header bin (header size 3) (data type string) (data size 13)" do
    assert(Iso8583Parser.build_header(3, :a, 100, "abcdefghijklm", :bin) == Base.decode16!("0013"))
  end

  test "build header bin (header size 3) (data type string) (data size 14)" do
    assert(Iso8583Parser.build_header(3, :a, 100, "abcdefghijklmn", :bin) == Base.decode16!("0014"))
  end

  test "build header bin (header size 3) (data type string) (data size 15)" do
    assert(Iso8583Parser.build_header(3, :a, 100, "abcdefghijklmno", :bin) == Base.decode16!("0015"))
  end

  test "build header bin (header size 3) (data type string) (data size 16)" do
    assert(Iso8583Parser.build_header(3, :a, 100, "abcdefghijklmnop", :bin) == Base.decode16!("0016"))
  end

  test "build header bin (header size 3) (data type string) (data size 17)" do
    assert(Iso8583Parser.build_header(3, :a, 100, "abcdefghijklmnopq", :bin) == Base.decode16!("0017"))
  end

  test "build header bin (header size 3) (data type string) (data size 18)" do
    assert(Iso8583Parser.build_header(3, :a, 100, "abcdefghijklmnopqr", :bin) == Base.decode16!("0018"))
  end

  test "build header bin (header size 3) (data type string) (data size 50)" do
    assert(Iso8583Parser.build_header(3, :a, 100, "abcdefghijklmnopqr12345678901234567890123456789012", :bin) == Base.decode16!("0050"))
  end

  test "build header bin (header size 3) (data type string) (data size 71)" do
    assert(Iso8583Parser.build_header(3, :a, 100, "abcdefghijklmnopqr12345678901234567890123456789012345678901234567890123", :bin) == Base.decode16!("0071"))
  end

  test "build header bin (header size 3) (data type string) (data size 97)" do
    assert(Iso8583Parser.build_header(3, :a, 100, "abcdefghijklmnopqr1234567890123456789012345678901234567890123456789012345678901234567890123456789", :bin) == Base.decode16!("0097"))
  end

  test "build header bin (header size 3) (data type string) (data size 98)" do
    assert(Iso8583Parser.build_header(3, :a, 100, "abcdefghijklmnopqr12345678901234567890123456789012345678901234567890123456789012345678901234567890", :bin) == Base.decode16!("0098"))
  end

  test "build header bin (header size 3) (data type string) (data size 99)" do
    assert(Iso8583Parser.build_header(3, :a, 100, "abcdefghijklmnopqr123456789012345678901234567890123456789012345678901234567890123456789012345678901", :bin) == Base.decode16!("0099"))
  end

  test "build header bin (header size 3) (data type string) (data size 100)" do
    assert(Iso8583Parser.build_header(3, :a, 100, "abcdefghijklmnopqr1234567890123456789012345678901234567890123456789012345678901234567890123456789012", :bin) == Base.decode16!("0100"))
  end

  test "build header bin (header size 3) (data type string) (data size 101)" do
    assert(Iso8583Parser.build_header(3, :a, 100, "abcdefghijklmnopqr12345678901234567890123456789012345678901234567890123456789012345678901234567890123", :bin) == Base.decode16!("0100"))
  end

  test "build header bin (header size 3) (data type string) (data size 102)" do
    assert(Iso8583Parser.build_header(3, :a, 100, "abcdefghijklmnopqr123456789012345678901234567890123456789012345678901234567890123456789012345678901234", :bin) == Base.decode16!("0100"))
  end

  test "build header bin (header size 3) (data type string) (data size 103)" do
    assert(Iso8583Parser.build_header(3, :a, 100, "abcdefghijklmnopqr1234567890123456789012345678901234567890123456789012345678901234567890123456789012345", :bin) == Base.decode16!("0100"))
  end

end
