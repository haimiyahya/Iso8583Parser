defmodule Iso8583ParserTruncateTest do
  use ExUnit.Case, async: true
  doctest Iso8583Parser
  alias Iso8583Pasrser.Helpers

  test "truncate binary 0 length" do
    assert(Helpers.truncate_data(:x, 10, <<>>) == <<>>)
  end

  test "truncate binary which length less than max length (15)" do
    assert(Helpers.truncate_data(:x, 15, <<10,2,7>>) == <<10,2>>)
  end

  test "truncate binary which length less than max length" do
    assert(Helpers.truncate_data(:x, 32, <<10,2,7>>) == <<10,2,7>>)
  end

  test "truncate binary which equal length to max length" do
    assert(Helpers.truncate_data(:x, 32, <<10,2,7,9>>) == <<10,2,7,9>>)
  end

  test "truncate binary which longer than max length" do
    assert(Helpers.truncate_data(:x, 32, <<10,2,7,9,10,11>>) == <<10,2,7,9>>)
  end


  test "truncate string 0 length" do
    assert(Helpers.truncate_data(:a, 10, "") == "")
  end

  test "truncate string which length less than max length" do
    assert(Helpers.truncate_data(:a, 4, "abc") == "abc")
  end

  test "truncate string which equal length to max length" do
    assert(Helpers.truncate_data(:a, 4, "abcd") == "abcd")
  end

  test "truncate string which longer than max length" do
    assert(Helpers.truncate_data(:a, 4, "abcdef") == "abcd")
  end

end
