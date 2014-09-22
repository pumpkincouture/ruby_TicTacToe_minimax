require_relative 'spec_helper.rb'

describe Board do
  let (:computer_answer) { "9" }
  let (:human_answer) { "6" }
  let (:invalid_answer) { " " }

  before :each do
  	@ui = MockUi.new
    @board = Board.new(@ui)
  end

	it "creates a cells instance variable" do
		cells_instance = {"1" => "1", "2" => "2", "3" => "3", "4" => "4", "5" => "5", "6" => "6", "7" => "7", "8" => "8", "9" => "9"}
	  expect(@board.cells).to eq(cells_instance)
	end

	it "instance variable should contain numbers" do
	  expect(@board.cells).to include('1', '2', '3', '4', '5', '6', '7', '8', '9')
	end

	it "instance variable should not be an array" do
	  expect(@board.cells).to_not match_array([1, 2, 3, 4, 5, 6, 7, 8, 9])
	end

	it "if answer is invalid key, returns true" do
		@board.invalid_key(invalid_answer)
		expect(@board.invalid_key(invalid_answer)).to be true
	end

	it "places move on board if answer is valid" do
		cells_example = {"1" => "1", "2" => "2", "3" => "3", "4" => "4", "5" => "5", "6" => "O", "7" => "7", "8" => "8", "9" => "9"}
		@board.valid_move(human_answer)
		expect(@board.cells).to eq(cells_example)
	end

	it "places move on board" do
		cells_example = {"1" => "1", "2" => "2", "3" => "3", "4" => "4", "5" => "5", "6" => "6", "7" => "7", "8" => "8", "9" => "X"}
		@board.computer_move(computer_answer)
		expect(@board.cells).to eq(cells_example)
	end
end

