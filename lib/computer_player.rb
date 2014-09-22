require_relative 'board.rb'

class ComputerPlayer
    
  def possible_moves(cells)
    move = []
    cells.each do |space, value|
    move << space if cells[space] != "X" && cells[space] != "O"
    end
    move.map!(&:to_s)
  end

  def comp_move(move)
    move[-1]
  end 
end