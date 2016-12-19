defmodule Prime do
  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(count) when count > 0 do
    Stream.iterate(0, &(&1+1))
    |> Stream.filter(&is_prime/1)
    |> Enum.take(count)
    |> List.last
  end

  defp is_prime(2) do
    true
  end

  defp is_prime(n) do
    not Enum.any?(2..n-1, &(rem(n, &1) == 0))
  end
end
