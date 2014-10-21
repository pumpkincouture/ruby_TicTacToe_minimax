require_relative 'spec_helper'

describe HumanPlayer do
	
  before :each do
  	@ui = MockUi.new
    @game_piece = "$"
    @human_player = HumanPlayer.new(@game_piece)
  end

  it "identifies human game piece" do
  	expect(@human_player.game_piece).to eq("$")
  end
end