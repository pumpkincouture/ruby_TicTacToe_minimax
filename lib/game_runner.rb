require_relative 'ttt_constants'

class GameRunner
  include TTTConstants

  attr_reader :board, :player, :human_player, :ui, :game_piece
    
  def initialize(board, player, human_player, user_interface)
    @board = board
    @player = player
    @human_player = human_player
    @ui = user_interface
  end

  def play!
    first_move
    until board.game_over?(human_player.game_piece, player.game_piece)
      play_game
    end
    end_game_message(board.get_winning_player(board.check_matrix(human_player.game_piece, player.game_piece)))
  end

  def first_move
    ui.welcome(player)
    ui.computer_thinking
    board.computer_move(player.comp_move(board), player.game_piece)
  end

  def play_game
    ui.user_prompt(human_player.game_piece)
    human_move = ui.get_user_answer
      if board.invalid_key(human_move)
        ui.user_error
      else
        board.valid_move(human_move, human_player.game_piece)
        return true if board.winner?(human_player.game_piece, player.game_piece)
        ui.computer_thinking
        board.computer_move(player.comp_move(board), player.game_piece)
      end
  end

  def end_game_message(winning_player)
    ui.human_wins if winning_player != X_PIECE
    ui.computer_wins if winning_player == X_PIECE
    ui.cats_game if winning_player == false
  end
end