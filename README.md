# ExZstd

[zstd](https://github.com/facebook/zstd) library for Elixir, *not published yet*

It uses the Rust zstd binding to make cross system compilation easier (tried to do it native with the Makefile etc but I failed at making it work on windows 10 which is my main OS, the speed difference isn't noticiable)

## API so far

`ExZstd.compress("your_binaries")` compress the binary, default size compression to `3`

`ExZstd.compress("your_binaries", your_custom_compression_size)` compress the binary, setting up your custom compress size

`ExZstd.decompress(your_compressed_data)` decompress the data

# Benchmark

Totally unrealiable, non-scientific benchmark `mix run bench/bench.exs` (*run on windows 10*)

```
Operating System: Linux"
CPU Information: Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz
Number of Available Cores: 4
Available memory: 7.95 GB
Elixir 1.7.3
Erlang 21.1

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
uncompress speed      231.82 K        4.31 μs  ±15.59%           4.70 μs        4.70 μs
compress speed        125.20 K        7.99 μs  ±6.25%            7.80 μs        9.40 μs

Comparison:
uncompress speed      231.82 K
compress speed        125.20 K - 1.85x slower
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

