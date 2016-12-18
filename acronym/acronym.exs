defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> (fn str -> Regex.scan(~r/( [a-z]|[A-Z])/, str) end).()
    |> Enum.map(fn [h | _] -> String.trim(h) end)
    |> Enum.join("")
    |> String.upcase
  end
end
