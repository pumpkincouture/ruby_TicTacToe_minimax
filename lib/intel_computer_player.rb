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

  def can_comp_win(computer_spaces, open_spaces)
    possible_moves = []
    open_spaces.each do |move|
      potential = computer_spaces << move
      p possible_moves << potential
    end
    possible_moves
  end

  def get_best_move(open_cells, game_state)
    

  end  
end