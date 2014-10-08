require_relative 'ttt_constants.rb'

class IntelComputerPlayer
  include TTTConstants

  attr_reader :game_piece

  def initialize(game_piece)
    @game_piece = X_PIECE
  end
  
  def switch_players(game_piece)
    game_piece == X_PIECE ?  O_PIECE : X_PIECE
  end

  def minimax(board, game_piece)
    return 0 if board.matrix_string?(board.check_matrix) || board.board_full?
    
    # p "back up here" if depth == 5
    score_pairs = {}

    if game_piece == X_PIECE
      board.open_spaces.each do |move|
        potential_board = board.dup
        potential_board.cells[move] = game_piece
        score_pairs.store(move, get_score(potential_board))
        minimax(potential_board, switch_players(game_piece))
        potential_board.clear_board(potential_board, move)
        score_pairs.max_by {|move, score| score}[0]
      end
    else 
      board.open_spaces.each do |move|
        another_board = board.dup
        another_board.cells[move] = game_piece
        score_pairs.store(move, get_score(another_board))
        minimax(another_board, switch_players(game_piece))
        another_board.clear_board(another_board, move)
        score_pairs.min_by {|move, score| score}[0]
      end
    end
    p score_pairs.max_by {|move, score| score}[0]
    return score_pairs.max_by {|move, score| score}[0] if 0

  end

  def get_score(board_state)

    if board_state.check_matrix == X_PIECE
       return 1
    elsif board_state.check_matrix == O_PIECE
       return -1
    else
       return 0
    end
  end
end
