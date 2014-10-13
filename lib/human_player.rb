require_relative 'ttt_constants'

class HumanPlayer
  include TTTConstants

  attr_reader :game_piece

  def initialize(game_piece)
  	@game_piece = game_piece
  end
end
