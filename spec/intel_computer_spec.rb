require_relative 'spec_helper.rb'

describe IntelComputerPlayer do

	before :each do
	  @intel_computer_player = IntelComputerPlayer.new
	end

  it "creates an instance variable" do
 	  comp_winning_combos = [ [1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7] ]
 	  expect(@intel_computer_player.comp_winning_combos).to eq(comp_winning_combos)
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

	it "returns winning move" do
		cells_example = {"1" => "O", "2" => "O", "3" => "X", "4" => "O", "5" => "X", "6" => "O", "7" => "X", "8" => "8", "9" => "X"}
		random = ["8"]
		expect(@intel_computer_player.possible_moves(cells_example)).to eq(random)
	end

	it "returns computer's chosen move" do
		cells_example = {"1" => "O", "2" => "O", "3" => "X", "4" => "O", "5" => "X", "6" => "O", "7" => "7", "8" => "O", "9" => "X"}
		result = "7"
		expect(@intel_computer_player.comp_move(result)).to eq(result)
	end
end