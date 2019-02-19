defmodule ExZstd.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_zstd,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      compilers: [:rustler] ++ Mix.compilers(),
      rustler_crates: rustler_crates(),
      deps: deps()
    ]
  end

  defp rustler_crates do
    [
      exzstd: [
        path: "native/exzstd",
        mode: :release
      ]
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
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
      {:benchee, "~> 0.11", only: :dev},
      {:rustler, "~> 0.19.0"}
    ]
  end
end
