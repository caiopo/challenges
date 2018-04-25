defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string) do
    digits =
      string
      |> String.codepoints
      |> Enum.map(fn n ->
        case Integer.parse(n) do
          {n, _} ->
            n
          :error ->
            :error
        end
      end)

    if Enum.any?(digits, &(&1 != 0 and &1 != 1)) do
      0
    else
      digits
      |> Enum.reverse
      |> Stream.with_index
      |> Enum.to_list
      |> Enum.reduce(0, fn {digit, exp}, acc ->
        acc + digit * :math.pow(2, exp)
      end)
      |> round
    end
  end
end
