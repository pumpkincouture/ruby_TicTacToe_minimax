require_relative 'game'
require_relative 'user_interface'
require_relative 'ttt_constants'

class Board
  include TTTConstants

  attr_reader :cells

  def initialize(user_interface, board_choice)
    @ui = user_interface
    @board_choice = board_choice
    @cells = Array.new(board_choice * board_choice, [])
    # @computer_score = Array.new(board_choice * board_choice, X_PIECE)
    # @human_score = Array.new(board_choice * board_choice, O_PIECE)
  end

  def invalid_key(answer)
    answer.to_i == 0 || cells[answer.to_i - 1] == X_PIECE || cells[answer.to_i - 1] == O_PIECE
  end

  def valid_move(answer)
    cells[answer.to_i - 1] = O_PIECE
    @ui.human_choice(answer)
    @ui.display_board(cells)
  end

  def computer_move(answer)
    cells[answer] = X_PIECE
    @ui.computer_choice(answer)
    @ui.display_board(cells)
  end

  def board_size(cells)
   board_size = cells[1..Math.sqrt(cells.length)] * Math.sqrt(cells.length)
  end
end