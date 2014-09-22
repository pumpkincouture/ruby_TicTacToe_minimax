require_relative 'user_interface.rb'
require_relative 'board.rb'
require_relative 'human_player.rb'
require_relative 'game.rb'
require_relative 'intel_computer_player.rb'
require_relative 'computer_player.rb'

class SetUp
	attr_reader :player, :human_player, :ui, :board

	def create_instances
	  @human_player = HumanPlayer.new
	  @ui = UserInterface.new
	  @board = Board.new(@ui)
	end

	def choose_board

	end

	def choose_player
		@ui.prompt_for_player_type
		player_choice =	@ui.get_player_choice

	  if player_choice == "E"
		  @player = ComputerPlayer.new
	  elsif player_choice == "H"
		  @player = IntelComputerPlayer.new
		else
			self.choose_player
	  end
	  @player
	end
end