require_relative 'spec_helper.rb'

describe HumanPlayer do
  let(:human_answer) { "5" }

  before :each do
  	@ui = MockUi.new
    @human_player = HumanPlayer.new
  end
	
	it "allows the player to choose a move" do
		@human_player.user_turn(@ui)
		expect(@human_player.user_turn(@ui)).to be_empty
	end

	it "returns the human move" do
		@@human_answer = "5"
		expect(@human_player.answer).to eq(human_answer)
	end
end