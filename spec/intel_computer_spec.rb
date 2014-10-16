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

	it "scores board state using depth" do
		@board.cells = ["O", "X", "O", 
		   			 				"X", "O", "X", 
		   			 				"X", "O","X"]
		expect(@ai.scores_at_depth(1, @board)).to eq(0)
	end

	it "scores board state using depth" do
		@board.cells = ["O", "O", "O", 
		   			 				"X", "O", "O", 
		   			 				"X", "O","O"]
		expect(@ai.scores_at_depth(1, @board)).to eq(-9)
	end

	it "scores board state using depth" do
		@board.cells = ["O", "X", "O", 
		   			 				"X", "X", "X", 
		   			 				"X", "O","O"]
		expect(@ai.scores_at_depth(1, @board)).to eq(9)
	end

	it "returns moves" do
		@board.cells = ["O", [], "O", 
		   			 				"X", "O", "X", 
		   			 				"X", "O","X"]
		expect(@ai.comp_move(@board, @ai.game_piece)).to eq(1)
	end

	it "returns moves" do
		@board.cells = [ "X", [], "O", 
		   			 				 [],  "O", "X", 
		   			 				 "X", "O", "O"]
		expect(@ai.comp_move(@board, @ai.game_piece)).to eq(3)
	end


	it "returns moves" do
		@board.cells = ["O", [], "X", 
		   			 				"X", [], [], 
		   			 				"X", "O","O"]
		expect(@ai.comp_move(@board, @ai.game_piece)).to eq(4)
	end

	it "returns best move" do
		@board.cells = ["O", "X", "O", 
		   			 				[], [], [], 
		   			 				[], [],[]]
		expect(@ai.comp_move(@board, @ai.game_piece)).to eq(4)
	end

end