require_relative 'spec_helper.rb'

describe Game do
	let(:cells) { ["X", "X", "X", "O", "O", "O", [], [], []] }
	let(:computer_spaces) { [0, 1, 2] }
	let(:human_spaces) { [3, 4, 5] }
	let(:open_spaces) { [6, 7, 8] }

	before :each do
		@user_interface = MockUi.new
		@human_player = MockHuman.new
		@board = MockBoard.new(@user_interface, )
		@player = MockPlayer.new
		@new_game = Game.new(@player, @human_player, @user_interface, @board)
	end

	it "returns computer's current spaces" do
	  expect(@new_game.computer_spaces(cells)).to eq(computer_spaces)
	end

	it "returns human user's current spaces" do
		expect(@new_game.human_spaces(cells)).to eq(human_spaces)
	end

	xit "returns a winner" do
		string = "computer"
	  expect(@new_game.winner?(computer_spaces, human_spaces)).to eq(string)
	end

	it "returns open spaces" do
	  expect(@new_game.open_spaces(cells)).to eq(open_spaces)
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

