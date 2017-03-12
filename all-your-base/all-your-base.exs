defmodule AllYourBase do
  @doc """
  Given a number in base a, represented as a sequence of digits, converts it to base b,
  or returns nil if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: list
  def convert(digits, base_a, base_b)
    when base_a < 2 or base_b < 2 or digits == [] do
    nil
  end

  def convert(digits, base_a, base_b) do
    if Enum.any?(digits, &(&1 < 0 or &1 >= base_a)) do
      nil
    else
      to_10(digits, base_a) |> from_10(base_b, [])
    end
  end

  def to_10(digits, base) do
    Enum.reverse(digits)
    |> Stream.with_index
    |> Enum.reduce(0, fn {digit, exp}, acc ->
      acc + digit * :math.pow(base, exp)
    end)
    |> round
  end

  def from_10(value, base, list) do
    # IO.inspect {value, base, list}
    if value < base do
      [value | list]
    else
      from_10(div(value, base), base, [rem(value, base) | list])
    end
  end
end

# IO.inspect AllYourBase.to_10([1, 0, 1, 0, 1, 0], 2) |> AllYourBase.from_10(2, [])
