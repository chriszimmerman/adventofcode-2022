defmodule Day3 do
  defp get_item_priorities(rucksack) do
    {first_item, second_item} = String.split_at(rucksack, div(String.length(rucksack), 2))
    first_item_set = MapSet.new(String.to_charlist(first_item))
    second_item_set = MapSet.new(String.to_charlist(second_item))
    common_item = List.to_string(MapSet.to_list(MapSet.intersection(first_item_set, second_item_set)))

    letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    [characters|_] = String.split(letters, common_item)
    String.length(characters) + 1
  end

  def get_answer1 do
    {:ok, input} = File.read("input.txt")
    rucksacks = String.split(input, "\n")
    Enum.map(rucksacks, &get_item_priorities/1)
    |> Enum.sum
  end

  defp find_common_items_internal(sum, items) do
    [first, second, third | rest] = items

    first_set = MapSet.new(String.to_charlist(first))
    second_set = MapSet.new(String.to_charlist(second))
    third_set = MapSet.new(String.to_charlist(third))
    common_item = List.to_string(MapSet.to_list(MapSet.intersection(MapSet.intersection(first_set, second_set), third_set)))
    letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    [characters|_] = String.split(letters, common_item)
    value = String.length(characters) + 1

    if rest == [] do
      sum + value
    else
      find_common_items_internal(sum + value, rest)
    end
  end

  defp find_common_items(items) do
    find_common_items_internal(0, items)
  end

  def get_answer2 do
    {:ok, input} = File.read("input.txt")
    rucksacks = String.split(input, "\n")
    find_common_items(rucksacks)
  end
end