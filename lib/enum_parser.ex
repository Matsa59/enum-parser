defmodule EnumParser do
  @moduledoc """
  EnumParser transform your Enum.
  You must consider, transform enums have a significant cost
  """

  @doc ~S"""
  Transform map's keys to atom

  # Example:

      iex> EnumParser.to_atom_key(%{"key" => "value"})
      %{key: "value"}
      
  """
  def to_atom_key(enum) when is_map(enum) do
    Map.new(enum, &to_atom_key/1)
  end

  @doc ~S"""
  Tranform complex map's key to atom

  # Example:

      iex> EnumParser.to_atom_key(%{"key" => %{"key2" => "value"}})
      %{key: %{key2: "value"}}

  """
  def to_atom_key({k, v}) when is_map(v) do
    cond do
      is_bitstring(k) -> {String.to_atom(k), Map.new(v, &to_atom_key/1)}
      is_atom(k) -> {k, Map.new(v, &to_atom_key/1)}
      is_integer(k) -> {String.to_atom("#{k}"), Map.new(v, &to_atom_key/1)}
    end
  end


  @doc ~S"""
  Transform list's keys to atom

  # Example:

      iex> EnumParser.to_atom_key([%{"key" => "value"}, "key2"])
      [%{key: "value"}, :key2]

  """
  def to_atom_key(enum) when is_list(enum) do
    Enum.map(enum, &to_atom_key/1)
  end


  @doc ~S"""
  Transform a tuple {"key", "value"} to {:key, "value"}

  # Example:

      iex> EnumParser.to_atom_key({"key", "value"})
      {:key, "value"}

  """
  def to_atom_key({k, v}) when is_bitstring(k) do
    {String.to_atom(k), v}
  end


  @doc ~S"""
  Transform a tuple {1, "value"} to {:"1", "value"}

  # Example:

      iex> EnumParser.to_atom_key({1, "value"})
      {:"1", "value"}

  """
  def to_atom_key({k, v}) when is_number(k) do
    {:"#{k}", v}
  end


  @doc ~S"""
  Allow a tuple {:key, "value"}

  # Example:

      iex> EnumParser.to_atom_key({:key, "value"})
      {:key, "value"}

  """
  def to_atom_key({k, v}) when is_atom(k) do
    {k, v}
  end


  @doc ~S"""
  Transform the given string to atom

  # Example

      iex> EnumParser.to_atom_key("hello_world")
      :hello_world

  """
  def to_atom_key(k) when is_bitstring(k) do
    String.to_atom(k)
  end


  @doc ~S"""
  Transform enum's key to atom

  # Examples:

      iex> EnumParser.to_atom_key(%{"key" => %{"key2" => "value"}})
      %{key: %{key2: "value"}}

      iex> EnumParser.to_atom_key([%{"key" => "value"}, "key2"])
      [%{key: "value"}, :key2]

  """
  def to_atom_key(k) when is_atom(k) do
    k
  end


  @doc ~S"""
  Transform map's keys to string

  # Example:

      iex> EnumParser.to_string_key(%{key: "value"})
      %{"key" => "value"}

  """
  def to_string_key(enum) when is_map(enum) do
    Map.new(enum, &to_string_key/1)
  end

  @doc ~S"""
  Tranform complex map's key to string

  # Example:

      iex> EnumParser.to_atom_key(%{key: %{key2: "value"}})
      %{"key" => %{"key2" => "value"}}

  """
  def to_string_key({k, v}) when is_map(v) do
    cond do
      is_bitstring(k) -> {k, Map.new(v, &to_string_key/1)}
      is_atom(k) -> {Atom.to_string(k), Map.new(v, &to_string_key/1)}
      is_integer(k) -> {"#{k}", Map.new(v, &to_string_key/1)}
    end
  end


  @doc ~S"""
  Transform list's keys to string

  # Example:

      iex> EnumParser.to_string_key([%{key: "value"}, :key2])
      [%{"key" => "value"}, "key2"]

  """
  def to_string_key(enum) when is_list(enum) do
    Enum.map(enum, &to_string_key/1)
  end


  @doc ~S"""
  Transform a tuple {:key, "value"} to {"key", "value"}

  # Example:

      iex> EnumParser.to_string_key({:key, "value"})
      {"key", "value"}

  """
  def to_string_key({k, v}) when is_atom(k) do
    {Atom.to_string(k), v}
  end


  @doc ~S"""
  Transform a tuple {1, "value"} to {"1", "value"}

  # Example:

      iex> EnumParser.to_string_key({1, "value"})
      {"1", "value"}

  """
  def to_string_key({k, v}) when is_number(k) do
    {Integer.to_string(k), v}
  end


  @doc ~S"""
  Allow a tuple {"key", "value"}

  # Example:

      iex> EnumParser.to_string_key({"key", "value"})
      {"key", "value"}

  """
  def to_string_key({k, v}) when is_bitstring(k) do
    {k, v}
  end


  @doc ~S"""
  Transform the given atom to string

  # Example

      iex> EnumParser.to_string_key("hello_world")
      :hello_world

  """
  def to_string_key(k) when is_atom(k) do
    Atom.to_string(k)
  end


  @doc ~S"""
  Transform enum's key to string

  # Examples:

      iex> EnumParser.to_atom_key(%{key: %{key2: "value"}})
      %{"key" => %{"key2" => "value"}}

      iex> EnumParser.to_string_key([%{key: "value"}, :key2])
      [%{"key" => "value"}, "key2"]

  """
  def to_string_key(k) when is_bitstring(k) do
    k
  end
end
