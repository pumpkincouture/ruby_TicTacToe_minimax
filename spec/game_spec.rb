require_relative 'spec_helper.rb'

describe Game do
	let(:cells) { ["X", "X", "X", "O", "O", "O", [], [], []] }
	let(:open_spaces) { [6, 7, 8] }

	before :each do
		@user_interface = MockUi.new
		@human_player = MockHuman.new
		@board = MockBoard.new(@user_interface, )
		@player = MockPlayer.new
		@new_game = GameStatus.new(@player, @human_player, @user_interface, @board)
	end

	xit "returns a winner" do
		string = "computer"
	  expect(@new_game.winner?).to be true
	end

	xit "returns winner" do
		string = "computer"
		expect(@new_game.game_over?(cells)).to eq(string)
	end

	xit "calls methods for first computer move" do
		expect(@new_game.first_move).to be_nil
	end

	xit "calls the game methods until game_over is true" do
  	expect(@new_game.play_game).to be_nil
	end
end

