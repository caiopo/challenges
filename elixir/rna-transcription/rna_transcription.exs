defmodule RNATranscription do
  @equiv %{'G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U'}

  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map(dna, fn char -> hd @equiv[[char]] end)
  end
end
