require_relative 'ttt_constants.rb'

class IntelComputerPlayer
  include TTTConstants

  attr_reader :game_piece

  def initialize(game_piece)
    @game_piece = X_PIECE
  end

  def comp_move(move)
    move
  end 

  # moves = get all possible possible_moves
  # get score
  # get best move


  def possible_moves(cells)
    minimax(cells, 5, game_piece)
  end

  def switch_players(game_piece)
    game_piece == X_PIECE ?  O_PIECE : X_PIECE
  end

  def minimax(board, depth, game_piece)
    return get_score(board) if board.game_over?(O_PIECE, game_piece)

    score_pairs = {}

    if game_piece == X_PIECE
      board.open_spaces.each do |move|
        potential_board = board.cells.dup
        potential_board[move] = game_piece
        score_pairs.store(move, get_score(potential_board))
        minimax(potential_board, depth - 1, switch_players(game_piece))
        potential_board.clear_board(potential_board, move)
      end
    else 
      board.open_spaces.each do |move|
        another_board = board.cells.dup
        another_board[move] = game_piece
        score_pairs.store(move, get_score(another_board))
        minimax(another_board, depth - 1, switch_players(game_piece))
        another_board.clear_board(another_board, move)
      end
    end
  end

  def get_score(board_state)

    if board_state.check_matrix(O_PIECE, game_piece) == game_piece
       return 1
    elsif board_state.check_matrix(O_PIECE, game_piece) == O_PIECE
       return -1
    else
       return 0
    end
  end
end
