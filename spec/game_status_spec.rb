require_relative 'spec_helper.rb'

describe GameStatus do
	let(:cells) { ["X", "X", "X", "O", "O", "O", [], [], []] }
	let(:open_spaces) { [6, 7, 8] }

	before :each do
		@game_runner = MockGameRunner.new(@board = MockBoard.new)
		@game_status = GameStatus.new
	end

	xit "returns winner" do
		string = "computer"
		expect(@new_game.game_over?(cells)).to eq(string)
	end

	it "checks if there's a draw" do
		expect(@game_status.game_over?(@board.cells)).to be true
	end

	xit "calls methods for first computer move" do
		expect(@new_game.first_move).to be_nil
	end

	xit "calls the game methods until game_over is true" do
  	expect(@new_game.play_game).to be_nil
	end
end

