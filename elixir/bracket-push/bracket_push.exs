defmodule BracketPush do

  @brackets ~w/{ } ( ) [ ]/
  @matching %{"{" => "}", "(" => ")", "[" => "]"}

  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    str
    |> String.split("")
    |> Enum.reduce([], fn char, stack ->
      cond do
        not char in @brackets -> stack

        @matching[char] != nil -> [char] ++ stack

        length(stack) != 0 and char == @matching[hd stack] -> tl stack

        true -> [false] ++ stack
      end
    end) == []
  end
end
