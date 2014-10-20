require_relative 'computer_player'
require_relative 'intel_computer_player'
require_relative 'ttt_constants'

class PlayerFactory
	include TTTConstants

	def get_game_piece
		game_pieces = GAME_PIECES.values
		@game_piece = game_pieces[rand(game_pieces.length)]
	end

	def create_player(choice)
		case choice
		  when EASY_PLAYER 
		    ComputerPlayer.new(get_game_piece)
		  when AI_PLAYER
		    IntelComputerPlayer.new(get_game_piece)
		  end
	end
end

