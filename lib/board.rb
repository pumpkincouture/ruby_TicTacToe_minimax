require_relative 'game'
require_relative 'user_interface'
require_relative 'ttt_constants'

class Board
  include TTTConstants

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
    cells[answer] = O_PIECE
    @ui.human_choice(answer)
    @ui.display_board(cells)
  end

  def board_size

  def computer_move(answer)
    cells[answer] = X_PIECE
    @ui.computer_choice(answer)
    @ui.display_board(cells)
  end
end