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
    answer.to_i == 0 || cells[answer.to_i - 1] != []
  end

  def valid_move(answer, game_piece)
    cells[answer.to_i - 1] = game_piece
    @ui.human_choice(answer)
    @ui.display_board(display_row)
  end

  def computer_move(answer, game_piece)
    cells[answer] = game_piece
    @ui.computer_choice(answer)
    @ui.display_board(display_row)
  end

  def game_over?(game_piece)
   winner?(game_piece) || draw?
  end

  def winner?(game_piece)
    matrix_string?(check_matrix(game_piece))
  end

  def draw?
    board_full?
  end

  def board_full?
    open_spaces.length <= 0
  end

  def open_spaces
    spaces = []
    cells.each_with_index do |sub_array, idx|
    spaces << idx if sub_array.empty?
    end
    spaces
  end

  def clear_board(potential_board, move)
     potential_board.cells[move] = []
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

  def check_matrix(game_piece)
    if check_columns(game_piece).is_a? String  
      return check_columns(game_piece)
    elsif check_right_diagonal(game_piece).is_a? String
      return check_right_diagonal(game_piece)
    elsif check_left_diagonal(game_piece).is_a? String
      return check_left_diagonal(game_piece)
    elsif check_rows(game_piece).is_a? String
      return check_rows(game_piece)
    else
      return false
    end 
  end

  def display_row
    get_board_row
  end

  private

  def check_left_diagonal(game_piece)
    if get_left_diagonal.count(game_piece) == get_board_size 
      return game_piece
    elsif get_left_diagonal.count(X_PIECE) == get_board_size
       return X_PIECE
    else
      return false
    end
  end

  def check_right_diagonal(game_piece)
    if get_right_diagonal.count(game_piece) == get_board_size 
      return game_piece
    elsif get_right_diagonal.count(X_PIECE) == get_board_size 
       return X_PIECE    
    else
      return false
    end
  end

  def check_rows(game_piece)
    get_board_row.each do |array|
      if array.count(game_piece) == get_board_size
        return game_piece
      elsif array.count(X_PIECE) == get_board_size
        return X_PIECE
      end
    end
    false
  end

  def check_columns(game_piece)
    get_board_column(get_board_row).each do |array| 
      if array.count(game_piece) == get_board_size
        return game_piece
      elsif array.count(X_PIECE) == get_board_size
        return X_PIECE
      end
    end
    false
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
