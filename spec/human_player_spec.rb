require_relative 'spec_helper.rb'

describe HumanPlayer do
	
  before :each do
  	@ui = MockUi.new
    @human_player = HumanPlayer.new(@game_piece)
  end

  it "identifies human game piece" do
  	expect(@human_player.game_piece).to eq("O")
  end
	
	it "allows the player to choose a move" do
		@human_player.user_turn(@ui)
		expect(@human_player.user_turn(@ui)).to be_empty
	end
end