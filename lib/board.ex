defmodule Board do
  def render(board) do
    IO.puts("""
    1  2  3
    ------
    1 |#{board[{1,1}]} #{board[{2,1}]} #{board[{3,1}]}|
    2 |#{board[{1,2}]} #{board[{2,2}]} #{board[{3,2}]}|
    3 |#{board[{1,3}]} #{board[{2,3}]} #{board[{3,3}]}|
    ------
    """)
    board
  end

  def get_move do
    {get_x, get_y}
  end

  def get_x, do: IO.gets("What is the X cordinate of your move? ") |> String.trim |> Integer.parse |> check(:x)
  def get_y, do: IO.gets("What is the Y cordinate of your move? ") |> String.trim |> Integer.parse |> check(:y)

  def check({int, _}, _) do
    IO.inspect(int, label: "NO issues!")
  end
  def check(tuple, letter) do
    IO.puts "That is not a valid move. Try again."
    if letter == :x do
      get_x
    else
      get_y
    end
  end

  def make_move(board, {x,y}, player) do
    Map.put(board, {x,y}, player)
  end
end
