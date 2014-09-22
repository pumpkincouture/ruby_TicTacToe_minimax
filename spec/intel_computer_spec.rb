require_relative 'spec_helper.rb'

describe IntelComputerPlayer do

	before :each do
	  @intel_computer_player = IntelComputerPlayer.new
	end

  it "creates an instance variable" do
 	  comp_winning_combos = [ [1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7] ]
 	  expect(@intel_computer_player.comp_winning_combos).to eq(comp_winning_combos)
 	end
	
	it "returns the computer's location on the board" do
	  cells_example = {"1" => "1", "2" => "2", "3" => "3", "4" => "4", "5" => "X", "6" => "O", "7" => "X", "8" => "8", "9" => "9"}
	  computer_location = ["5", "7"]
	  expect(@intel_computer_player.comp_location(cells_example)).to eq(computer_location)
	end

	it "returns the human's location on the board" do
	  cells_example = {"1" => "1", "2" => "O", "3" => "O", "4" => "4", "5" => "X", "6" => "O", "7" => "X", "8" => "8", "9" => "9"}
	  human_location = ["2", "3", "6"]
	  expect(@intel_computer_player.human_location(cells_example)).to eq(human_location)
	end

	it "returns intersection of human's location and comp winning moves" do
	  cells_example = {"1" => "1", "2" => "O", "3" => "O", "4" => "4", "5" => "X", "6" => "6", "7" => "X", "8" => "8", "9" => "9"}
	  comp_winning_moves = [ [], [4,5,6], [7,8,9], [1,4,7], [], [], [1,5,9], [] ]
	  expect(@intel_computer_player.delete_from_array(cells_example)).to eq(comp_winning_moves)
	end

	it "returns 5 as computer's first move" do
		cells_example = {"1" => "1", "2" => "O", "3" => "O", "4" => "4", "5" => "5", "6" => "6", "7" => "7", "8" => "8", "9" => "9"}
		expect(@intel_computer_player.smart_move(cells_example)).to eq([5])
	end

	it "returns intersection of comp location and winning moves" do
		cells_example = {"1" => "1", "2" => "2", "3" => "3", "4" => "4", "5" => "X", "6" => "6", "7" => "7", "8" => "8", "9" => "9"}
		comp_winning_combos = [ [1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7] ]
		options = [ [4,6], [2,8], [1,9], [3,7] ]
		expect(@intel_computer_player.smart_move(cells_example)).to eq(options)
	end

	it "returns computer's first move" do
		cells_example = {"1" => "1", "2" => "O", "3" => "O", "4" => "4", "5" => "5", "6" => "6", "7" => "7", "8" => "8", "9" => "9"}
		smart = [5]
		expect(@intel_computer_player.win_move(cells_example)).to eq(smart)
	end	

	it "returns winning moves" do
		cells_example = {"1" => "1", "2" => "2", "3" => "2", "4" => "4", "5" => "X", "6" => "6", "7" => "7", "8" => "8", "9" => "9"}
		smart = [ [4,6], [2,8], [1,9], [3,7] ]
		winning_numbers = [4, 6, 2, 8, 1, 9, 3, 7]
		expect(@intel_computer_player.win_move(cells_example)).to eq(winning_numbers)
	end

	it "returns possible human moves" do
		cells_example = {"1" => "1", "2" => "O", "3" => "3", "4" => "4", "5" => "X", "6" => "6", "7" => "7", "8" => "8", "9" => "9"}
		options = [ [1,3], [5,8] ]
		expect(@intel_computer_player.find_block_move(cells_example)).to eq(options)
	end	

	it "finds one possible move for human to make" do
		cells_example = {"1" => "O", "2" => "O", "3" => "3", "4" => "4", "5" => "X", "6" => "6", "7" => "7", "8" => "8", "9" => "9"}
		block = [[3]]
		expect(@intel_computer_player.refine_block_move(cells_example)).to eq(block)
	end	

	it "returns human's move" do
		cells_example = {"1" => "O", "2" => "O", "3" => "3", "4" => "4", "5" => "X", "6" => "6", "7" => "7", "8" => "8", "9" => "9"}
		block = ["3"]
		expect(@intel_computer_player.string_block(cells_example)).to eq(block)
	end

	it "performs the final check on block" do
		cells_example = {"1" => "O", "2" => "O", "3" => "X", "4" => "4", "5" => "X", "6" => "6", "7" => "7", "8" => "8", "9" => "9"}
		option = ["3"]
		expect(@intel_computer_player.to_block?(cells_example)).to be false
	end

	it "returns the block move according to human location" do
		cells_example = {"1" => "O", "2" => "O", "3" => "3", "4" => "4", "5" => "X", "6" => "6", "7" => "7", "8" => "8", "9" => "9"}
		option = ["3"]
		expect(@intel_computer_player.to_block?(cells_example)).to eq(option)
	end

	it "returns computer's random move" do
		cells_example = {"1" => "O", "2" => "O", "3" => "X", "4" => "O", "5" => "X", "6" => "O", "7" => "7", "8" => "O", "9" => "X"}
		last_move = ["7"]
		expect(@intel_computer_player.moves_left(cells_example)).to eq(last_move)
	end

	it "returns all winning possibilities" do
		cells_example = {"1" => "X", "2" => "2", "3" => "3", "4" => "O", "5" => "X", "6" => "6", "7" => "O", "8" => "8", "9" => "9"}
		win = ["2", "3", "8", "9"]
		expect(@intel_computer_player.possible_moves(cells_example)).to eq(win)
	end

	it "returns a block move" do
		cells_example = {"1" => "O", "2" => "O", "3" => "3", "4" => "4", "5" => "X", "6" => "6", "7" => "O", "8" => "8", "9" => "X"}
		win = ["3"]
		expect(@intel_computer_player.possible_moves(cells_example)).to eq(win)
	end

	it "returns random move" do
		cells_example = {"1" => "O", "2" => "O", "3" => "X", "4" => "O", "5" => "X", "6" => "O", "7" => "7", "8" => "O", "9" => "X"}
		random = ["7"]
		expect(@intel_computer_player.possible_moves(cells_example)).to eq(random)
	end

	it "returns computer's chosen move" do
		cells_example = {"1" => "O", "2" => "O", "3" => "X", "4" => "O", "5" => "X", "6" => "O", "7" => "7", "8" => "O", "9" => "X"}
		result = "7"
		expect(@intel_computer_player.comp_move(result)).to eq(result)
	end
end