defmodule Bob do
  def hey(input) do
    cond do
      String.ends_with?(input, "?") ->
        "Sure."

      String.match?(input, ~r/^\s*$/) ->
        "Fine. Be that way!"

      input == String.upcase(input) and input != String.downcase(input) ->
        "Whoa, chill out!"

      true ->
        "Whatever."
    end
  end
end
