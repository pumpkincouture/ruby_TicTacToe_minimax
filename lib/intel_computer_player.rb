require_relative 'ttt_constants.rb'

class IntelComputerPlayer
  include TTTConstants

  attr_reader :game_piece

  def initialize(game_piece)
    @game_piece = X_PIECE
  end

  def comp_move(board, depth = 0, game_piece)
    return scores_at_depth(depth, board) if board.game_over?(O_PIECE, game_piece) || depth == 4

    scores = {}

    board.open_spaces.each do |move|
        potential_board = board.clone
        potential_board.cells[move] = game_piece
        scores[move] = comp_move(board, depth + 1, switch_players(game_piece))
        potential_board.clear_board(potential_board, move)
    end

    if depth == 4
      scores.max_by {|move, score| score}[0]
    else
     scores.min_by {|move, score| score}[0]
    end
  end

  def get_best_move(scores)
    scores.max_by {|move, score| score}[0]
  end

  def score_possible_moves
  end

  def get_move_score
    #depending on depthm get either highest or lowest score
    # ai_turn?(depth) ? max_score_from(scores) : min_score_from(scores)
  end

  def switch_players(game_piece)
    game_piece == X_PIECE ?  O_PIECE : X_PIECE
  end

  def computer_wins?(board)
    board.check_matrix(O_PIECE, @game_piece) == @game_piece
  end

  def human_wins?(board)
    board.check_matrix(O_PIECE, @game_piece) == O_PIECE
  end

  def scores_at_depth(depth, board)
    if computer_wins?(board)
      10 - depth
    elsif human_wins?(board)
      depth - 10
    else
       0
    end
  end
end
