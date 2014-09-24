require_relative 'board'
require_relative 'ttt_constants'

class ComputerPlayer
  include TTTConstants

  def possible_moves(cells)
    move = []
    cells.each_with_index do |subarray, idx|
      move << idx if subarray != X_PIECE && subarray != O_PIECE
    end
    move
  end

  def comp_move(move)
    move[-1]
  end 
end