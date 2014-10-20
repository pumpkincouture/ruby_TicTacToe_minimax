require_relative 'ttt_constants'

class UserInterface
    include TTTConstants

    def prompt_for_board
      puts "Welcome to Tic Tac Toe. Please enter a number to determine board size : ex, inputting '6' would create a 6x6 board." 
    end

    def get_board_choice
      choice = gets.chomp
      choice.to_i
    end

    def prompt_for_piece
      puts "Please choose your game piece. Please indicate your choice with the appropriate number."
    end

    def display_game_pieces
      GAME_PIECES.each do |number, symbol|
        puts "#{number} : #{symbol}"
      end
    end

    def get_game_piece
      choice = gets.chomp
    end

    def prompt_for_player_type
      puts "Please choose your player level : press e for easy and h for hard."
    end

    def get_player_choice
      choice = gets.chomp
      choice.upcase!
    end

    def print_player_error
      puts "That's not a valid choice, please try again."
    end

    def welcome(player)
      puts "Welcome to Tic Tac Toe against #{player}. The computer will place its #{player.game_piece} on the board first." 
    end

    def user_prompt(game_piece)
      puts "Please choose a number for your #{game_piece}."
    end

    def get_user_answer
      human_answer = gets.chomp
    end

    def human_choice(answer)
      puts "You chose space number #{answer}."
    end

    def computer_thinking
      puts "The computer is thinking of a move..."
    end

    def computer_choice(answer)
      puts "Computer chose space number #{answer + 1}."
    end

    def human_wins
      puts "Human won!"
    end

    def computer_wins
      puts "Computer won!"
    end

    def cats_game
      puts "Cat's game!"
    end

    def user_error
      puts "I'm sorry, that is not a valid move, please try again."
    end

    def display_board(cells)
      cloned_board = cells.clone
      new_board = ""
      lines = "---------"

      new_board = cloned_board.map {|cells| cells.join(' | ')}
      new_board.each do |row|
        puts row
        puts lines
      end
    end 
end