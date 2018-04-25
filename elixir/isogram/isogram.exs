defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t) :: boolean
  def isogram?(sentence) do
    sentence = String.replace(sentence, ~r/[- ]/, "")

    unique =
      sentence
      |> String.codepoints
      |> Enum.uniq
      |> Enum.join("")

      sentence == unique
  end
end
