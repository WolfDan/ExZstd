compressed =
  ExZstd.compress(
    "The eccentric, self-proclaimed mad scientist Rintarou Okabe has become a shell of his former self. Depressed and traumatized after failing to rescue his friend Makise Kurisu, he has decided to forsake his mad scientist alter ego and live as an ordinary college student. Surrounded by friends who know little of his time travel experiences, Okabe spends his days trying to forgetthe horrors of his adventures alone."
  )

Benchee.run(%{
  "uncompress speed" => fn ->
    ExZstd.decompress(compressed)
  end,
  "compress speed" => fn ->
    ExZstd.compress(
      "The eccentric, self-proclaimed mad scientist Rintarou Okabe has become a shell of his former self. Depressed and traumatized after failing to rescue his friend Makise Kurisu, he has decided to forsake his mad scientist alter ego and live as an ordinary college student. Surrounded by friends who know little of his time travel experiences, Okabe spends his days trying to forgetthe horrors of his adventures alone."
    )
  end
})
