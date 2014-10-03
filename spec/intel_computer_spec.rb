require_relative 'spec_helper.rb'

describe IntelComputerPlayer do

	before :each do
	  @ai = IntelComputerPlayer.new
	  @player = MockPlayer.new
	  @ui = MockUi.new
	  @choice = 3
	  @board = Board.new(@ui, @choice)
	end
	
	it "returns open spaces" do
		cells = ["X", [], "O", 
		   			 "X", [], "O", 
		   			 [], "O", []]
		expect(@ai.get_open_cells(cells)).to eq( [1,4,6,8] )
	end

	it "returns the computer spaces" do
		cells = ["O", [], "X", 
		   			 "X", [],  [], 
		   			 "X", "O","O"]
		expect(@ai.computer_spaces(cells)).to eq( [2, 3, 6] )
	end

	it "returns the computer spaces" do
		cells = [[], [], [], 
		   			 [], [], [], 
		   			 [], [], []]
		expect(@ai.computer_spaces(cells)).to eq( [] )
	end

	it "returns the human spaces" do
		cells = ["O", [], "X", 
		   			 "X", [],  [], 
		   			 "X", "O","O"]
		expect(@ai.human_spaces(cells)).to eq( [0, 7, 8] )
	end

	it "gets all possible moves" do
	  computer_spaces = [2, 3, 6]
	  open_spaces = [1,4,6,8]
		expect(@ai.create_board_state(computer_spaces, open_spaces)).to eq( [ [2, 3, 6, 1], [2, 3, 6, 4], [2, 3, 6, 6], [2, 3, 6, 8] ] )
	end

	it "gets all possible moves" do
	  computer_spaces = []
	  open_spaces = [1, 2, 3, 4, 5, 6, 7, 8]
		expect(@ai.create_board_state(computer_spaces, open_spaces)).to eq( [ [1], [2], [3], [4], [5], [6], [7], [8] ] )
	end

	it "checks for diagonal match" do
		@board.cells = ["O", [], "X", 
		   						  "X", [],  [], 
		   			 				"X", "O","O"]
		 
	  possible_moves = [ [2, 3, 6, 1], [2, 3, 6, 4], [2, 3, 6, 6], [2, 3, 6, 8] ]
		expect(@ai.check_for_comp_win(possible_moves, @board)).to be true
	end

	xit "checks if computer can win" do
		@board.cells = ["O", [], "X", 
		   						  "X", [],  [], 
		   			 				"X", "O","O"]

	  possible_moves = [ [2, 3, 6, 1], [2, 3, 6, 4], [2, 3, 6, 6], [2, 3, 6, 8] ]
		expect(@ai.check_for_comp_win(possible_moves, @board)).to be true
	end

	it "picks the move that will lead to a computer win" do
		cells = [1,4,5]
		game_state = ["O", [], "X", 
		   			 			"X", [],  [], 
		   			 			"X", "O","O"]
		expect(@ai.get_best_move(cells, game_state)).to eq([4])
	end


end