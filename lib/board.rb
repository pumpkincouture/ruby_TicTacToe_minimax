class Board
  attr_accessor :cells

  def initialize(user_interface, board_choice)
    @ui = user_interface
    @board_choice = board_choice
    @cells = Array.new(board_choice * board_choice, [])
  end

  def invalid_key(answer)
    answer.to_i == 0 || !cells[convert_move(answer)].empty?
  end

  def convert_move(answer)
    answer.to_i - 1
  end

  def place_move(answer, game_piece)
    cells[answer] = game_piece
  end

  def valid_move(answer, game_piece)
    place_move(convert_move(answer), game_piece)
    @ui.human_choice(answer)
    @ui.display_board(display_row)
  end

  def computer_move(answer, game_piece)
    place_move(answer, game_piece)
    @ui.computer_choice(answer)
    @ui.display_board(display_row)
  end

  def game_over?(human_piece, computer_piece)
    winner?(human_piece, computer_piece) || draw?
  end

  def winner?(human_piece, computer_piece)
    matrix_string?(check_matrix(human_piece, computer_piece))
  end

  def get_opponent_piece(game_piece)
    occupied_spaces.select {|piece| piece != game_piece}[0]
  end

  def occupied_spaces
    spaces = []
    cells.each do |array|
      spaces << array if !array.empty?
    end
    spaces
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
    matrix.is_a? String
  end

  def get_winning_player(matrix)
    matrix.is_a?(String) ? matrix : false
  end

  def check_matrix(human_piece, computer_piece)
    if check_columns(human_piece, computer_piece).is_a? String  
      return check_columns(human_piece, computer_piece)
    elsif check_right_diagonal(human_piece, computer_piece).is_a? String
      return check_right_diagonal(human_piece, computer_piece)
    elsif check_left_diagonal(human_piece, computer_piece).is_a? String
      return check_left_diagonal(human_piece, computer_piece)
    elsif check_rows(human_piece, computer_piece).is_a? String
      return check_rows(human_piece, computer_piece)
    else
      return false
    end 
  end

  def display_row
    get_board_row
  end

  private

  def check_left_diagonal(human_piece, computer_piece)
    if get_left_diagonal.count(human_piece) == get_board_size 
      return human_piece
    elsif get_left_diagonal.count(computer_piece) == get_board_size
       return computer_piece
    else
      return false
    end
  end

  def check_right_diagonal(human_piece, computer_piece)
    if get_right_diagonal.count(human_piece) == get_board_size 
      return human_piece
    elsif get_right_diagonal.count(computer_piece) == get_board_size 
       return computer_piece
    else
      return false
    end
  end

  def check_rows(human_piece, computer_piece)
    get_board_row.each do |array|
      if array.count(human_piece) == get_board_size
        return human_piece
      elsif array.count(computer_piece) == get_board_size
        return computer_piece
      end
    end
    false
  end

  def check_columns(human_piece, computer_piece)
    get_board_column(get_board_row).each do |array| 
      if array.count(human_piece) == get_board_size
        return human_piece
      elsif array.count(computer_piece) == get_board_size
        return computer_piece
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
