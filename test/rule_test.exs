defmodule RuleTest do
  use ExUnit.Case

  test "detects winner in a row" do
    cells = [
      :x, :x, :x, :x,
      " ", " ", " ", " ",
      " ", " ", " ", " ",
      " ", " ", " ", " "
    ]
    board = %Board{cells: cells, previous_steal: %{}}
    assert Rule.check_winner(board) == {:winner, :x}
  end

  test "detects winner in a column" do
    cells = [
      :o, " ", " ", " ",
      :o, " ", " ", " ",
      :o, " ", " ", " ",
      :o, " ", " ", " "
    ]
    board = %Board{cells: cells, previous_steal: %{}}
    assert Rule.check_winner(board) == {:winner, :o}
  end

  test "detects winner in a diagonal" do
    cells = [
      :+, " ", " ", " ",
      " ", :+, " ", " ",
      " ", " ", :+, " ",
      " ", " ", " ", :+
    ]
    board = %Board{cells: cells, previous_steal: %{}}
    assert Rule.check_winner(board) == {:winner, :+}
  end

  test "detects draw" do
    cells = [
      :x, :o, :x, :o,
      :o, :+, :o, :x,
      :x, :o, :+, :o,
      :+, :x, :o, :+
    ]
    board = %Board{cells: cells, previous_steal: %{}}
    assert Rule.check_winner(board) == :draw
  end

  test "detects no winner" do
    board = Board.new()
    assert Rule.check_winner(board) == :no_winner
  end
end
