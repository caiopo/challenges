defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    Regex.scan(~r/(.)\1*/, string)
    |> Enum.map(fn [chars, letter] ->
        Integer.to_string(String.length(chars)) <> letter
      end)
    |> Enum.join("")
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    Regex.scan(~r/(\d+)([a-zA-Z])/, string)
    |> Enum.map(fn [_, number, letter] ->
        {n, _} = Integer.parse(number)
        String.duplicate(letter, n)
      end)
    |> Enum.join("")
  end
end
