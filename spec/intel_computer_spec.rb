require_relative 'spec_helper.rb'

describe IntelComputerPlayer do

	before :each do
	  @ai = IntelComputerPlayer.new
	  @player = MockPlayer.new
	end
	
	it "returns open spaces" do
		cells = ["X", [], "O", 
		   			 "X", [], "O", 
		   			 [], "O", []]
		expect(@ai.get_open_cells(cells)).to eq([1,4,6,8])
	end

	it "returns the computer spaces" do
		cells = ["O", [], "X", 
		   			 "X", [],  [], 
		   			 "X", "O","O"]
		expect(@ai.computer_spaces(cells)).to eq([2, 3, 6])
	end

	it "picks the move that will lead to a computer win" do
		cells = [1,4,5]
		game_state = ["O", [], "X", 
		   			 			"X", [],  [], 
		   			 			"X", "O","O"]
		expect(@ai.get_best_move(cells, game_state)).to eq([4])
	end


end