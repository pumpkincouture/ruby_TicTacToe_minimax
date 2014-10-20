require_relative 'spec_helper.rb'

describe ComputerPlayer do
  let(:cells) { [[], [], [], [], [], [], [], [], []]}
  let(:moves) { [0, 1, 2, 3, 4, 5, 6, 7, 8] }
  
	before :each do
		@game_piece = "&"
	  @computer_player = ComputerPlayer.new(@game_piece)
	  @ui = MockUi.new
	  @choice = 3
	  @board = Board.new(@ui, @choice)
	end

	it "identifies game piece" do
		expect(@computer_player.game_piece).to eq("&")
	end

	it "picks a move" do
		@board.cells = ["O", [], "X", 
		   						  "X", "O","O", 
		   			 				"X", "O","X"]
		expect(@computer_player.comp_move(@board)).to eq(1)
	end
end