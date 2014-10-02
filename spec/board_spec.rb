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

	it "if answer is invalid key, returns true" do
		@board.invalid_key(invalid_answer)
		expect(@board.invalid_key(invalid_answer)).to be true
	end

	it "places move on board if answer is valid" do
		cells_example = [ [], [], [], [], [], "O", [], [], [] ]
		@board.valid_move(human_answer)
		expect(@board.cells).to eq(cells_example)
	end

	it "places move on board" do
		cells_example = [ [], [], [], [], [], [], [], [], [], "X" ]
		@board.computer_move(computer_answer)
		expect(@board.cells).to eq(cells_example)
	end

	it "checks amount of open spaces" do
		@board.cells = ["X", "X", "O", "X", "O", "O", "O", "O", "X"]
		expect(@board.board_full?).to be true
	end

	it "finds board size" do
		expect(@board.get_board_size).to eq(3.0)
	end

	it "returns boolean" do
		matrix = "X"
		expect(@board.matrix_string?(matrix)).to be true
	end

	it "gets winning player string" do
		matrix = "O"
		expect(@board.get_winning_player(matrix)).to eq("O")
	end

	it "displays diagonals" do
		@board.cells = ["O", [], "X", 
		   			 			  "X", [],  [], 
		   			 			  "X", "O","O"]
		expect(@board.display_diagonals).to eq([ ["O", [], "O"], ["X", [], "X"] ])
	end

	it "displays board row" do
		@board.cells = ["O", [], "X", 
		   			 			  "X", [],  [], 
		   			 			  "X", "O","O"]
		expect(@board.display_row).to eq([ ["O", [], "X"], ["X", [], []], ["X", "O", "O"] ])
	end

	it "displays board column" do
		@board.cells = ["O", [], "X", 
		   			 			  "X", [],  [], 
		   			 			  "X", "O","O"]
		expect(@board.display_column).to eq([ ["O", "X", "X"], [[], [], "O"], ["X", [], "O"] ])
	end
end

