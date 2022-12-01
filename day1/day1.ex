defmodule Day1 do
  defp sum_calories(group) do
    individual_calories_as_strings = String.split(group, "\n")
    individual_calories = Enum.map(individual_calories_as_strings, fn c -> ({num, ""} = Integer.parse(c); num) end)
    Enum.sum(individual_calories)
  end

  def get_answer1 do
    {:ok, input} = File.read("input.txt")
    calorie_groups = String.split(input, "\n\n")
    Enum.map(calorie_groups, &sum_calories/1)
    |> Enum.max
  end

  def get_answer2 do
    {:ok, input} = File.read("input.txt")
    calorie_groups = String.split(input, "\n\n")
    Enum.map(calorie_groups, &sum_calories/1)
    |> Enum.sort(&(&1 >= &2))
    |> Enum.take(3)
    |> Enum.sum
  end
end