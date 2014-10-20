require_relative 'ttt_constants'

class ComputerPlayer
  include TTTConstants

  attr_reader :game_piece

  def initialize(game_piece)
    @game_piece = game_piece
  end
  
  def comp_move(board)
    board.open_spaces.sample
  end
end