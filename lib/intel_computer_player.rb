require_relative 'ttt_constants.rb'

class IntelComputerPlayer
  include TTTConstants
  
  def get_open_cells(cells)
    moves = []
    cells.each_with_index do |space, idx|
      if space.empty?
        moves << idx
      end
    end
    moves
  end

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
    return get_score(board_state) if board.board_full? || board.matrix_string?(board.check_matrix)
    scores = []
    moves = []

    get_open_cells(board.cells).each do |move|
      board.cells[move] = X_PIECE
      potential = board
      scores << get_score(potential)
      moves << move
    end
    p moves
    p scores
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