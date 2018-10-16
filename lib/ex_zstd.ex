defmodule ExZstd do
  @moduledoc false
  use Rustler, otp_app: :ex_zstd, crate: :exzstd

  def compress(binary), do: compress(binary, 3)

  def compress(_binary, _size), do: error()

  def decompress(_binary), do: error()

  defp error, do: :erlang.nif_error(:nif_not_loaded)
end
