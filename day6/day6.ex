defmodule Day6 do
  def get_answer1 do
    {:ok, input} = File.read("input.txt")
    [_|letters] = String.split(input, "")
    get_location(letters, 4)
  end

  defp get_location(letters, current_count) do
    [a,b,c,d|rest] = letters

    if length([a,b,c,d]) == length(Enum.uniq([a,b,c,d])) do
      current_count
    else
      get_location([b,c,d|rest], current_count + 1)
    end
  end

  def get_answer2 do
    {:ok, input} = File.read("input.txt")
    [_|letters] = String.split(input, "")
    get_location2(letters, 14)
  end

  defp get_location2(letters, current_count) do
    current_set = Enum.take(letters, 14)

    if length(current_set) == length(Enum.uniq(current_set)) do
      current_count
    else
      [_|rest] = letters
      get_location2(rest, current_count + 1)
    end
  end
end