defmodule FlattenMap.MixProject do
  use Mix.Project

  @source_url "https://github.com/NullOranje/flatten_map"

  def project do
    [
      app: :flatten_map,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: []
    ]
  end

  defp docs do
    [
      main: "FlattenMap",
      name: "flatten_map",
      source_url: @source_url,
      extras: ["README.md"]
    ]
  end

  defp package() do
    [
      description: "Elixir module to flatten arbitrarily deep nested maps",
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => @source_url}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.22.1", only: :dev, runtime: false}
    ]
  end
end
