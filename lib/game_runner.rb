require_relative 'game_status'

class GameRunner

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
    p end_game_message(game_status.winner?(board))
    # end_game_message(game_status.winner?(board.cells))
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
    ui.computer_wins if winning_player == "computer"
    ui.human_wins if winning_player == "human" 
    ui.cats_game if winning_player == false
  end
end