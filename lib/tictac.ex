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
    x = IO.gets("What is the X cordinate of your move? ") |> String.trim |> String.to_integer
    y = IO.gets("What is the Y cordinate of your move? ") |> String.trim |> String.to_integer
    {x,y}
  end

  def make_move(board, {x,y}, player) do
    Map.put(board, {x,y}, player)
  end
end

defmodule Game do
  def begin_game do
    %{{1,1} => nil, {1,2} => nil, {1,3} => nil, {2,1} => nil, {2,2} => nil, {2,3} => nil, {3,1} => nil, {3,2} => nil, {3,3} => nil}
    |> Board.render
    |> get_move("X")
  end

  def get_move(board, player) do
    {x,y} = Board.get_move
    Board.make_move(board, {x,y}, player)
    |> Board.render
    |> next_move(player)
  end

  def next_move(board, "X") do
    if Enum.all?(get_winner(board), fn(x) -> x == nil end) do
      IO.puts "It is Y's move!"
      get_move(board, "Y")
    end
  end
  def next_move(board, "Y") do
    if Enum.all?(get_winner(board), fn(x) -> x == nil end) do
      IO.puts "It is X's move!"
      get_move(board, "X")
    end
  end

  def get_winner(board) do
    lines = [[{1,1}, {2,1}, {3,1}], [{1,2}, {2,2}, {3,2}], [{1,3}, {2,3}, {3,3}],
    [{1,1}, {1,2}, {1,3}], [{2,1}, {2,2}, {2,3}], [{3,1}, {3,2}, {3,3}],
    [{1,1}, {2,2}, {3,3}], [{1,3}, {2,2}, {3,1}]]

    Enum.map(lines, fn(x) -> Map.take(board, x) |> Map.values |> winners end)
  end

  def winners(["X", "X", "X"]), do: IO.puts("X is victorious! Congradulations!")
  def winners(["Y", "Y", "Y"]), do: IO.puts("Y is victorious! Congradulations!")
  def winners(_), do: nil



end

Game.begin_game
