require_relative 'spec_helper'

describe SetUp do

	before :each do
	@setup = SetUp.new
	@ui = MockUi.new
	end

	it "creates Human Player instance" do
		expect(@setup.human_player).to eq(@setup.human_player)
	end

	it "creates User Interface instance" do
		expect(@setup.ui).to eq(@setup.ui)
	end

	it "creates Board instance" do
		expect(@setup.board).to eq(@setup.board)
	end

	it "creates a Game Piece instance" do
		expect(@setup.game_piece).to eq(@setup.game_piece)
	end

	it "creates Player instance" do
		expect(@setup.player).to eq(@setup.player)
	end
end
