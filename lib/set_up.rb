require_relative 'user_interface'
require_relative 'board'
require_relative 'human_player'
require_relative 'game'
require_relative 'intel_computer_player'
require_relative 'computer_player'

class SetUp
	attr_reader :player, :human_player, :ui, :board

	def create_instances
	  @human_player = HumanPlayer.new
	  @ui = UserInterface.new
	end

	def choose_board
	  @ui.prompt_for_board
	  board_choice = @ui.get_board_choice

	  if board_choice.to_i != 0
			@board = Board.new(@ui, board_choice)
	  else 
	  	@ui.print_player_error
	  	self.choose_board
	  end
	  @board
	end

	def choose_player
		@ui.prompt_for_player_type
		player_choice =	@ui.get_player_choice

	  if player_choice == "E"
		  @player = ComputerPlayer.new
	  elsif player_choice == "H"
		  @player = IntelComputerPlayer.new
		else
			@ui.print_player_error
			self.choose_player
	  end
	  @player
	end
end