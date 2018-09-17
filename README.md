# ExZstd

[zstd](https://github.com/facebook/zstd) library for Elixir, *not published yet*, same code as https://hex.pm/packages/zstd but "updated" to 1.3.5 and wrote in elixir

## API so far

`ExZstd.compress("your_binaries")` compress the binary, default size compression to `3`

`ExZstd.compress("your_binaries", your_custom_compression_size)` compress the binary, setting up your custom compress size

`ExZstd.decompress(your_compressed_data)` decompress the data

# Benchmark

Totally unrealiable, non-scientific benchmark `mix run bench/bench.exs` (*run on windows WSL mode*)

```
Operating System: Linux"
CPU Information: Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz
Number of Available Cores: 4
Available memory: 7.95 GB
Elixir 1.7.2
Erlang 21.0.5

Benchmark suite executing with the following configuration:
warmup: 2 s
time: 5 s
memory time: 0 μs
parallel: 1
inputs: none specified
Estimated total run time: 14 s


Benchmarking compress speed...
Benchmarking uncompress speed...

Name                       ips        average  deviation         median         99th %
compress speed        171.17 K        5.84 μs   ±346.07%           5 μs           9 μs
uncompress speed       41.27 K       24.23 μs   ±108.62%          23 μs          44 μs

Comparison:
compress speed        171.17 K
uncompress speed       41.27 K - 4.15x slower
```


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ex_zstd` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_zstd, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/ex_zstd](https://hexdocs.pm/ex_zstd).

