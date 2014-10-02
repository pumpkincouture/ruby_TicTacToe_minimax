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
    return moves
  end

  def get_best_move(open_cells, game_state)
          

  end  
end