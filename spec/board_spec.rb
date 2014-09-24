require_relative 'spec_helper.rb'

describe Board do
  let (:computer_answer) { 9 }
  let (:human_answer) { "6" }
  let (:invalid_answer) { " " }
  let (:board_choice) { 3 }

  before :each do
  	@ui = MockUi.new
    @board = Board.new(@ui, board_choice )
  end

	it "creates a cells instance variable" do
		cells_instance = [[], [], [], [], [], [], [], [], []]
	  expect(@board.cells).to eq(cells_instance)
	end

	it "instance variable should not contain numbers" do
	  expect(@board.cells).to_not include('1', '2', '3', '4', '5', '6', '7', '8', '9')
	end

	it "instance variable should not be an array" do
	  expect(@board.cells).to_not match_array([1, 2, 3, 4, 5, 6, 7, 8, 9])
	end

	it "if answer is invalid key, returns true" do
		@board.invalid_key(invalid_answer)
		expect(@board.invalid_key(invalid_answer)).to be true
	end

	it "places move on board if answer is valid" do
		cells_example = [[], [], [], [], [], "O", [], [], []]
		@board.valid_move(human_answer)
		expect(@board.cells).to eq(cells_example)
	end

	it "places move on board" do
		cells_example = [[], [], [], [], [], [], [], [], [], "X"]
		@board.computer_move(computer_answer)
		expect(@board.cells).to eq(cells_example)
	end
end

