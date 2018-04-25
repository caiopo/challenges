defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(_s, size) when size <= 0 do
    []
  end

  def slices(s, size) do
    if String.length(s) < size do
      []
    else
      Enum.reduce 0..(String.length(s) - size), [], fn i, l ->
        l ++ [String.slice(s, i, size)]
      end
    end
  end
end

