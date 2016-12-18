defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    test = fn n, w ->
      if rem(number, n) == 0 do
        w
      else
        ""
      end
    end

    str = test.(3, "Pling") <> test.(5, "Plang") <> test.(7, "Plong")

    if str == "" do
      Integer.to_string(number)
    else
      str
    end
  end
end
