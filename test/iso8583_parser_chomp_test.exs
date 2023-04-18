defmodule Iso8583ParserChompTest do
  use ExUnit.Case, async: true
  doctest Iso8583Parser
  alias Iso8583Pasrser.Helpers

  test "chomp 1 byte from 1 byte" do
    assert(Helpers.chomp(<<1>>, 1) == {:ok, <<1>>, <<>>})
  end

  test "chomp 1 byte from 2 bytes" do
    assert(Helpers.chomp(<<1,2>>, 1) == {:ok, <<1>>, <<2>>})
  end

  test "chomp 1 byte from 3 bytes" do
    assert(Helpers.chomp(<<1,2,3>>, 1) == {:ok, <<1>>, <<2,3>>})
  end

  test "chomp 1 byte from 4 bytes" do
    assert(Helpers.chomp(<<1,2,3,4>>, 1) == {:ok, <<1>>, <<2,3,4>>})
  end

  test "chomp 1 byte from 5 bytes" do
    assert(Helpers.chomp(<<1,2,3,4,5>>, 1) == {:ok, <<1>>, <<2,3,4,5>>})
  end

  test "chomp 1 byte from 6 bytes" do
    assert(Helpers.chomp(<<1,2,3,4,5,6>>, 1) == {:ok, <<1>>, <<2,3,4,5,6>>})
  end

  test "chomp 1 byte from 7 bytes" do
    assert(Helpers.chomp(<<1,2,3,4,5,6,7>>, 1) == {:ok, <<1>>, <<2,3,4,5,6,7>>})
  end

  test "chomp 1 byte from 8 bytes" do
    assert(Helpers.chomp(<<1,2,3,4,5,6,7,8>>, 1) == {:ok, <<1>>, <<2,3,4,5,6,7,8>>})
  end

  test "chomp 1 byte from 9 bytes" do
    assert(Helpers.chomp(<<1,2,3,4,5,6,7,8,9>>, 1) == {:ok, <<1>>, <<2,3,4,5,6,7,8,9>>})
  end

  test "chomp 2 byte from 1 bytes" do
    assert {:error, _} = Helpers.chomp(<<1>>, 2)
  end

  test "chomp 3 byte from 1 bytes" do
    assert {:error, _} = Helpers.chomp(<<1>>, 3)
  end

  test "chomp 2 byte from 2 bytes" do
    assert {:ok, <<1,2>>, <<>>} = Helpers.chomp(<<1,2>>, 2)
  end

  test "chomp 2 byte from 3 bytes" do
    assert {:ok, <<1,2>>, <<3>>} = Helpers.chomp(<<1,2,3>>, 2)
  end

  test "chomp 2 byte from 4 bytes" do
    assert {:ok, <<1,2>>, <<3,4>>} = Helpers.chomp(<<1,2,3,4>>, 2)
  end

  test "chomp 2 byte from 5 bytes" do
    assert {:ok, <<1,2>>, <<3,4,5>>} = Helpers.chomp(<<1,2,3,4,5>>, 2)
  end

  test "chomp 2 byte from 6 bytes" do
    assert {:ok, <<1,2>>, <<3,4,5,6>>} = Helpers.chomp(<<1,2,3,4,5,6>>, 2)
  end


end
