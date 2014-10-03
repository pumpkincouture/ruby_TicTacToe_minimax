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

  def check_against_diagonals(possible_moves, board)

  end

  def check_for_comp_win(possible_moves, board)
    possible_moves.each do |moves|
      moves.each do |index|
        board.display_diagonals.each do |array|
          array.each_with_index do |space, idx|
            return idx * board.get_board_size if array.count(index) == idx * board.get_board_size
          end
        end
      end
    end
    board.display_diagonals 
  end

  def get_best_move(open_cells, game_state)
    

  end  
end