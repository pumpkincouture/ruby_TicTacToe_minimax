require_relative 'computer_player'
require_relative 'intel_computer_player'
require_relative 'human_player'

class PlayerFactory

	def create_player(choice)
		case choice
		  when "E" 
		    ComputerPlayer.new(@game_piece)
		  when "H"
		    IntelComputerPlayer.new(@game_piece)
		  else
		  	return false
		  end
	end

end
