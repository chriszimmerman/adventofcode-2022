defmodule Day4 do
  defp is_complete_overlap(pair) do
    [section_set1, section_set2] = String.split(pair, ",")
    [set1_lower, set1_upper] = String.split(section_set1, "-")
    [set2_lower, set2_upper] = String.split(section_set2, "-")
    {set1_lower, ""} = Integer.parse(set1_lower)
    {set1_upper, ""} = Integer.parse(set1_upper)
    {set2_lower, ""} = Integer.parse(set2_lower)
    {set2_upper, ""} = Integer.parse(set2_upper)
    set1 = MapSet.new(set1_lower..set1_upper)
    set2 = MapSet.new(set2_lower..set2_upper)

    MapSet.union(set1, set2) == set1 || MapSet.union(set1, set2) == set2
  end

  defp has_any_overlap(pair) do
    [section_set1, section_set2] = String.split(pair, ",")
    [set1_lower, set1_upper] = String.split(section_set1, "-")
    [set2_lower, set2_upper] = String.split(section_set2, "-")
    {set1_lower, ""} = Integer.parse(set1_lower)
    {set1_upper, ""} = Integer.parse(set1_upper)
    {set2_lower, ""} = Integer.parse(set2_lower)
    {set2_upper, ""} = Integer.parse(set2_upper)
    set1 = MapSet.new(set1_lower..set1_upper)
    set2 = MapSet.new(set2_lower..set2_upper)

    MapSet.size(MapSet.intersection(set1, set2)) > 0
  end


  def get_answer1 do
    {:ok, input} = File.read("input.txt")
    pairs = String.split(input, "\n")
    Enum.count(pairs, &is_complete_overlap/1)
  end

  def get_answer2 do
    {:ok, input} = File.read("input.txt")
    pairs = String.split(input, "\n")
    Enum.count(pairs, &has_any_overlap/1)
  end
end