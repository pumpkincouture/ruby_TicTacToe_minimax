require_relative 'spec_helper.rb'

describe IntelComputerPlayer do

	before :each do
	  @ai = IntelComputerPlayer.new
	  @player = MockPlayer.new
	  @ui = MockUi.new
	  @choice = 3
	  @board = Board.new(@ui, @choice)
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

	it "scores the game" do
		@board.cells = ["O", [], "X", 
		   			 				"X", [],  [], 
		   			 				"X", "O","O"]
		expect(@ai.get_score(@board)).to eq(0)
	end

	it "scores the game" do
		@board.cells = ["O", [], "X", 
		   			 				"X", "X",  [], 
		   			 				"X", "O","O"]
		expect(@ai.get_score(@board)).to eq(1)
	end

	it "scores the game" do
		@board.cells = ["O", [], "X", 
		   			 				"X", [],  [], 
		   			 				"X", "O","O"]
		expect(@ai.get_score(@board)).to eq(0)
	end

	it "scores the game" do
		@board.cells = ["O", [], "X", 
		   			 				"X", "O",  [], 
		   			 				"X", "O","O"]
		expect(@ai.get_score(@board)).to eq(-1)
	end

	it "returns move" do
		@board.cells = ["O", [], "O", 
		   			 				"X", "O", "X", 
		   			 				"X", "O","X"]
		expect(@ai.minimax(@board, 4, @ai)).to eq(1)
	end

	it "returns move" do
		@board.cells = ["O", [], "O", 
		   			 				"X", [], "X", 
		   			 				"X", "O","X"]
		expect(@ai.minimax(@board, 4, @ai)).to eq(4)
	end


	it "returns best move" do
		@board.cells = ["O", [], "X", 
		   			 				"X", [], [], 
		   			 				"X", "O","O"]
		expect(@ai.minimax(@board, 0, @ai)).to eq(4)
	end

	xit "returns best move" do
		@board.cells = ["O", "O", "X", 
		   			 				"X", [], [], 
		   			 				"X", "O","O"]
		expect(@ai.minimax(@board, 0, @ai)).to eq(4)
	end

	xit "returns best move" do
		@board.cells = [[], [], [], 
		   			 				[], [], [], 
		   			 				"X", "O","O"]
		expect(@ai.minimax(@board, 0, @ai)).to eq(0)
	end
end