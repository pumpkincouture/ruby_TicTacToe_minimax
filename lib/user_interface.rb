require_relative 'human_player.rb'

class UserInterface
    
    def prompt_for_player_type
      puts "Welcome to Tic Tac Toe. Please choose your level : press e for easy and h for hard."
    end

    def get_player_choice
      choice = gets.chomp
      choice.upcase!
    end

    def print_player_error
      puts "That's not a valid choice, please try again"
    end

    def valid_player?(human_choice)
      return true if human_choice == "H" || human_choice == "E"
      false
    end

    # def validate_player_choice(player_choice)
    #   print_player_error if player_choice != "H" || player_choice != "E"
    #   player_choice
    # end

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
      puts "Computer chose space number #{answer}."
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

    def display_board(board)
      puts "#{board["1"]} | #{board["2"]} | #{board["3"]}"
      puts "---------"
      puts "#{board["4"]} | #{board["5"]} | #{board["6"]}"
      puts "---------"
      puts "#{board["7"]} | #{board["8"]} | #{board["9"]}"
    end 
end

