require_relative 'spec_helper.rb'

describe IntelComputerPlayer do

	before :each do
	  @ai = IntelComputerPlayer.new
	end

	it "returns a random board move" do
		cells = ["X", "O", [], [], [], [], [], [], []]
		expect(@ai.return_move(cells)).not_to be_empty
	end

	it "assign score to moves" do
		cells = ["X", "O", [], "X", "X", "O", "O", [], []]
		expect(@ai.assign_score(cells)).to eq(10)
	end

 
end