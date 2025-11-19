defmodule Rule do
  @winning_combinations [
    # Rows
    [0, 1, 2, 3],
    [4, 5, 6, 7],
    [8, 9, 10, 11],
    [12, 13, 14, 15],
    # Columns
    [0, 4, 8, 12],
    [1, 5, 9, 13],
    [2, 6, 10, 14],
    [3, 7, 11, 15],
    # Diagonals
    [0, 5, 10, 15],
    [3, 6, 9, 12]
  ]

  def check_winner(%Board{cells: cells}) do
    cond do
      winner?(cells, :x) -> {:winner, :x}
      winner?(cells, :o) -> {:winner, :o}
      winner?(cells, :+) -> {:winner, :+}
      board_full?(cells) -> :draw
      true -> :no_winner
    end
  end

  defp winner?(cells, player) do
    Enum.any?(@winning_combinations, fn indices ->
      Enum.all?(indices, fn index ->
        Enum.at(cells, index) == player
      end)
    end)
  end

  defp board_full?(cells) do
    Enum.all?(cells, fn cell -> cell != " " end)
  end
end
