defmodule ExZstd do
  @moduledoc false
  @on_load :init
  @app Mix.Project.config()[:app]

  def init do
    path = :filename.join(:code.priv_dir(@app), 'zstd_nif')
    :ok = :erlang.load_nif(path, 0)
  end

  def nif_error, do: :erlang.nif_error(:nif_library_not_loaded)

  def compress(binary) do
    compress(binary, 3)
  end

  def compress(_binary, _size), do: nif_error()

  def decompress(_binary), do: nif_error()
end
