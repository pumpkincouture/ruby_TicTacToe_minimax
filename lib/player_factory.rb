require_relative 'computer_player'
require_relative 'ttt_constants'

class PlayerFactory
	include TTTConstants

	def get_game_piece
	  COMP_PIECES.sample
	end

	def create_player
		ComputerPlayer.new(get_game_piece)
	end
end

