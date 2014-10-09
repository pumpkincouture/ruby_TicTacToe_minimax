require_relative 'spec_helper.rb'

describe IntelComputerPlayer do

	before :each do
	  @ai = IntelComputerPlayer.new(@game_piece)
	  @ui = MockUi.new
	  @choice = 3
	  @board = Board.new(@ui, @choice)
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

	xit "returns move" do
		@board.cells = ["O", [], "O", 
		   			 				"X", "O", "X", 
		   			 				"X", "O","X"]
		expect(@ai.minimax(@board, 5, @ai.game_piece)).to eq(1)
	end

	xit "returns move" do
		@board.cells = [ "X", [], "O", 
		   			 				 [],  "O", "X", 
		   			 				 "X", "O", "O"]
		expect(@ai.minimax(@board, 5, @ai.game_piece)).to eq(3)
	end


	xit "returns best move" do
		@board.cells = ["O", [], "X", 
		   			 				"X", [], [], 
		   			 				"X", "O","O"]
		expect(@ai.minimax(@board, 5, @ai.game_piece)).to eq(4)
	end

	xit "returns best move" do
		@board.cells = ["O", "O", "X", 
		   			 				"X", [], [], 
		   			 				"X", "O","O"]
		expect(@ai.minimax(@board, 5, @ai)).to eq(4)
	end

	it "returns best move" do
		@board.cells = ["X", "O", "O", 
		   			 				"O", "X", [], 
		   			 				"X", [], "O"]
		expect(@ai.minimax(@board, 5, @ai)).to eq(5)
	end

	xit "returns best move" do
		@board.cells = ["O", "X", "O", 
		   			 				[], "O", [], 
		   			 				[], [],[]]
		expect(@ai.minimax(@board, 5, @ai)).to eq(1)
	end

end