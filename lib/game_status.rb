class GameStatus

 def winner?(board)
	  board.check_matrix
  end

  def draw?(board)
  	board.board_full?
  end

  def winning_player(board)
  	
  end

  def game_over?(board)
   winner?(board) || draw?(board)
  end
end

