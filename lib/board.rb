require_relative 'game.rb'
require_relative 'user_interface.rb'

class Board
  attr_reader :error, :cells

  def initialize(user_interface, board_choice)
    @ui = user_interface
    @board_choice = board_choice
    @cells = Array.new(board_choice * board_choice, [])
  end

  def invalid_key(answer)
    cells[answer] !~ /\d+/
  end

  def valid_move(answer)
    cells[answer] = "O"
    @ui.human_choice(answer)
    @ui.display_board(cells)
  end

  def computer_move(answer)
    cells[answer] = "X"
    @ui.computer_choice(answer)
    @ui.display_board(cells)
  end
end