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

  def possible_moves(cells)
    minimax(cells, 5, X_PIECE)
  end

  def switch_players(game_piece)
    game_piece == X_PIECE ?  O_PIECE : X_PIECE
  end

  def minimax(board, depth, game_piece)
    return -1 if depth == 0
    # return 0 if board.matrix_string?(board.check_matrix) || board.board_full?
    # return 0 if board.board_full?
    return 0 if board.get_winning_player(board.check_matrix)

    score_pairs = {}

    if game_piece == X_PIECE
      board.open_spaces.each do |move|
        potential_board = board.dup
        potential_board.cells[move] = game_piece
        p potential_board
        score_pairs.store(move, get_score(potential_board))
        minimax(potential_board, depth - 1, switch_players(game_piece))
        potential_board.clear_board(potential_board, move)
        # score_pairs.max_by {|move, score| score}[0]
      end
    else 
      board.open_spaces.each do |move|
        another_board = board.dup
        another_board.cells[move] = game_piece
        score_pairs.store(move, get_score(another_board))
        p another_board
        minimax(another_board, depth - 1, switch_players(game_piece))
        another_board.clear_board(another_board, move)
        # score_pairs.min_by {|move, score| score}[0]
      end
    end
    # p score_pairs.max_by {|move, score| score}[0] if 0
    p score_pairs if 0
    p "I didnt find a winner" if -1
    # score_pairs.min_by {|move, score| score}[0] if 0
    # p score_pairs if 0
    # p "hello" if -1
  end

  def get_score(board_state)

    if board_state.get_winning_player(board_state.check_matrix) == X_PIECE
       return 1
    # elsif board_state.get_winning_player(board_state.check_matrix) == O_PIECE
    #    return -1
    elsif board_state.get_winning_player(board_state.check_matrix) != X_PIECE || 
       return -1
    else
       return 0
    end
  end
end
