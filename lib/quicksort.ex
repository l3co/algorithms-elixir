defmodule Quicksort do
  def sort([], result), do: result

  def sort(list) when length(list) < 2, do: list

  def sort([head | tail]) do
    lowests = Enum.filter(tail, fn value -> head > value end)
    biggests = Enum.filter(tail, fn value -> head < value end)

    sort(lowests) ++ [head] ++ sort(biggests)
  end
end
