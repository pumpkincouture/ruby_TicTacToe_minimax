require_relative 'ttt_constants'

class GamePieceFactory
  include TTTConstants

	def create_game_piece(choice)
		case choice
		when "1"
		  "&"
		when "2"
			"*"
		when "3"
			"%"
		when "4"
			"@"
		when "5"
			"O"
		end
	end
end