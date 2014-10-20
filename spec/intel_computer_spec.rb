require_relative 'spec_helper.rb'

describe IntelComputerPlayer do

	before :each do
	  @ai = IntelComputerPlayer.new(@game_piece)
	  @ui = MockUi.new
	  @choice = 3
	  @board = Board.new(@ui, @choice)
	end
	
	it "checks if computer won" do
			@board.cells = ["O", "X", "X", 
		   			 				"X", "X", "X", 
		   			 				"X", "O","O"]
	  expect(@ai.computer_wins?(@board)).to be true
	end

	it "checks if human won" do
			@board.cells = ["O", "X", "X", 
		   			 				"X", "O", "X", 
		   			 				"X", "O","O"]
	  expect(@ai.human_wins?(@board)).to be true
	end

	it "returns moves" do
		@board.cells = ["O", [], "O", 
		   			 				"X", "O", "X", 
		   			 				"X", "O","X"]
		expect(@ai.minimax(@board, @ai.game_piece)).to eq(1)
	end

	it "returns moves" do
		@board.cells = [ "O", [], "O", 
		   			 				 [],  "X", "X", 
		   			 				 "O", "X", "O"]
		expect(@ai.minimax(@board, @ai.game_piece)).to eq(1)
	end

	it "returns moves" do
		@board.cells = [ "X", [], "O", 
		   			 				 [],  [], "X", 
		   			 				 "X", "O", "O"]
		expect(@ai.minimax(@board, @ai.game_piece)).to eq(3)
	end

	it "returns moves" do
		@board.cells = [ "X", "X", "O", 
		   			 				 "O", [], "X", 
		   			 				 "X", [], "X"]
		expect(@ai.minimax(@board, @ai.game_piece)).to eq(4)
	end

	it "returns moves" do
		@board.cells = ["O", [], "X", 
		   			 				"X", [], [], 
		   			 				"X", "O","O"]
		expect(@ai.minimax(@board, @ai.game_piece)).to eq(4)
	end

	xit "returns best move" do
		@board.cells = ["O", "X", "O", 
		   			 				[], [], [], 
		   			 				[], [],[]]
		expect(@ai.minimax(@board, @ai.game_piece)).to eq(4)
	end
end