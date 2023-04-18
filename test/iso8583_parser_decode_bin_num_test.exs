defmodule Iso8583ParserDecodeBinNumTest do
  use ExUnit.Case, async: true
  doctest Iso8583Parser
  alias Iso8583Pasrser.Helpers

  test "decode bin 1 bytes" do
    assert(Base.decode16!("01") |> Helpers.decode(:bin, :n) == "01")
  end

  test "decode bin 2 bytes" do
    assert(Base.decode16!("0102") |> Helpers.decode(:bin, :n) == "0102")
  end

  test "decode bin 3 bytes" do
    assert(Base.decode16!("010203") |> Helpers.decode(:bin, :n) == "010203")
  end

  test "decode bin 4 bytes" do
    assert(Base.decode16!("01020304") |> Helpers.decode(:bin, :n) == "01020304")
  end

  test "decode bin 5 bytes" do
    assert(Base.decode16!("0102030405") |> Helpers.decode(:bin, :n) == "0102030405")
  end

  test "decode bin 6 bytes" do
    assert(Base.decode16!("010203040506") |> Helpers.decode(:bin, :n) == "010203040506")
  end

  test "decode bin 7 bytes" do
    assert(Base.decode16!("01020304050607") |> Helpers.decode(:bin, :n) == "01020304050607")
  end

  test "decode bin 8 bytes" do
    assert(Base.decode16!("0102030405060708") |> Helpers.decode(:bin, :n) == "0102030405060708")
  end

  test "decode bin 9 bytes" do
    assert(Base.decode16!("010203040506070809") |> Helpers.decode(:bin, :n) == "010203040506070809")
  end

  test "decode bin 10 bytes" do
    assert(Base.decode16!("01020304050607080910") |> Helpers.decode(:bin, :n) == "01020304050607080910")
  end

  test "decode bin 11 bytes" do
    assert(Base.decode16!("0102030405060708091011") |> Helpers.decode(:bin, :n) == "0102030405060708091011")
  end

  test "decode bin 12 bytes" do
    assert(Base.decode16!("010203040506070809101112") |> Helpers.decode(:bin, :n) == "010203040506070809101112")
  end

  test "decode bin 13 bytes" do
    assert(Base.decode16!("01020304050607080910111213") |> Helpers.decode(:bin, :n) == "01020304050607080910111213")
  end
end
