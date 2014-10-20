require_relative 'ttt_constants.rb'

class IntelComputerPlayer
  include TTTConstants

  attr_reader :game_piece

  def initialize(game_piece)
    @game_piece = game_piece
  end

  def comp_move(board)
    board.open_spaces.length == board.get_board_size ** 2 ? (board.open_spaces.length/board.get_board_size + 1).to_i : minimax(board, @game_piece)
  end

  private 

  def clone(board)
    board.clone
  end

  def minimax(board, scores = {}, depth = 0, game_piece)
    return get_scores(board) if board.game_over?(O_PIECE, game_piece)

    board.open_spaces.each do |move|
        potential_board = clone(board)
        potential_board.cells[move] = game_piece
        scores[move] = -10 * minimax(board, {}, depth + 1, switch_players(game_piece))
        potential_board.clear_board(potential_board, move)
    end
    score_depth(depth, scores)
  end

  def score_depth(depth, scores)
    depth == 0 ? get_best_move(scores) : get_best_score(scores)
  end

  def get_best_move(scores)
    scores.max_by {|move, score| score}[0]
  end

  def get_best_score(scores)
    scores.max_by { |move, score| score }[1]
  end

  def get_scores(board)
    if computer_wins?(board)
      10
    elsif human_wins?(board)
      -10
    else
      0
    end
  end

  def computer_wins?(board)
    board.check_matrix(O_PIECE, @game_piece) == @game_piece
  end

  def human_wins?(board)
    board.check_matrix(O_PIECE, @game_piece) == O_PIECE
  end

  def switch_players(game_piece)
    game_piece == @game_piece ?  O_PIECE : @game_piece
  end
end