require_relative 'spec_helper.rb'

describe ComputerPlayer do
  let(:cells) { [[], [], [], [], [], [], [], [], []]}
  let(:moves) { [0, 1, 2, 3, 4, 5, 6, 7, 8] }
  let(:move) { 8 }

	before :each do
	  @computer_player = ComputerPlayer.new
	end

	it "returns open cells" do
		expect(@computer_player.possible_moves(cells)).to eq(moves)
	end

	it "picks one move" do
		expect(@computer_player.comp_move(moves)).to eq(move)
	end
end