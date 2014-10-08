require_relative 'computer_player'
require_relative 'intel_computer_player'
require_relative 'human_player'
require_relative 'ttt_constants'

class PlayerFactory

	def create_player(choice)
		case choice
		  when EASY_PLAYER 
		    ComputerPlayer.new(@game_piece)
		  when AI_PLAYER
		    IntelComputerPlayer.new(@game_piece)
		  else
		  	return false
		  end
	end

end
