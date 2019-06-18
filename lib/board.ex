defmodule Board do
  def render(board) do
    IO.puts("""
    \n1  2  3
    ------
    1 |#{board[{1,1}]} #{board[{2,1}]} #{board[{3,1}]}|
    2 |#{board[{1,2}]} #{board[{2,2}]} #{board[{3,2}]}|
    3 |#{board[{1,3}]} #{board[{2,3}]} #{board[{3,3}]}|
    ------
    """)
    board
  end

  def get_move do
    {get_x(), get_y()}
  end

  def get_x(), do: IO.gets("What is the X cordinate of your move? ") |> String.trim |> Integer.parse |> check(:x)
  def get_y(), do: IO.gets("What is the Y cordinate of your move? ") |> String.trim |> Integer.parse |> check(:y)

  def check({int, _}, letter), do: off_the_board?(int, letter)
  def check(_, letter) do
    invalid(letter)
  end

  def off_the_board?(int, _) when int in [1, 2, 3], do: int
  def off_the_board?(_, letter), do: invalid(letter)

  def invalid(:x) do
    IO.puts "That is not a valid move. Try again."
    get_x()
  end
  def invalid(:y) do
    IO.puts "That is not a valid move. Try again."
    get_y()
  end

  def make_move(board, {x,y}, player) do
    Map.put(board, {x,y}, player)
  end
end
