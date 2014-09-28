require_relative 'game_status'
require_relative 'ttt_constants'

class GameRunner
  include TTTConstants

  attr_reader :board, :player, :human_player, :ui, :game_status
    
  def initialize(board, player, human_player, user_interface)
    @board = board
    @player = player
    @human_player = human_player
    @ui = user_interface
    @game_status = GameStatus.new
  end

  def play!
    first_move
    until game_status.game_over?(board)
      play_game
    end
    end_game_message(board.get_winning_player(board.check_matrix))
  end

  def first_move
    ui.welcome(player)
    board.computer_move(player.comp_move(player.possible_moves(board.cells)))
  end

  def play_game
    human_move = human_player.user_turn(ui)
    if board.invalid_key(human_move)
      ui.user_error
    else
      board.valid_move(human_move)
      board.computer_move(player.comp_move(player.possible_moves(board.cells))) 
    end
  end

  def end_game_message(winning_player)
    ui.computer_wins if winning_player == X_PIECE
    ui.human_wins if winning_player == O_PIECE
    ui.cats_game if winning_player == false
  end
end