class GameStatus

 def winner?(cells)
	  

  end

  def game_over?(board)
    winner?(board.cells) || board.draw?(board.open_spaces(board.cells))
  end
end

