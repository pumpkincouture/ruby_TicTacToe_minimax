require_relative 'ttt_constants.rb'

class IntelComputerPlayer
  include TTTConstants
  
  def return_move(cells)
    move = [ rand(cells.length) + 1]
  end

  def assign_score(cells)
    cells.each_with_index do |space, idx|
      if idx == 8
         return 10       
      end
    end
  end



  
end
