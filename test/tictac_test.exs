defmodule TictacTest do
  use ExUnit.Case
  doctest Tictac

  test "greets the world" do
    assert Tictac.new_board() == [[nil, nil, nil],[nil, nil, nil],[nil, nil, nil]]
    # [
    #   ['X', None, 'O'],
    #   ['O', None, None],
    #   [None, 'X', 'X']
    # ]
  end
end
