defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @alphabet "abcdefghijklmnopqrstuvwxyz"

  @spec pangram?(String.t) :: boolean
  def pangram?(sentence) do
    sentence =
    sentence
    |> String.downcase
    |> String.replace(~r/[_0-9]/, "")
    |> String.split("")

    @alphabet
    |> String.split("")
    |> Enum.reduce(true, fn char, acc ->
      acc and char in sentence
    end)
  end
end
