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

  def minimax(board, depth, player)
    # return move if board.matrix_string?(board.check_matrix) || board.board_full?
    p "back up here" if depth == 5
    score_pairs = {}

    if player
      board.open_spaces.each do |move|
        potential_board = board.clone
        potential_board.cells[move] = X_PIECE
        score_pairs.store(move, get_score(potential_board))
        board.clear_board(potential_board, move)
        p score_pairs
        depth += 1
        minimax(board, depth, player)
      end
      move = score_pairs.max_by {|move, score| score}[0]
      score_pairs.min_by {|move, score| score}[0]
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
