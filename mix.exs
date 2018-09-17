defmodule ExZstd.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_zstd,
      version: "0.1.0",
      elixir: "~> 1.7",
      make_cwd: "c_src",
      make_env: %{"MOREFLAGS" => "-fPIC -C priv/zstd/lib libzstd.a"},
      start_permanent: Mix.env() == :prod,
      compilers: [:elixir_make] ++ Mix.compilers(),
      deps: deps()
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
      {:elixir_make, "~> 0.4", runtime: false},
      {:benchee, "~> 0.11", only: :dev}
    ]
  end
end
