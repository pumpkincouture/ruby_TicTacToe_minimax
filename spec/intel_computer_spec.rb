require_relative 'spec_helper.rb'

describe IntelComputerPlayer do

	before :each do
	  @ai = IntelComputerPlayer.new
	  @player = MockPlayer.new
	end

	it "represents smallest recursive case" do
		expect(@ai.call_back(5)).to eq(0)
	end

	it "represents a larger recursive case" do
		cells = ["X", "X", "O", "X", "O", "O", [], "O", []]
		depth = 0
		expect(@ai.minimax_call_back(depth, @player, cells)).to eq([6,8])
		
	end
 
end