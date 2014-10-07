require_relative 'spec_helper.rb'

describe ComputerPlayer do
  let(:cells) { [[], [], [], [], [], [], [], [], []]}
  let(:moves) { [0, 1, 2, 3, 4, 5, 6, 7, 8] }
  
	before :each do
	  @computer_player = ComputerPlayer.new(@game_piece)
	end

	it "returns open cells" do
		expect(@computer_player.possible_moves(cells)).to eq(moves)
	end

	it "identifies game piece" do
		expect(@computer_player.game_piece).to eq("X")
	end

	it "picks a move" do
		cells = ["O", [], "X", 
		   			 "X", "O","O", 
		   			 "X", "O","X"]
		@computer_player.possible_moves(cells)
		expect(@computer_player.comp_move(@computer_player.possible_moves(cells))).to eq(1)
	end
end