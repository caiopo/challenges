defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance('', '') do
    {:ok, 0}
  end

  def hamming_distance('', _) do
    {:error, "Lists must be the same length"}
  end

  def hamming_distance(_, '') do
    {:error, "Lists must be the same length"}
  end

  def hamming_distance([head1 | tail1], [head2 | tail2]) do
    {status, info} = hamming_distance(tail1, tail2)

    condt = status == :ok and head1 != head2

    {status, (if condt, do: info + 1, else: info)}
  end
end
