require_relative 'spec_helper'

describe IntelComputerPlayer do

	let (:human_game_piece) { "%" }
  let (:computer_game_piece) { "X" }

	before :each do
		@game_piece = "X"
	  @ai = IntelComputerPlayer.new(@game_piece)
	  @choice = 3
	  @board = Board.new(@ui, @choice)
	end
	
	it "returns last move" do
		@board.cells = ["#{human_game_piece}", [], "#{human_game_piece}", 
		   			 				"#{computer_game_piece}", "#{human_game_piece}", "#{computer_game_piece}", 
		   			 				"#{computer_game_piece}", "#{human_game_piece}", "#{computer_game_piece}"]
		expect(@ai.comp_move(@board)).to eq(1)
	end

	it "returns a win for itself instead of a win for the opponent" do
		@board.cells = [ "#{human_game_piece}", [], "#{human_game_piece}",
		   			 				 [],  "#{computer_game_piece}", "#{computer_game_piece}", 
		   			 				 "#{human_game_piece}", "#{computer_game_piece}", "#{human_game_piece}"]
		expect(@ai.comp_move(@board)).to eq(1)
	end

	it "returns a win for itself instead of pursuing a cat's game" do
		@board.cells = [ "X", [], "O", 
		   			 				 [],  [], "X", 
		   			 				 "X", "O", "O"]
		expect(@ai.comp_move(@board)).to eq(3)
	end

	it "returns a win for itself" do
		@board.cells = [ "X", "X", "O", 
		   			 				 "O", [], "X", 
		   			 				 "X", [], "X"]
		expect(@ai.comp_move(@board)).to eq(4)
	end

	it "returns a win for itself, and a block for the opponent" do
		@board.cells = ["O", [], "X", 
		   			 				"X", [], [], 
		   			 				"X", "O","O"]
		expect(@ai.comp_move(@board)).to eq(4)
	end

	it "returns best move given two spots taken on the board" do
		@board.cells = ["O", [], "O", 
		   			 				[], [], [], 
		   			 				[], [],[]]
		expect(@ai.comp_move(@board)).to eq(7)
	end

	it "returns best move given one space taken by its opponent" do
		@board.cells = [[], [], [], 
		   			 				[], "O",[], 
		   			 				[], [],[]]
		expect(@ai.comp_move(@board)).to eq(0)
	end

	it "returns best move given a blank board" do
		@board.cells = [[], [], [], 
		   			 				[], [],[], 
		   			 				[], [],[]]
		expect(@ai.comp_move(@board)).to eq(4)
	end

	it "returns best move given that opponent has taken corners" do
		@board.cells = ["O", "X", "O", 
		   			 				[], [], [], 
		   			 				[], [],[]]
		expect(@ai.comp_move(@board)).to eq(7)
	end
end