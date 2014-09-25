class GameStatus

 def winner?(cells)


  end

  def game_over?(board)
    winner?(cells) || board.open_spaces(board.cells).length <= 0 
  end
end

