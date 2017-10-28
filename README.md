# EnumParser

EnumParser transform your Enum into news Enum.

## Installation

Add `enum_parser` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    # ... other packages
    {:enum_parser, "~> 0.1.0"}
  ]
end
```

# Usage

Transform Enum's key to atom :

```elixir
my_map = %{"foo" => "bar", "baz" => %{"foo" => "bar"}}
EnumParser.to_atom_key(my_map)
# => %{foo: "bar", baz: => %{foo: "bar"}}
```

Or transform Enum's key to string :

```elixir
my_map = %{foo: "bar", baz: => %{foo: "bar"}}
EnumParser.to_atom_key(my_map)
# => %{"foo" => "bar", "baz" => %{"foo" => "bar"}}
```

# License

EnumParser source code is released under MIT License.

Check [LICENSE](LICENSE) file for more information.
