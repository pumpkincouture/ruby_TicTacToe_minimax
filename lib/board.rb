require_relative 'ttt_constants'

class Board
  include TTTConstants

  attr_reader :cells

  def initialize(user_interface, board_choice)
    @ui = user_interface
    @board_choice = board_choice
    @cells = Array.new(board_choice * board_choice, [])
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

  def draw?(open_spaces)
    open_spaces.length <= 0
  end

  def open_spaces
    spaces = []
    cells.each_with_index do |sub_array, idx|
    spaces << idx if sub_array != X_PIECE && sub_array != O_PIECE
    end
    spaces
  end

  def check_matrix
    if get_left_diagonal.count(O_PIECE || X_PIECE) == get_board_size
      return true
    elsif get_right_diagonal.count(O_PIECE || X_PIECE) == get_board_size
      return true
    elsif get_board_row.count(O_PIECE || X_PIECE) == get_board_size
      return true
    elsif get_board_column(get_board_row).count(O_PIECE || X_PIECE) == get_board_size
      return true
    else
      return false
    end
  end

  def get_board_size
    Math.sqrt(cells.length)
  end

  def get_left_diagonal
    (0..get_board_size - 1).collect {|array| get_board_row[array][array]}
  end

  def get_right_diagonal
    row = -1
    diagonals = []
    (0..get_board_size - 1).each do |array|
      diagonals << get_board_row[array][row]
      row -= 1
    end
    diagonals
  end

  def get_board_row
    get_row = cells.each_slice(get_board_size).to_a
  end

  def get_board_column(rows)
    rows.transpose
  end
end