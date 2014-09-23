require_relative 'human_player.rb'

class UserInterface
    
    def prompt_for_board
      puts "Welcome to Tic Tac Toe. Please enter a number to determine board size : ex, inputting '6' would create a 6x6 board." 
    end

    def get_board_choice
      choice = gets.chomp
      choice.to_i
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
      puts "Welcome to Tic Tac Toe against #{player}. The computer will go first." 
    end

    def user_prompt
      puts "Please choose a number for your 'O'."
    end

    def human_choice(answer)
      puts "You chose space number #{answer}."
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
     p cells[1..Math.sqrt(cells.length)] * Math.sqrt(cells.length)
     # p board[Math.sqrt(board.length) - 1..Math.sqrt(board.length) * 2 - 2]
     # p board[Math.sqrt(board.length) - 1..Math.sqrt(board.length) * 2 - 2]

      # puts "#{board["1"]} | #{board["2"]} | #{board["3"]}"
      # puts "---------"
      # puts "#{board["4"]} | #{board["5"]} | #{board["6"]}"
      # puts "---------"
      # puts "#{board["7"]} | #{board["8"]} | #{board["9"]}"
    end 
end

