defmodule Day5 do

  defp execute_instruction(stacks, move_amount, from, to) do
    if move_amount == 0 do
      stacks
    else
      [item_to_move | rest_of_stack] = Enum.at(stacks, from - 1)
      destination_stack = Enum.at(stacks, to - 1)
      stacks = List.replace_at(stacks, to - 1, [item_to_move] ++ destination_stack)
      stacks = List.replace_at(stacks, from - 1, rest_of_stack)
      execute_instruction(stacks, move_amount - 1, from, to)
    end
  end

  defp execute_instruction2(stacks, take_amount, from, to) do
    {items_to_move, rest_of_stack} = Enum.split(Enum.at(stacks, from - 1), take_amount)
    destination_stack = Enum.at(stacks, to - 1)
    stacks = List.replace_at(stacks, to - 1, items_to_move ++ destination_stack)
    stacks = List.replace_at(stacks, from - 1, rest_of_stack)
    stacks
  end

  defp move(stacks, instructions) do
    if length(instructions) == 0 do
      stacks
    else
      [instruction | rest_instructions] = instructions
      split_instruction = String.split(instruction, " ")
      IO.inspect split_instruction
      {move_amount, ""} = Integer.parse(Enum.at(split_instruction, 1))
      {from, ""} = Integer.parse(Enum.at(split_instruction, 3))
      {to, ""} = Integer.parse(Enum.at(split_instruction, 5))
      stacks = execute_instruction(stacks, move_amount, from, to)
      move(stacks, rest_instructions)
    end
  end

    defp move2(stacks, instructions) do
      if length(instructions) == 0 do
        stacks
      else
        [instruction | rest_instructions] = instructions
        split_instruction = String.split(instruction, " ")
        IO.inspect split_instruction
        {move_amount, ""} = Integer.parse(Enum.at(split_instruction, 1))
        {from, ""} = Integer.parse(Enum.at(split_instruction, 3))
        {to, ""} = Integer.parse(Enum.at(split_instruction, 5))
        stacks = execute_instruction2(stacks, move_amount, from, to)
        move2(stacks, rest_instructions)
    end
  end

  def get_answer1 do
    stack1 = ["W", "R", "T", "G"]
    stack2 = ["W", "V", "S", "M", "P", "H", "C", "G"]
    stack3 = ["M", "G", "S", "T", "L", "C"]
    stack4 = ["F", "R", "W", "M", "D", "H", "J"]
    stack5 = ["J", "F", "W", "S", "H", "L", "Q", "P"]
    stack6 = ["S", "M", "F", "N", "D", "J", "P"]
    stack7 = ["J", "S", "C", "G", "F", "D", "B", "Z"]
    stack8 = ["B", "T", "R"]
    stack9 = ["C", "L", "W", "N", "H"]
    stacks = [stack1, stack2, stack3, stack4, stack5, stack6, stack7, stack8, stack9]
    {:ok, input} = File.read("input.txt")
    instructions = String.split(input, "\n")
    move(stacks, instructions)
  end

  def get_answer2 do
    stack1 = ["W", "R", "T", "G"]
    stack2 = ["W", "V", "S", "M", "P", "H", "C", "G"]
    stack3 = ["M", "G", "S", "T", "L", "C"]
    stack4 = ["F", "R", "W", "M", "D", "H", "J"]
    stack5 = ["J", "F", "W", "S", "H", "L", "Q", "P"]
    stack6 = ["S", "M", "F", "N", "D", "J", "P"]
    stack7 = ["J", "S", "C", "G", "F", "D", "B", "Z"]
    stack8 = ["B", "T", "R"]
    stack9 = ["C", "L", "W", "N", "H"]
    stacks = [stack1, stack2, stack3, stack4, stack5, stack6, stack7, stack8, stack9]
    {:ok, input} = File.read("input.txt")
    instructions = String.split(input, "\n")
    move2(stacks, instructions)
  end
end