defmodule SelectionOrder do
  def sort(type, list, result \\ [])

  def sort(_type, [], result), do: result

  def sort(:asc = type, list, result) do
    min = lowest(list)
    list = list -- [min]
    result = result ++ [min]
    sort(type, list, result)
  end

  def sort(:desc = type, list, result) do
    max = biggest(list)
    list = list -- [max]
    result = result ++ [max]
    sort(type, list, result)
  end

  defp lowest([head | tail]), do: _lowest(head, tail)

  defp _lowest(min, []), do: min

  defp _lowest(min, [head | tail]) when min < head do
    _lowest(min, tail)
  end

  defp _lowest(min, [head | tail]) when min > head do
    _lowest(head, tail)
  end

  defp biggest([head | tail]), do: _biggest(head, tail)

  defp _biggest(max, []), do: max

  defp _biggest(max, [head | tail]) when max < head do
    _biggest(head, tail)
  end

  defp _biggest(max, [head | tail]) when max > head do
    _biggest(max, tail)
  end
end
