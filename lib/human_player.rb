require_relative 'user_interface'

class HumanPlayer
  
	def user_turn(ui)
	  ui.user_prompt
	  @@human_answer = gets.chomp
	end

	def answer
	  @@human_answer
	end
end