require_relative 'ttt_constants'

class ComputerPlayer
  include TTTConstants

  attr_reader :game_piece

  def initialize(game_piece)
    @game_piece = X_PIECE
  end
  
  def possible_moves(board)
    move = []
    board.cells.each_with_index do |subarray, idx|
      move << idx if subarray != @game_piece && subarray != O_PIECE
    end
    move [ rand(move.length) ]
  end

  def comp_move(move)
    move
  end 
end