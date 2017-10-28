defmodule EnumParserTest do
  use ExUnit.Case
  doctest EnumParser

  # to atom
  test "to_atom_key: Test simple map" do
    assert EnumParser.to_atom_key(%{"key" => "value"}) == %{key: "value"}
  end

  test "to_atom_key: Test complex map" do
    assert EnumParser.to_atom_key(%{"key" => "value", "key2" => %{"key3" => "value", key4: "value"}}) == %{key: "value", key2: %{key3: "value", key4: "value"}}
  end

  test "to_atom_key: Test list" do
    assert EnumParser.to_atom_key([%{"key" => "value"}, "key2", :key3]) == [%{key: "value"}, :key2, :key3]
  end

  test "to_atom_key: Test tuple" do
    assert EnumParser.to_atom_key({"key", "value"}) == {:key, "value"}
  end

  # to string
  test "to_string_key: Test simple map" do
    assert EnumParser.to_string_key(%{key: "value"}) == %{"key" => "value"}
  end

  test "to_string_key: Test complex map" do
    assert EnumParser.to_string_key(%{key: "value", key2: %{key3: "value", "key4": "value"}}) == %{"key" =>"value", "key2" => %{"key3" => "value", "key4" => "value"}}
  end

  test "to_string_key: Test list" do
    assert EnumParser.to_string_key([%{key: "value"}, :key2, "key3"]) == [%{"key" => "value"}, "key2", "key3"]
  end

  test "to_string_key: Test tuple" do
    assert EnumParser.to_string_key({:key, "value"}) == {"key", "value"}
  end
end
