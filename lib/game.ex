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
      IO.puts "It is Y's move!\n"
      get_move(board, "Y")
    end
  end
  def next_move(board, "Y") do
    if Enum.all?(get_winner(board), fn(x) -> x == nil end) do
      IO.puts "It is X's move!\n"
      get_move(board, "X")
    end
  end


  def get_winner(board) do
    winnable_lines = [[{1,1}, {2,1}, {3,1}], [{1,2}, {2,2}, {3,2}], [{1,3}, {2,3}, {3,3}],
    [{1,1}, {1,2}, {1,3}], [{2,1}, {2,2}, {2,3}], [{3,1}, {3,2}, {3,3}],
    [{1,1}, {2,2}, {3,3}], [{1,3}, {2,2}, {3,1}]]

    winner_list = Enum.map(winnable_lines, fn(x) -> Map.take(board, x) |> Map.values |> winners end)

    if Enum.all?(Map.values(board), &(&1)) do
      IO.puts("The game is a draw!")
    end
    winner_list
  end

  def winners(["X", "X", "X"]), do: IO.puts("X is victorious! Congradulations!")
  def winners(["Y", "Y", "Y"]), do: IO.puts("Y is victorious! Congradulations!")
  def winners(_), do: nil

end
