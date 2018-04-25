defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.to_char_list
    |> Enum.map(fn c ->
      # IO.puts c
      increment(c, shift)
    end)
    |> List.to_string
  end

  defp increment(char, shift) when ?a <= char and char <= ?z do
    char = char + shift

    if char > ?z do
      char - (?z - ?a + 1)
    else
      char
    end
  end

  defp increment(char, shift) when ?A <= char and char <= ?Z do
    char = char + shift

    if char > ?Z do
      char - (?Z - ?A + 1)
    else
      char
    end
  end

  defp increment(char, _shift) do
    char
  end
end

