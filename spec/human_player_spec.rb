require_relative 'spec_helper.rb'

describe HumanPlayer do
	
  before :each do
  	@ui = MockUi.new
    @human_player = HumanPlayer.new
  end
	
	it "allows the player to choose a move" do
		@human_player.user_turn(@ui)
		expect(@human_player.user_turn(@ui)).to be_empty
	end
end