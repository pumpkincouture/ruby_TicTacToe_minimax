require_relative 'user_interface'
require_relative 'board'
require_relative 'human_player'
require_relative 'player_factory'
require_relative 'game_piece_factory'

class SetUp

	attr_reader :player, :human_player, :ui, :board, :game_piece

	def create_instances
	  @ui = UserInterface.new
	  @player_factory = PlayerFactory.new
	  @piece_factory = GamePieceFactory.new
	end

	def set_up_game
	  choose_board(get_board_choice)
	  choose_player(get_player_choice)
	  get_game_piece(prompt_for_game_piece)
	  create_human_player
	end

	def get_board_choice
		@ui.prompt_for_board
	  board_choice = @ui.get_board_choice
	end

	def choose_board(board_choice)
	  if board_choice.to_i != 0
			@board = Board.new(@ui, board_choice)
	  else 
			@ui.print_player_error
	  	self.choose_board(get_board_choice)
	  end
	end

	def prompt_for_game_piece
		@ui.prompt_for_piece
		@ui.display_game_pieces
		@ui.get_game_piece
	end

	def get_game_piece(game_piece_choice)
		@game_piece = @piece_factory.create_game_piece(game_piece_choice)
		until @game_piece
		  @ui.print_player_error
			self.get_game_piece(prompt_for_game_piece)
		end
	end

	def create_human_player
		@human_player = HumanPlayer.new(@game_piece)
	end

	def get_player_choice
		@ui.prompt_for_player_type
		player_choice =	@ui.get_player_choice
	end

	def choose_player(player_choice)
		@player = @player_factory.create_player(player_choice)
		until @player
			@ui.print_player_error
			self.choose_player(get_player_choice)
		end
	end
end