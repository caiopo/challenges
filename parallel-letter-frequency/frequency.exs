defmodule Frequency do
  @doc """
  Count letter frequency in parallel.

  Returns a map of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t], pos_integer) :: map
  def frequency(texts, workers) do
      chars =
        texts
        |> Enum.join
        |> String.replace(~r/[\x00-\x2c\x2e-\x40\x5b-\x60\x7b-\x7F]+/, "")
        |> String.downcase
        |> String.codepoints

      Enum.map(0..workers-1, fn n ->
        Task.async(fn -> work(chars, n, workers) end)
      end)
      |> Enum.reduce(%{}, fn task, map ->
        Map.merge(map, Task.await(task), fn _, v1, v2 ->
          v1 + v2
        end)
      end)
  end

  defp work(chars, number, total) do
    chars
    |> take_every(number, total)
    |> Enum.reduce(%{}, fn char, acc ->
      Map.update(acc, char, 1, &(&1 + 1))
    end)
  end

  defp take_every(chars, number, total) do
    chars
    |> Stream.with_index
    |> Stream.filter(fn {_, i} ->
      rem(i, total) == number
    end)
    |> Stream.map(fn {e, _} ->
      e
    end)
  end
end
