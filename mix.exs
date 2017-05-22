defmodule PubNux.Mixfile do
  use Mix.Project

  def project do
    [
      app: :pubnux,
      version: "0.1.0",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "PubNux",
      elixirc_paths: elixirc_paths(Mix.env()),
      preferred_cli_env: preferred_cli_env(),
      source_url: "https://github.com/MrCoffey/pubnux"
    ]
  end

  def application do
    [extra_applications: [:logger, :httpoison]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  defp deps do
    [
      {:poison, "~> 2.2"},
      {:httpoison, "~> 0.9.0"},
      {:exvcr, "~> 0.8", only: :test}
    ]
  end

  defp description do
    """
    A wrapper for PubNub's API
    """
  end

  defp package do
    [
      name: :pubnux,
      maintainers: ["Jorge Madrid"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/MrCoffey/pubnux"}
    ]
  end

  def preferred_cli_env do
    [
      vcr: :test, "vcr.delete": :test, "vcr.check": :test, "vcr.show": :test
    ]
  end
end