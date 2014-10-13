require_relative 'user_interface'
require_relative 'board'
require_relative 'human_player'
require_relative 'intel_computer_player'
require_relative 'computer_player'
require_relative 'player_factory'

class SetUp
	attr_reader :player, :human_player, :ui, :board, :game_piece

	def create_instances
	  @ui = UserInterface.new
	  @player_factory = PlayerFactory.new
	  @human_player = HumanPlayer.new(@game_piece)
	end

	def get_board_choice
		@ui.prompt_for_board
	  board_choice = @ui.get_board_choice
	end

	def get_game_piece
		@ui.prompt_for_piece
		@ui.display_game_pieces
		game_piece = @ui.get_game_piece
	end

	def choose_board(board_choice)
	  if board_choice.to_i != 0
			@board = Board.new(@ui, board_choice)
	  else 
	  	print_error
	  	self.choose_board(get_board_choice)
	  end
	  @board
	end

	def get_player_choice
		@ui.prompt_for_player_type
		player_choice =	@ui.get_player_choice
	end

	def print_error
		@ui.print_player_error
	end

	def choose_player(player_choice)
		@player = @player_factory.create_player(player_choice)
		until @player
			print_error
			self.choose_player(get_player_choice)
		end
		@player
	end
end