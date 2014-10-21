require_relative 'player'

class ComputerPlayer < Player

  def comp_move(board)
    board.open_spaces.sample
  end
end