defmodule Iso8583ParserEncodeBinNumTest do
  use ExUnit.Case
  doctest Iso8583Parser
  alias Iso8583Pasrser.Helpers

  test "encode bin 1 bytes" do
    assert(Base.encode16("01") |> Helpers.encode(:bin, :n) == "01")
  end

  test "encode bin 2 bytes" do
    assert(Base.encode16("0102") |> Helpers.encode(:bin, :n) == "0102")
  end

  test "encode bin 3 bytes" do
    assert(Base.encode16("010203") |> Helpers.encode(:bin, :n) == "010203")
  end

  test "encode bin 4 bytes" do
    assert(Base.encode16("01020304") |> Helpers.encode(:bin, :n) == "01020304")
  end

  test "encode bin 5 bytes" do
    assert(Base.encode16("0102030405") |> Helpers.encode(:bin, :n) == "0102030405")
  end

  test "encode bin 6 bytes" do
    assert(Base.encode16("010203040506") |> Helpers.encode(:bin, :n) == "010203040506")
  end

  test "encode bin 7 bytes" do
    assert(Base.encode16("01020304050607") |> Helpers.encode(:bin, :n) == "01020304050607")
  end

  test "encode bin 8 bytes" do
    assert(Base.encode16("0102030405060708") |> Helpers.encode(:bin, :n) == "0102030405060708")
  end

  test "encode bin 9 bytes" do
    assert(Base.encode16("010203040506070809") |> Helpers.encode(:bin, :n) == "010203040506070809")
  end

  test "encode bin 10 bytes" do
    assert(Base.encode16("01020304050607080910") |> Helpers.encode(:bin, :n) == "01020304050607080910")
  end

  test "encode bin 11 bytes" do
    assert(Base.encode16("0102030405060708091011") |> Helpers.encode(:bin, :n) == "0102030405060708091011")
  end

  test "encode bin 12 bytes" do
    assert(Base.encode16("010203040506070809101112") |> Helpers.encode(:bin, :n) == "010203040506070809101112")
  end

  test "encode bin 13 bytes" do
    assert(Base.encode16("01020304050607080910111213") |> Helpers.encode(:bin, :n) == "01020304050607080910111213")
  end
end
