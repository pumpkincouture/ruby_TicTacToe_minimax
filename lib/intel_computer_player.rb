require_relative 'ttt_constants.rb'

class IntelComputerPlayer
  include TTTConstants
  
  def computer_spaces(cells)
    comp_location = []
    cells.each_with_index do |space, idx|
      comp_location << idx if space == X_PIECE
    end
    comp_location
  end 

  def human_spaces(cells)
    human_spaces = []
    cells.each_with_index do |space, idx|
      human_spaces << idx if space == O_PIECE
    end
    human_spaces
  end

  def create_board_state(computer_spaces, open_spaces)
    possible_moves = []
    open_spaces.each do |space|
      potential = computer_spaces << space
      possible_moves << potential.clone
      computer_spaces.pop
    end
    possible_moves
  end

  def minimax(board)
    return moves if board.matrix_string?(board.check_matrix) || board.board_full?
    scores = []
    moves = []

    board.open_spaces.each do |move|
      potential_board = board.clone
      potential_board.cells[move] = X_PIECE
      scores << get_score(potential_board)
      moves << move
      potential_board.cells[move] = []
    end
  end

  def get_score(board_state)

    if board_state.check_matrix == "X"
       return 1
    elsif board_state.check_matrix == "O"
       return -1
    else
       return 0
    end
  end
end
