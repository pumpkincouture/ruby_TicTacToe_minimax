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
    p "hello" if board.matrix_string?(board.check_matrix) || board.board_full?
    # p "back up here" if depth == 5
    score_pairs = {}

    if game_piece == X_PIECE
      board.open_spaces.each do |move|
        potential_board = board.clone
        potential_board.cells[move] = game_piece
        p game_piece
        p potential_board
        score_pairs.store(move, get_score(potential_board))
        next_move = minimax(potential_board, switch_players(game_piece))
        potential_board.clear_board(potential_board, move)
        score_pairs.max_by {|move, score| score}[0]
      end
    else 
      board.open_spaces.each do |move|
        another_board = board.clone
        another_board.cells[move] = game_piece
        p game_piece
        p another_board
        score_pairs.store(move, get_score(another_board))
        next_move = minimax(another_board, switch_players(game_piece))
        another_board.clear_board(another_board, move)
        score_pairs.min_by {|move, score| score}[0]
      end
    end
  end

  def get_score(board_state)

    if board_state.check_matrix == "X"
       return 1
    elsif board_state.check_matrix == "O"
       return -1
    else
       return 0
    end
  end
end
