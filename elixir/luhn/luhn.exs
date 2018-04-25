defmodule Luhn do
  @doc """
  Calculates the total checksum of a number
  """
  @spec checksum(String.t()) :: integer
  def checksum(number) do
    number
    |> String.codepoints
    |> Enum.reverse
    |> Stream.with_index
    |> Enum.map(fn {n, i} ->
      {num, _} = Integer.parse(n)

      if rem(i, 2) != 0 do
        val = num * 2

        if val > 9, do: val - 9, else: val
      else
        num
      end
    end)
    |> Enum.sum
  end

  @doc """
  Checks if the given number is valid via the luhn formula
  """
  @spec valid?(String.t()) :: boolean
  def valid?(number) do
    rem(checksum(number), 10) == 0
  end

  @doc """
  Creates a valid number by adding the correct
  checksum digit to the end of the number
  """
  @spec create(String.t()) :: String.t()
  def create(number) do
    checksum = rem(checksum(number <> "0"), 10)

    check_digit = if checksum == 0, do: 0, else: 10 - checksum

    number <> Integer.to_string(check_digit)
  end
end
