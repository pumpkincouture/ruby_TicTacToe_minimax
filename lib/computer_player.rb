require_relative 'ttt_constants'

class ComputerPlayer
  include TTTConstants

  attr_reader :game_piece

  def initialize(game_piece)
    @game_piece = X_PIECE
  end
  
  def comp_move(board)
    move = board.open_spaces[rand] 
  end
end