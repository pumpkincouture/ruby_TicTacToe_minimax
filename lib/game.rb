require_relative 'board.rb'
require_relative 'computer_player.rb'
require_relative 'human_player.rb'
require_relative 'user_interface.rb'
require_relative 'ttt_constants.rb'
require_relative 'set_up.rb'


class Game
  include TTTConstants

  attr_reader :player, :human_player, :ui, :board
    
  def initialize(player, human_player, user_interface, board)
    @player = player
    @human_player = human_player
    @ui = user_interface
    @board = board
  end

  def computer_spaces(cells)
    computer_spaces = []

    cells.each do |space, value|
      computer_spaces << space if cells[space] == X_PIECE
    end
    computer_spaces
  end

  def human_spaces(cells)
    human_spaces = []

    cells.each do |space, value|
      human_spaces << space if cells[space] == O_PIECE
    end
    human_spaces
  end

  def winner?(computer_spaces, human_spaces)

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
    @ui.computer_wins if winning_player == "computer"
    @ui.human_wins if winning_player == "human" 
    @ui.cats_game if winning_player == false
  end

  def open_spaces(cells)
    spaces = []
    cells.each do |space, value|
    spaces << space if cells[space] != X_PIECE && cells[space] != O_PIECE
    end
    spaces
  end

  def game_over?(cells)
    winner?(computer_spaces(cells), human_spaces(cells)) || open_spaces(cells).length <= 0 
  end

  def first_move
    @ui.welcome(@player)
    @board.computer_move(@player.comp_move(@player.possible_moves(@board.cells)))
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
    until game_over?(@board.cells)
      play_game
    end
    end_game_message(winner?(computer_spaces(@board.cells), human_spaces(@board.cells)))
  end

end