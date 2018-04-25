defmodule LinkedList do
  @opaque t :: tuple()

  @doc """
  Construct a new LinkedList
  """
  @spec new() :: t
  def new() do
    {}
  end

  @doc """
  Push an item onto a LinkedList
  """
  @spec push(t, any()) :: t
  def push(llist, item) do
    {item, llist}
  end

  @doc """
  Calculate the length of a LinkedList
  """
  @spec length(t) :: non_neg_integer()
  def length({}) do
    0
  end

  # def length({_}) do
  #   1
  # end

  def length({_h, t}) do
    1 + LinkedList.length t
  end

  @doc """
  Determine if a LinkedList is empty
  """
  @spec empty?(t) :: boolean()
  def empty?({}) do
    true
  end

  def empty?(_) do
    false
  end

  @doc """
  Get the value of a head of the LinkedList
  """
  @spec peek(t) :: {:ok, any()} | {:error, :empty_list}
  def peek({}) do
    {:error, :empty_list}
  end

  def peek({h, _t}) do
    {:ok, h}
  end

  @doc """
  Get tail of a LinkedList
  """
  @spec tail(t) :: {:ok, t} | {:error, :empty_list}
  def tail({}) do
    {:error, :empty_list}
  end

  def tail({_h, t}) do
    {:ok, t}
  end

  @doc """
  Remove the head from a LinkedList
  """
  @spec pop(t) :: {:ok, any(), t} | {:error, :empty_list}
  def pop({}) do
    {:error, :empty_list}
  end

  def pop({h, t}) do
    {:ok, h, t}
  end

  @doc """
  Construct a LinkedList from a stdlib List
  """
  @spec from_list(list()) :: t
  def from_list(list) do
    reverse _from_list(list, {})
  end

  defp _from_list([], llist) do
    llist
  end

  defp _from_list([h | t], llist) do
    _from_list(t, {h, llist})
  end

  @doc """
  Construct a stdlib List LinkedList from a LinkedList
  """
  @spec to_list(t) :: list()
  def to_list(list) do
    Enum.reverse _to_list(list, [])
  end

  defp _to_list({}, list) do
    list
  end

  defp _to_list({h, t}, list) do
    _to_list(t, [h | list])
  end

  @doc """
  Reverse a LinkedList
  """
  @spec reverse(t) :: t
  def reverse(llist) do
    _reverse(llist, {})
  end

  defp _reverse({}, llist2) do
    llist2
  end

  defp _reverse({h1, t2}, llist2) do
    _reverse(t2, {h1, llist2})
  end
end
