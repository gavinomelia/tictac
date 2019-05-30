defmodule Board do
  def new_board, do: [[nil, nil, nil],[nil, nil, nil],[nil, nil, nil]]

  def render(board) do
    a = Enum.at(board, 0)
    b = Enum.at(board, 1)
    c = Enum.at(board, 2)

    IO.puts("""
    1  2  3
    ------
    1 |#{get_row(a)}|
    2 |#{get_row(b)}|
    3 |#{get_row(c)}|
    ------
    """)
    board
  end

  def get_row(row) do
    "#{Enum.at(row, 0)}  #{Enum.at(row, 1)}  #{Enum.at(row, 2)}"
  end

  def get_move do
    x = IO.gets("What is the X cordinate of your move? ") |> String.trim |> String.to_integer
    y = IO.gets("What is the Y cordinate of your move? ") |> String.trim |> String.to_integer
    {x,y}
  end

  def make_move(board, {x,y}, player) do
    updated_row = List.replace_at(Enum.at(board, y-1), x-1, player)
    _updated_board = List.replace_at(board, y-1,  updated_row)
  end

end

defmodule Game do
  def begin_game do
    Board.new_board
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
    get_winner(board)
    IO.puts "It is Y's move!"
    get_move(board, "Y")
  end
  def next_move(board, "Y") do
    get_winner(board)
    IO.puts "It is X's move!"
    get_move(board, "X")
  end

  def get_winner(board) do
    # board |> IO.inspect
  end


end

Game.begin_game
