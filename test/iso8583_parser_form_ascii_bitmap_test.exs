defmodule Iso8583ParserFormAsciiBmpTest do
  use ExUnit.Case
  doctest Iso8583Parser

  test "form bin bitmap <= 65, 234" do

    alias Iso8583Pasrser.Helpers

    data = %{
      2 => "123",
      3 => "456",
      4 => "789"
    }

    formed_bmp = Helpers.form_bmp(data, :ascii)

    bmp = Base.encode16(<<112, 0, 0, 0, 0, 0, 0, 0>>)

    assert(formed_bmp == bmp)
  end

  test "form bin bitmap <= 65, 15,16,34" do

    alias Iso8583Pasrser.Helpers

    data = %{
      15 => "123",
      16 => "456",
      34 => "789"
    }

    formed_bmp = Helpers.form_bmp(data, :ascii)

    bmp = Base.encode16(<<0, 3, 0, 0, 64, 0, 0, 0>>)

    assert(formed_bmp == bmp)
  end

  test "form bin bitmap <= 65, 5,10,64" do

    alias Iso8583Pasrser.Helpers

    data = %{
      5 => "123",
      10 => "456",
      64 => "789"
    }

    formed_bmp = Helpers.form_bmp(data, :ascii)

    bmp = Base.encode16(<<8, 64, 0, 0, 0, 0, 0, 1>>)

    assert(formed_bmp == bmp)
  end

  test "form bin bitmap > 65, 65,89,100" do

    alias Iso8583Pasrser.Helpers

    data = %{
      65 => "123",
      89 => "456",
      100 => "789"
    }

    formed_bmp = Helpers.form_bmp(data, :ascii)

    bmp = Base.encode16(<<128, 0, 0, 0, 0, 0, 0, 0,   128, 0, 0, 128, 16, 0, 0, 0>>)

    assert(formed_bmp == bmp)
  end

  test "form bin bitmap > 65, 100,110,128" do

    alias Iso8583Pasrser.Helpers

    data = %{
      100 => "123",
      110 => "456",
      128 => "789"
    }

    formed_bmp = Helpers.form_bmp(data, :ascii)

    bmp = Base.encode16(<<128, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 16, 4, 0, 1>>)

    assert(formed_bmp == bmp)
  end

  test "form bin bitmap bit 1" do

    alias Iso8583Pasrser.Helpers

    data = %{
      1 => "123",
    }

    formed_bmp = Helpers.form_bmp(data, :ascii)

    bmp = Base.encode16(<<0, 0, 0, 0, 0, 0, 0, 0>>)

    assert(formed_bmp == bmp)
  end

  test "form bin bitmap bit 8" do

    alias Iso8583Pasrser.Helpers

    data = %{
      8 => "123",
    }

    formed_bmp = Helpers.form_bmp(data, :ascii)

    bmp = Base.encode16(<<1, 0, 0, 0, 0, 0, 0, 0>>)

    assert(formed_bmp == bmp)
  end


end
