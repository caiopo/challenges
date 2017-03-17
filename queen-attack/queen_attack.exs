defmodule Queens do
  @type t :: %Queens{ black: {integer, integer}, white: {integer, integer} }
  defstruct black: {7, 3}, white: {0, 3}

  @doc """
  Creates a new set of Queens
  """
  @spec new() :: Queens.t()
  def new() do
    %Queens{}
  end

  @spec new({integer, integer}, {integer, integer}) :: Queens.t()
  def new(queen, queen) do
    raise ArgumentError
  end

  def new(white, black) do
    %Queens{white: white, black: black}
  end

  @doc """
  Gives a string reprentation of the board with
  white and black queen locations shown
  """
  @spec to_string(Queens.t()) :: String.t()
  def to_string(%Queens{white: w, black: b}) do
    Enum.reduce(0..7, "", fn nline, acc ->
      acc <> line(nline, w, b) <> if nline != 7, do: "\n", else: ""
    end)
  end

  defp line(nline, w, b) do
    Enum.reduce(0..7, "", fn ncollumn, acc ->
      acc <> char(nline, ncollumn, w, b) <> if ncollumn != 7, do: " ", else: ""
    end)
  end

  defp char(line, collumn, {wline, wcol}, {bline, bcol}) do
    cond do
      line == wline and collumn == wcol ->
        "W"

      line == bline and collumn == bcol ->
        "B"

      true ->
        "_"
    end
  end

  @doc """
  Checks if the queens can attack each other
  """
  @spec can_attack?(Queens.t()) :: boolean
  def can_attack?(%Queens{white: w, black: b}) do
    (diff(w) == diff(b)) or row(w) == row(b) or col(w) == col(b)
  end

  defp row({x, _y}), do: x

  defp col({_x, y}), do: y

  defp diff({x, y}), do: abs(x - y)
end
