defmodule Iso8583ParserTranslateBinNumTest do
  use ExUnit.Case
  doctest Iso8583Parser
  alias Iso8583Pasrser.Helpers

  test "translate bin 1 bytes" do
    assert(Base.decode16!("01") |> Helpers.translate(:bin, :n) == "01")
  end

  test "translate bin 2 bytes" do
    assert(Base.decode16!("0102") |> Helpers.translate(:bin, :n) == "0102")
  end

  test "translate bin 3 bytes" do
    assert(Base.decode16!("010203") |> Helpers.translate(:bin, :n) == "010203")
  end

  test "translate bin 4 bytes" do
    assert(Base.decode16!("01020304") |> Helpers.translate(:bin, :n) == "01020304")
  end

  test "translate bin 5 bytes" do
    assert(Base.decode16!("0102030405") |> Helpers.translate(:bin, :n) == "0102030405")
  end

  test "translate bin 6 bytes" do
    assert(Base.decode16!("010203040506") |> Helpers.translate(:bin, :n) == "010203040506")
  end

  test "translate bin 7 bytes" do
    assert(Base.decode16!("01020304050607") |> Helpers.translate(:bin, :n) == "01020304050607")
  end

  test "translate bin 8 bytes" do
    assert(Base.decode16!("0102030405060708") |> Helpers.translate(:bin, :n) == "0102030405060708")
  end

  test "translate bin 9 bytes" do
    assert(Base.decode16!("010203040506070809") |> Helpers.translate(:bin, :n) == "010203040506070809")
  end

  test "translate bin 10 bytes" do
    assert(Base.decode16!("01020304050607080910") |> Helpers.translate(:bin, :n) == "01020304050607080910")
  end

  test "translate bin 11 bytes" do
    assert(Base.decode16!("0102030405060708091011") |> Helpers.translate(:bin, :n) == "0102030405060708091011")
  end

  test "translate bin 12 bytes" do
    assert(Base.decode16!("010203040506070809101112") |> Helpers.translate(:bin, :n) == "010203040506070809101112")
  end

  test "translate bin 13 bytes" do
    assert(Base.decode16!("01020304050607080910111213") |> Helpers.translate(:bin, :n) == "01020304050607080910111213")
  end
end
