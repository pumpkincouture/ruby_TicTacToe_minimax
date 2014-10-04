require_relative 'computer_player'
require_relative 'intel_computer_player'
require_relative 'human_player'

class PlayerFactory

	def create_player(choice)
		case choice
		  when choice == "E"
		    ComputerPlayer.new
		  when choice == "H"
		    IntelComputerPlayer.new
		  else
		  	return false
		  end
	end

end