class GameStatus

 def winner?(board)
	  board.check_matrix
  end

  def game_over?(board)
    p winner?(board)
    # board.draw?(board.open_spaces)
  end
end

