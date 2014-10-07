require_relative 'ttt_constants'

class Board
  include TTTConstants

  attr_accessor :cells

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

  def board_full?
    open_spaces.length <= 0
  end

  def open_spaces
    spaces = []
    cells.each_with_index do |sub_array, idx|
    spaces << idx if sub_array != X_PIECE && sub_array != O_PIECE
    end
    spaces
  end

  def get_board_size
    Math.sqrt(cells.length)
  end

  def matrix_string?(matrix)
    return true if matrix.is_a? String
    false
  end

  def get_winning_player(matrix)
    return matrix if matrix.is_a? String
    false
  end

  def check_matrix
    if check_columns.is_a? String  
      return check_columns
    elsif check_right_diagonal.is_a? String
      return check_right_diagonal
    elsif check_left_diagonal.is_a? String
      return check_left_diagonal
    elsif check_rows.is_a? String
      return check_rows
    else
      return false
    end 
  end

  def display_diagonals
    [get_left_diagonal, get_right_diagonal]
  end

  def display_row
    get_board_row
  end

  def display_column
    get_board_column(get_board_row)
  end

  private

  def check_left_diagonal
    if get_left_diagonal.count(O_PIECE) == get_board_size 
      return O_PIECE
    elsif get_left_diagonal.count(X_PIECE) == get_board_size
       return X_PIECE
    else
      return false
    end
  end

  def check_right_diagonal
    if get_right_diagonal.count(O_PIECE) == get_board_size 
      return O_PIECE
    elsif get_right_diagonal.count(X_PIECE) == get_board_size 
       return X_PIECE    
    else
      return false
    end
  end

  def check_rows
    get_board_row.each do |array|
      if array.count(O_PIECE) == get_board_size
        return O_PIECE
      elsif array.count(X_PIECE) == get_board_size
        return X_PIECE
      else
        return false
      end
    end
  end

  def check_columns
    get_board_column(get_board_row).each do |array| 
      if array.count(O_PIECE) == get_board_size
        return O_PIECE
      elsif array.count(X_PIECE) == get_board_size
        return X_PIECE
      else
        return false
      end
    end
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
