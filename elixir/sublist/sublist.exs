defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare([], []) do
    :equal
  end

  def compare([], _) do
    :sublist
  end

  def compare(_, []) do
    :superlist
  end

  def compare(a, b) do
    ab = contains?(a, b)
    ba = contains?(b, a)

    cond do
      ab and ba -> :equal

      ab -> :sublist

      ba -> :superlist

      true -> :unequal
    end

  end

  defp contains?(a, []) do
    _contains?(a, [])
  end

  defp contains?(a, b) do
    _contains?(a, b) or contains?(a, tl b)
  end

  defp _contains?([], _) do
    true
  end

  defp _contains?(_, []) do
    false
  end

  defp _contains?([heada | taila], [headb | tailb]) do
    heada === headb and _contains?(taila, tailb)
  end
end
