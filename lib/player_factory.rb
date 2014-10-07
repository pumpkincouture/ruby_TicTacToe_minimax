require_relative 'computer_player'
require_relative 'intel_computer_player'
require_relative 'human_player'

class PlayerFactory

	def create_player(choice)
		case choice
		  when "E" 
		    ComputerPlayer.new
		  when "H"
		    IntelComputerPlayer.new
		  else
		  	return false
		  end
	end

end
