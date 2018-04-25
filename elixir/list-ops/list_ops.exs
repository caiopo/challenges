defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count([]) do
    0
  end

  def count([_head | tail]) do
    count(tail) + 1
  end


  @spec reverse(list) :: list
  def reverse(l) do
    reverse(l, [])
  end

  defp reverse([], l) do
    l
  end

  defp reverse([h | t], l) do
    reverse(t, [h | l])
  end


  @spec map(list, (any -> any)) :: list
  def map([], _f) do
    []
  end

  def map([head | tail], f) do
    [f.(head) | map(tail, f)]
  end


  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([head | tail] , f) do
    if f.(head) do
      [head | filter(tail, f)]
    else
      filter(tail, f)
    end
  end

  def filter([], _f) do
    []
  end


  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, _f) do
    acc
  end

  def reduce([h | t], acc, f) do
    reduce(t, f.(h, acc), f)
  end


  @spec append(list, list) :: list
  def append([], b) do
    b
  end

  def append([ha | ta], b) do
    [ha | append(ta, b)]
  end


  @spec concat([[any]]) :: [any]
  def concat(l) do
    reverse(concat(l, []))
  end

  defp concat([], l) do
    l
  end

  defp concat([[] | t], l) do
    concat(t, l)
  end

  defp concat([[h2 | t2] | t1], result) do
    concat([t2 | t1], [h2 | result])
  end
end
