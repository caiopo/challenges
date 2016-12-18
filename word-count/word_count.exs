defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
      sentence
      |> String.replace(~r/[\x00-\x2c\x2e-\x2f\x3a-\x40\x5b-\x60\x7b-\x7F]+/, " ")
      |> String.downcase
      |> String.split
      |> Enum.reduce(
          Map.new(),
          fn w, words ->
            Map.update(words, w, 1, &(&1 + 1))
          end)
  end
end
