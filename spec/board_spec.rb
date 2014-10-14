require_relative 'spec_helper.rb'

describe Board do
  let (:computer_answer) { 9 }
  let (:human_answer) { "6" }
  let (:invalid_answer) { " " }

  let (:board_choice) { 3 }
  let (:human_game_piece) { "%" }
  let (:computer_game_piece) { "X" }
  
  before :each do
  	@ui = MockUi.new
    @board = Board.new(@ui, board_choice )
  end

	it "creates a cells instance variable" do
		cells_instance = [[], [], [], [], [], [], [], [], []]
	  expect(@board.cells).to eq(cells_instance)
	end

	it "if answer is invalid key, returns true" do
		@board.invalid_key(invalid_answer)
		expect(@board.invalid_key(invalid_answer)).to be true
	end

	it "if answer is invalid key, returns true" do
		@board.cells = [ "#{computer_game_piece}", [], [], [], [], "#{human_game_piece}", [], [], "#{computer_game_piece}" ]
		expect(@board.invalid_key(1)).to be true
	end

	it "places move on board if answer is valid" do
		cells_example = [ [], [], [], [], [], "#{human_game_piece}", [], [], [] ]
		@board.valid_move(human_answer, human_game_piece)
		expect(@board.cells).to eq(cells_example)
	end

	it "places move on board" do
		cells_example = [ [], [], [], [], [], [], [], [], [], "#{computer_game_piece}" ]
		@board.computer_move(computer_answer, computer_game_piece)
		expect(@board.cells).to eq(cells_example)
	end

	it "checks if winner or draw" do 
		@board.cells = ["#{human_game_piece}", "#{computer_game_piece}", "#{human_game_piece}", 
		   			 				"#{computer_game_piece}", "#{human_game_piece}", "#{human_game_piece}", 
		   			 				"#{computer_game_piece}", "#{human_game_piece}", "#{human_game_piece}"]
	  expect(@board.game_over?(human_game_piece, computer_game_piece)).to be true
	end

	it "checks if winner or draw" do 
		@board.cells = ["#{human_game_piece}", "#{computer_game_piece}", "#{human_game_piece}", 
		   			 				"#{computer_game_piece}", "#{human_game_piece}", "#{human_game_piece}", 
		   			 				"#{computer_game_piece}", "#{human_game_piece}", "#{human_game_piece}"]
	  expect(@board.game_over?(human_game_piece, computer_game_piece)).to be true
	end

	it "checks if winner or draw" do 
		@board.cells = ["#{human_game_piece}", "#{computer_game_piece}", "#{human_game_piece}", 
		   			 				"#{computer_game_piece}", "#{human_game_piece}", [], 
		   			 				"#{computer_game_piece}", "#{human_game_piece}", []]
	  expect(@board.game_over?(human_game_piece, computer_game_piece)).to be false
	end

	it "checks for a winner" do
		@board.cells = ["#{human_game_piece}", "#{computer_game_piece}", "#{human_game_piece}", 
		   			 				"#{computer_game_piece}", "#{computer_game_piece}", "#{human_game_piece}", 
		   			 				"#{computer_game_piece}", "#{computer_game_piece}",[]]
		expect(@board.winner?(human_game_piece, computer_game_piece)).to be true
	end

	it "checks for a winner" do
		@board.cells = ["#{human_game_piece}", "#{computer_game_piece}", "#{computer_game_piece}", 
		   			 				"#{computer_game_piece}", "#{computer_game_piece}", "#{human_game_piece}", 
		   			 				"#{computer_game_piece}", "#{human_game_piece}",[]]
		expect(@board.winner?(human_game_piece, computer_game_piece)).to be true
	end

	it "checks for a winner" do
		@board.cells = ["#{human_game_piece}", [], "#{computer_game_piece}", 
		   			 				"#{computer_game_piece}", "#{human_game_piece}", "#{human_game_piece}", 
		   			 				"#{computer_game_piece}", "#{human_game_piece}", "#{human_game_piece}"]
		expect(@board.winner?(human_game_piece, computer_game_piece)).to be true
	end

	it "checks for a draw" do
		@board.cells = ["#{human_game_piece}", "#{computer_game_piece}", "#{human_game_piece}", 
		   			 				"#{computer_game_piece}", "#{computer_game_piece}", "#{human_game_piece}", 
		   			 				"#{computer_game_piece}", "#{human_game_piece}","#{computer_game_piece}"]
		expect(@board.draw?).to be true
	end

	it "checks amount of open spaces" do
		@board.cells = ["#{computer_game_piece}", "#{computer_game_piece}", "#{human_game_piece}", 
										"#{computer_game_piece}", "#{human_game_piece}", "#{human_game_piece}", 
										"#{human_game_piece}", "#{human_game_piece}", "#{computer_game_piece}"]
		expect(@board.board_full?).to be true
	end

	it "clears the board of a move" do
		@board.cells = ["#{human_game_piece}", "#{human_game_piece}", "#{computer_game_piece}", 
		   			 				"#{computer_game_piece}", [], [], 
		   			 				"#{computer_game_piece}", "#{human_game_piece}","#{human_game_piece}"]

		real_board = 	["#{human_game_piece}", "#{human_game_piece}", "#{computer_game_piece}", 
		   			 			 [], [], [], 
		   			 			 "#{computer_game_piece}", "#{human_game_piece}","#{human_game_piece}"]
		move = 4
		expect(@board.clear_board(@board, move)).to eq([])
	end

	it "finds board size" do
		expect(@board.get_board_size).to eq(3.0)
	end

	it "returns boolean" do
		matrix = "X"
		expect(@board.matrix_string?(matrix)).to be true
	end

	it "gets winning player string" do
		matrix = "O"
		expect(@board.get_winning_player(matrix)).to eq("O")
	end

	it "displays board row" do
		@board.cells = ["#{human_game_piece}", [], "#{computer_game_piece}", 
		   			 			  "#{computer_game_piece}", [],  [], 
		   			 			  "#{computer_game_piece}", "#{human_game_piece}","#{human_game_piece}"]
		expect(@board.display_row).to eq([ ["#{human_game_piece}", [], "#{computer_game_piece}"], 
																			 ["#{computer_game_piece}", [], []], 
																			 ["#{computer_game_piece}", "#{human_game_piece}", "#{human_game_piece}"] ])
	end
end

