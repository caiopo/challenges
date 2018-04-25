defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t
  def verse(number) do
    case number do
      1 -> """
      No more bottles of beer on the wall, no more bottles of beer.
      Go to the store and buy some more, 99 bottles of beer on the wall.
      """

      2 -> """
      1 bottle of beer on the wall, 1 bottle of beer.
      Take it down and pass it around, no more bottles of beer on the wall.
      """

      3 -> """
      2 bottles of beer on the wall, 2 bottles of beer.
      Take one down and pass it around, 1 bottle of beer on the wall.
      """

      _ -> """
      #{number-1} bottles of beer on the wall, #{number-1} bottles of beer.
      Take one down and pass it around, #{number-2} bottles of beer on the wall.
      """
    end
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t) :: String.t
  def lyrics(range) do
    Enum.reduce(range, "", fn i, acc ->
      acc <> verse(i) <> "\n"
    end)
    |> String.trim_trailing("\n")
    |> Kernel.<>("\n")

  end

  def lyrics() do
    lyrics(100..1)
  end
end
