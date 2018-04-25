defmodule ProteinTranslation do
  @codons %{
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UGG" => "Tryptophan",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP",
  }

  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: { atom,  list(String.t()) }
  def of_rna(rna) do
    if String.length(rna) |> rem(3) == 0 do

      try do
        codons =
          rna
          |> String.codepoints
          |> Stream.chunk(3)
          |> Enum.map(fn elem ->
            List.to_string(elem)
          end)
          |> _rna

        {:ok, codons}
      catch
        :error ->
          {:error, "invalid RNA"}
      end

    else
      {:error, "invalid RNA"}
    end
  end

  defp _rna([]) do
    []
  end

  defp _rna([h_codon | t_codons]) do
    case of_codon(h_codon) do
      {:ok, "STOP"} ->
        []

      {:ok, codon} ->
        [codon | _rna(t_codons)]

      {:error, _} ->
        throw :error
    end
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: { atom, String.t() }
  def of_codon(codon) do
    protein = @codons[codon]

    if protein do
      {:ok, protein}
    else
      {:error, "invalid codon"}
    end
  end
end
