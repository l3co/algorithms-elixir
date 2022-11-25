defmodule BinarySearch do
  def guess(number, range = first..last) do
    guess = div(first + last, 2)
    IO.puts("\n =======================")
    IO.puts("The guess is : #{guess}")
    _guess(number, guess, range)
  end

  defp _guess(number, number, _), do: IO.puts("The number had you think is #{number}")

  defp _guess(number, guess, _first..last) when number > guess do
    guess(number, (guess + 1)..last)
  end

  defp _guess(number, guess, first.._last) when number < guess do
    guess(number, first..(guess - 1))
  end
end
