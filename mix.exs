defmodule EnumParser.Mixfile do
  use Mix.Project

  def project do
    [
      app: :enum_parser,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "EnumParser",
      source_url: "https://github.com/Matsa59/enum-parser"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.14", only: :dev}
    ]
  end

  defp description() do
    "EnumParser transform enum's keys"
  end

  defp package() do
    [
      # This option is only needed when you don't want to use the OTP application name
      name: "enum_parser",
      # These are the default files included in the package
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Alexandre Lepretre"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/Matsa59/enum-parser"}
    ]
  end
end
