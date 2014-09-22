require_relative 'spec_helper.rb'

describe ComputerPlayer do
  let(:cells) { {"1" => "X", "2" => "X", "3" => "X", "4" => "O", "5" => "O", "6" => "6", "7" => "O", "8" => "8", "9" => "9"} }
  let(:moves) { ["6", "8", "9"] }
  let(:move) { "9"}

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