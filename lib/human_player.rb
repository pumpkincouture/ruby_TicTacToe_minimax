require_relative 'ttt_constants'

class HumanPlayer
  include TTTConstants

  attr_reader :game_piece

  def initialize(game_piece)
  	@game_piece = O_PIECE
  end

	def user_turn(ui)
	  ui.user_prompt
	  human_answer = gets.chomp
	end
end
