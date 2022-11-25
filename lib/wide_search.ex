defmodule WideSearch do
  defp sell_mango(people) do
    Enum.member?([:anuj, :claire], people)
  end

  def search(name, map) do
    :queue.new()
    |> _add_queue(map[name])
    |> _search([], map)
  end

  defp _add_queue(queue, []), do: queue

  defp _add_queue(queue, [head | tail]) do
    :queue.in(head, queue)
    |> _add_queue(tail)
  end

  defp _search(queue, people_checked, map) do
    if :queue.is_empty(queue) do
      {:not_found, people_checked}
    else
      queue
      |> person_sell_mango(people_checked, map)
    end
  end

  defp person_sell_mango(queue, people_checked, map) do
    with {{:value, head}, queue} = :queue.out(queue) do
      if sell_mango(head) do
        {head, people_checked}
      else
        _add_queue(queue, map[head])
        |> _search(people_checked ++ [head], map)
      end
    end
  end
end

# grafos = %{
# you: [:alice, :bob, :claire],
# bob: [:anuj, :peggy],
# alice: [:peggy],
# claire: [:thom, :jonny],
# anuj: [],
# peggy: [],
# thom: [],
# jonny: []
# }

# WideSearch.search(:you, grafos)
