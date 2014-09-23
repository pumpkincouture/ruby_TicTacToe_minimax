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

  def computer_spaces(cells)
    computer_spaces = []

    cells.each_with_index do |sub_array, idx|
      computer_spaces << idx if sub_array == X_PIECE
    end
    computer_spaces
  end

  def human_spaces(cells)
    human_spaces = []

    cells.each_with_index do |sub_array, idx|
      human_spaces << idx if sub_array == O_PIECE
    end
    human_spaces
  end

  def winner?(computer_spaces, human_spaces)
    #needs refactoring- relies on a fixed set of winning combinations

    computer_spaces.map!(&:to_i)
    human_spaces.map!(&:to_i) 

    WINNING_COMBOS.each do |sub_array|
      if sub_array.all? {|x|computer_spaces.include?(x)}
        return "computer"
      elsif sub_array.all? {|y|human_spaces.include?(y)}
        return "human"
      end
    end
    return false
  end

  def end_game_message(winning_player)
    ui.computer_wins if winning_player == "computer"
    ui.human_wins if winning_player == "human" 
    ui.cats_game if winning_player == false
  end

  def open_spaces(cells)
    spaces = []
    cells.each_with_index do |sub_array, idx|
    spaces << idx if sub_array != X_PIECE && sub_array != O_PIECE
    end
    spaces
  end

  def game_over?(cells)
    winner?(computer_spaces(cells), human_spaces(cells)) || open_spaces(cells).length <= 0 
  end

  def first_move
    ui.welcome(player)
    board.computer_move(player.comp_move(player.possible_moves(board.cells)))
  end

  def play_game
    @human_player.user_turn(@ui)
    if @board.invalid_key(@human_player.answer)
      @ui.user_error
    else
      @board.valid_move(@human_player.answer)
      @board.computer_move(@player.comp_move(@player.possible_moves(@board.cells))) 
    end
  end

  def play!
    first_move
    until game_over?(board.cells)
      play_game
    end
    end_game_message(winner?(computer_spaces(@board.cells), human_spaces(@board.cells)))
  end
end