defmodule Iso8583ParserBuildHeaderBinDataTypeBinaryTest do
  use ExUnit.Case, async: true
  doctest Iso8583Parser

  # header size 1

  test "build header bin (header size 1) (data type binary) (data size 1)" do
    assert(Iso8583Parser.build_header(1, :x, 8, <<128>>, :bin) == <<8>>)
  end

  test "build header bin (header size 1) (data type binary) (data size 2)" do
    assert(Iso8583Parser.build_header(1, :x, 8, <<128>>, :bin) == <<8>>)
  end

  test "build header bin (header size 1) (data type binary) (data size 3)" do
    assert(Iso8583Parser.build_header(1, :x, 8, <<128>>, :bin) == <<8>>)
  end

  test "build header bin (header size 1) (data type binary) (data size 4)" do
    assert(Iso8583Parser.build_header(1, :x, 8, <<128>>, :bin) == <<8>>)
  end

  test "build header bin (header size 1) (data type binary) (data size 5)" do
    assert(Iso8583Parser.build_header(1, :x, 8, <<128>>, :bin) == <<8>>)
  end

  test "build header bin (header size 1) (data type binary) (data size 6)" do
    assert(Iso8583Parser.build_header(1, :x, 8, <<128>>, :bin) == <<8>>)
  end

  test "build header bin (header size 1) (data type binary) (data size 7)" do
    assert(Iso8583Parser.build_header(1, :x, 8, <<128>>, :bin) == <<8>>)
  end

  test "build header bin (header size 1) (data type binary) (data size 8)" do
    assert(Iso8583Parser.build_header(1, :x, 8, <<128>>, :bin) == <<8>>)
  end

  test "build header bin (header size 1) (data type binary) (data size 9)" do
    assert(Iso8583Parser.build_header(1, :x, 8, <<128,01>>, :bin) == <<8>>)
  end

  test "build header bin (header size 1) (data type binary) (data size 10)" do # cap to 8
    assert(Iso8583Parser.build_header(1, :x, 8, <<128,01>>, :bin) == <<8>>)
  end

  test "build header bin (header size 1) (data type binary) (data size 11)" do # cap to 8
    assert(Iso8583Parser.build_header(1, :x, 8, <<128,01>>, :bin) == <<8>>)
  end

  test "build header bin (header size 1) (data type binary) (data size 12)" do # cap to 8
    assert(Iso8583Parser.build_header(1, :x, 8, <<128,01>>, :bin) == <<8>>)
  end

  # header size 2

  test "build header bin (header size 2) (data type binary) (data size 1)" do
    assert(Iso8583Parser.build_header(2, :x, 15, <<128>>, :bin) == <<8>>)
  end

  test "build header bin (header size 2) (data type binary) (data size 2)" do
    assert(Iso8583Parser.build_header(2, :x, 15, <<128>>, :bin) == <<8>>)
  end

  test "build header bin (header size 2) (data type binary) (data size 3)" do
    assert(Iso8583Parser.build_header(2, :x, 15, <<128>>, :bin) == <<8>>)
  end

  test "build header bin (header size 2) (data type binary) (data size 4)" do
    assert(Iso8583Parser.build_header(2, :x, 15, <<128>>, :bin) == <<8>>)
  end

  test "build header bin (header size 2) (data type binary) (data size 5)" do
    assert(Iso8583Parser.build_header(2, :x, 15, <<128>>, :bin) == <<8>>)
  end

  test "build header bin (header size 2) (data type binary) (data size 6)" do
    assert(Iso8583Parser.build_header(2, :x, 15, <<128>>, :bin) == <<8>>)
  end

  test "build header bin (header size 2) (data type binary) (data size 7)" do
    assert(Iso8583Parser.build_header(2, :x, 15, <<128>>, :bin) == <<8>>)
  end

  test "build header bin (header size 2) (data type binary) (data size 8)" do
    assert(Iso8583Parser.build_header(2, :x, 15, <<128>>, :bin) == <<8>>)
  end

  test "build header bin (header size 2) (data type binary) (data size 9)" do
    assert(Iso8583Parser.build_header(2, :x, 15, <<128, 01>>, :bin) == Base.decode16!("16"))
  end

  test "build header bin (header size 2) (data type binary) (data size 10)" do
    assert(Iso8583Parser.build_header(2, :x, 15, <<128, 01>>, :bin) == Base.decode16!("16"))
  end

  test "build header bin (header size 2) (data type binary) (data size 11)" do
    assert(Iso8583Parser.build_header(2, :x, 15, <<128, 01>>, :bin) == Base.decode16!("16"))
  end

  test "build header bin (header size 2) (data type binary) (data size 12)" do
    assert(Iso8583Parser.build_header(2, :x, 15, <<128, 01>>, :bin) == Base.decode16!("16"))
  end

  test "build header bin (header size 2) (data type binary) (data size 13)" do
    assert(Iso8583Parser.build_header(2, :x, 15, <<128, 01>>, :bin) == Base.decode16!("16"))
  end

  test "build header bin (header size 2) (data type binary) (data size 14)" do
    assert(Iso8583Parser.build_header(2, :x, 15, <<128, 01>>, :bin) == Base.decode16!("16"))
  end

  test "build header bin (header size 2) (data type binary) (data size 15)" do
    assert(Iso8583Parser.build_header(2, :x, 15, <<128, 01>>, :bin) == Base.decode16!("16"))
  end

  test "build header bin (header size 2) (data type binary) (data size 16)" do
    assert(Iso8583Parser.build_header(2, :x, 15, <<128, 01>>, :bin) == Base.decode16!("16")) # cap to 15
  end

  test "build header bin (header size 2) (data type binary) (data size 17)" do
    assert(Iso8583Parser.build_header(2, :x, 15, <<128, 01>>, :bin) == Base.decode16!("16")) # cap to 15
  end

  test "build header bin (header size 2) (data type binary) (data size 18)" do
    assert(Iso8583Parser.build_header(2, :x, 15, <<128, 01>>, :bin) == Base.decode16!("16")) # cap to 15
  end

  # header size 3

  # header size 3

  test "build header bin (header size 3) (data type binary) (data size 1)" do
    assert(Iso8583Parser.build_header(3, :x, 100, <<128>>, :bin) == <<0,8>>)
  end

  test "build header bin (header size 3) (data type binary) (data size 2)" do
    assert(Iso8583Parser.build_header(3, :x, 100, <<128>>, :bin) == <<0,8>>)
  end

  test "build header bin (header size 3) (data type binary) (data size 3)" do
    assert(Iso8583Parser.build_header(3, :x, 100, <<128>>, :bin) == <<0,8>>)
  end

  test "build header bin (header size 3) (data type binary) (data size 4)" do
    assert(Iso8583Parser.build_header(3, :x, 100, <<128>>, :bin) == <<0,8>>)
  end

  test "build header bin (header size 3) (data type binary) (data size 5)" do
    assert(Iso8583Parser.build_header(3, :x, 100, <<128>>, :bin) == <<0,8>>)
  end

  test "build header bin (header size 3) (data type binary) (data size 6)" do
    assert(Iso8583Parser.build_header(3, :x, 100, <<128>>, :bin) == <<0,8>>)
  end

  test "build header bin (header size 3) (data type binary) (data size 7)" do
    assert(Iso8583Parser.build_header(3, :x, 100, <<128>>, :bin) == <<0,8>>)
  end

  test "build header bin (header size 3) (data type binary) (data size 8)" do
    assert(Iso8583Parser.build_header(3, :x, 100, <<128>>, :bin) == <<0,8>>)
  end

  test "build header bin (header size 3) (data type binary) (data size 9)" do
    assert(Iso8583Parser.build_header(3, :x, 100, <<128,01>>, :bin) == Base.decode16!("0016"))
  end

  test "build header bin (header size 3) (data type binary) (data size 10)" do
    assert(Iso8583Parser.build_header(3, :x, 100, <<128,01>>, :bin) == Base.decode16!("0016"))
  end

  test "build header bin (header size 3) (data type binary) (data size 11)" do
    assert(Iso8583Parser.build_header(3, :x, 100, <<128,01>>, :bin) == Base.decode16!("0016"))
  end

  test "build header bin (header size 3) (data type binary) (data size 12)" do
    assert(Iso8583Parser.build_header(3, :x, 100, <<128,01>>, :bin) == Base.decode16!("0016"))
  end

  test "build header bin (header size 3) (data type binary) (data size 13)" do
    assert(Iso8583Parser.build_header(3, :x, 100, <<128,01>>, :bin) == Base.decode16!("0016"))
  end

  test "build header bin (header size 3) (data type binary) (data size 14)" do
    assert(Iso8583Parser.build_header(3, :x, 100, <<128,01>>, :bin) == Base.decode16!("0016"))
  end

  test "build header bin (header size 3) (data type binary) (data size 15)" do
    assert(Iso8583Parser.build_header(3, :x, 100, <<128,01>>, :bin) == Base.decode16!("0016"))
  end

  test "build header bin (header size 3) (data type binary) (data size 16)" do
    assert(Iso8583Parser.build_header(3, :x, 100, <<128,01>>, :bin) == Base.decode16!("0016"))
  end

  test "build header bin (header size 3) (data type binary) (data size 17)" do
    assert(Iso8583Parser.build_header(3, :x, 100, <<128,1,2>>, :bin) == Base.decode16!("0024"))
  end

  test "build header bin (header size 3) (data type binary) (data size 18)" do
    assert(Iso8583Parser.build_header(3, :x, 100, <<128,1,2>>, :bin) == Base.decode16!("0024"))
  end

  test "build header bin (header size 3) (data type binary) (data size 50)" do
    assert(Iso8583Parser.build_header(3, :x, 100, <<128,1,2>>, :bin) == Base.decode16!("0024"))
  end

  test "build header bin (header size 3) (data type binary) (data size 71)" do
    assert(Iso8583Parser.build_header(3, :x, 100, <<128,1,2>>, :bin) == Base.decode16!("0024"))
  end

  test "build header bin (header size 3) (data type binary) (data size 96)" do
    assert(Iso8583Parser.build_header(3, :x, 100, <<128,1,2,128,1,2,128,1,2,128,1,2>>, :bin) == Base.decode16!("0096"))
  end

  test "build header bin (header size 3) (data type binary) (data size 97)" do
    assert(Iso8583Parser.build_header(3, :x, 100, <<128,1,2,128,1,2,128,1,2,128,1,2,3>>, :bin) == Base.decode16!("0104"))
  end

  test "build header bin (header size 3) (data type binary) (data size 98)" do
    assert(Iso8583Parser.build_header(3, :x, 100, <<128,1,2,128,1,2,128,1,2,128,1,2,3>>, :bin) == Base.decode16!("0104"))
  end

  test "build header bin (header size 3) (data type binary) (data size 99)" do
    assert(Iso8583Parser.build_header(3, :x, 100, <<128,1,2,128,1,2,128,1,2,128,1,2,3>>, :bin) == Base.decode16!("0104"))
  end

  test "build header bin (header size 3) (data type binary) (data size 100)" do
    assert(Iso8583Parser.build_header(3, :x, 100, <<128,1,2,128,1,2,128,1,2,128,1,2,3>>, :bin) == Base.decode16!("0104"))
  end

  test "build header bin (header size 3) (data type binary) (data size 101)" do
    assert(Iso8583Parser.build_header(3, :x, 100, <<128,1,2,128,1,2,128,1,2,128,1,2,3>>, :bin) == Base.decode16!("0104"))
  end

  test "build header bin (header size 3) (data type binary) (data size 102)" do
    assert(Iso8583Parser.build_header(3, :x, 100, <<128,1,2,128,1,2,128,1,2,128,1,2,3>>, :bin) == Base.decode16!("0104"))
  end

  test "build header bin (header size 3) (data type binary) (data size 103)" do
    assert(Iso8583Parser.build_header(3, :x, 100, <<128,1,2,128,1,2,128,1,2,128,1,2,3>>, :bin) == Base.decode16!("0104"))
  end

  test "build header bin (header size 3) (data type binary) (data size 104)" do
    assert(Iso8583Parser.build_header(3, :x, 100, <<128,1,2,128,1,2,128,1,2,128,1,2,3>>, :bin) == Base.decode16!("0104"))
  end

  test "build header bin (header size 3) (data type binary) (data size 105)" do
    assert(Iso8583Parser.build_header(3, :x, 100, <<128,1,2,128,1,2,128,1,2,128,1,2,3,4>>, :bin) == Base.decode16!("0104"))
  end

end
