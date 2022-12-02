defmodule Day2 do
  defp get_round_outcome(opponent_choice, player_choice) do
    cond do
      opponent_choice == "A" && player_choice == "X" -> 3
      opponent_choice == "A" && player_choice == "Y" -> 6
      opponent_choice == "A" && player_choice == "Z" -> 0
      opponent_choice == "B" && player_choice == "X" -> 0
      opponent_choice == "B" && player_choice == "Y" -> 3
      opponent_choice == "B" && player_choice == "Z" -> 6
      opponent_choice == "C" && player_choice == "X" -> 6
      opponent_choice == "C" && player_choice == "Y" -> 0
      opponent_choice == "C" && player_choice == "Z" -> 3
    end
  end

  defp get_score_for_round(round) do
    player_scores = %{
      "X" => 1,
      "Y" => 2,
      "Z" => 3
    }

    [opponent_choice, player_choice] = String.split(round, " ")

    get_round_outcome(opponent_choice, player_choice) + player_scores[player_choice]
  end

  def get_answer1 do
    {:ok, input} = File.read("input.txt")
    rounds = String.split(input, "\n")
    Enum.map(rounds, &get_score_for_round/1)
    |> Enum.sum
  end

  defp calculate_player_choice_with_score(opponent_choice, result) do
    opponent_rock = "A"
    opponent_paper = "B"
    opponent_scissors = "C"

    lose = "X"
    draw = "Y"
    win = "Z"

    player_rock = "X"
    player_paper = "Y"
    player_scissors = "Z"

    lose_score = 0
    draw_score = 3
    win_score = 6

    cond do
      opponent_choice == opponent_rock && result == lose -> {player_scissors, lose_score}
      opponent_choice == opponent_rock && result == draw -> {player_rock, draw_score}
      opponent_choice == opponent_rock && result == win -> {player_paper, win_score}
      opponent_choice == opponent_paper && result == lose -> {player_rock, lose_score}
      opponent_choice == opponent_paper && result == draw -> {player_paper, draw_score}
      opponent_choice == opponent_paper && result == win -> {player_scissors, win_score}
      opponent_choice == opponent_scissors && result == lose -> {player_paper, lose_score}
      opponent_choice == opponent_scissors && result == draw -> {player_scissors, draw_score}
      opponent_choice == opponent_scissors && result == win -> {player_rock, win_score}
      true -> {:error, "something bad happened"}
    end
  end

  defp get_round_outcome(round) do
    player_scores = %{
      "X" => 1,
      "Y" => 2,
      "Z" => 3
    }

    [opponent_choice, round_outcome] = String.split(round, " ")
    {player_choice, outcome_score} = calculate_player_choice_with_score(opponent_choice, round_outcome)
    player_scores[player_choice] + outcome_score
  end

  def get_answer2 do
    {:ok, input} = File.read("input.txt")
    rounds = String.split(input, "\n")
    Enum.map(rounds, &get_round_outcome/1)
    |> Enum.sum
  end
end