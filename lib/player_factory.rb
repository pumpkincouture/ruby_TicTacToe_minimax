require_relative 'computer_player'
require_relative 'intel_computer_player'
require_relative 'human_player'
require_relative 'ttt_constants'

class PlayerFactory
	include TTTConstants
	
	def create_human_player
		@human_player = HumanPlayer.new(@game_piece)
	end

	def create_player(choice)
		case choice
		  when EASY_PLAYER 
		    ComputerPlayer.new(@game_piece)
		  when AI_PLAYER
		    IntelComputerPlayer.new(@game_piece)
		  end
	end
end
