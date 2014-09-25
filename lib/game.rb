require_relative 'board'
require_relative 'computer_player'
require_relative 'human_player'
require_relative 'user_interface'
require_relative 'ttt_constants'
require_relative 'set_up'


class Game
  include TTTConstants

  attr_reader :board, :player, :human_player, :ui
    
  def initialize(board, player, human_player, user_interface)
    @board = board
    @player = player
    @human_player = human_player
    @ui = user_interface
  end

  def winner?(cells)
    

  end

  def end_game_message(winning_player)
    ui.computer_wins if winning_player == "computer"
    ui.human_wins if winning_player == "human" 
    ui.cats_game if winning_player == false
  end

  def game_over?(cells)
    winner?(cells) || board.open_spaces(cells).length <= 0 
  end

  def first_move
    ui.welcome(player)
    board.computer_move(player.comp_move(player.possible_moves(board.cells)))
  end

  def play_game
    human_player.user_turn(ui)
    if board.invalid_key(human_player.answer)
      ui.user_error
    else
      board.valid_move(human_player.answer)
      board.computer_move(player.comp_move(player.possible_moves(board.cells))) 
    end
  end

  def play!
    first_move
    until game_over?(board.cells)
      play_game
    end
    end_game_message(winner?(board.cells))
  end
end