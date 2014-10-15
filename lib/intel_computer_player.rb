require_relative 'ttt_constants.rb'

class IntelComputerPlayer
  include TTTConstants

  attr_reader :game_piece

  def initialize(game_piece)
    @game_piece = X_PIECE
  end

  def comp_move(board, scores = {}, depth, game_piece)
    return get_score(board) if board.game_over?(O_PIECE, game_piece) || depth == 0

    board.open_spaces.each do |move|
        potential_board = board.clone
        potential_board.cells[move] = game_piece
        scores[move] = comp_move(board, {}, depth - 1, switch_players(game_piece))
        potential_board.clear_board(potential_board, move)
    end

    if depth == 0
      return scores.max_by {|move, score| score}[0]
    else
      return scores.min_by {|move, score| score}[0]
    end
  end

  def switch_players(game_piece)
    game_piece == X_PIECE ?  O_PIECE : X_PIECE
  end

  def get_score(board_state)
    if board_state.check_matrix(O_PIECE, @game_piece) == @game_piece
       return 1
    elsif board_state.check_matrix(O_PIECE, @game_piece) == O_PIECE
       return -1
    else
       return 0
    end
  end
end
