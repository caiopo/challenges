defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    sorted_base =
      base |> String.downcase |> String.split("") |> Enum.sort |> Enum.join("")

    Enum.filter(candidates, fn word ->
      sorted_word =
        word |> String.downcase |> String.split("") |> Enum.sort |> Enum.join("")

      sorted_word == sorted_base and String.downcase(word) != String.downcase(base)
    end)

  end
end
