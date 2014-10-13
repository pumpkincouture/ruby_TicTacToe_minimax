require './lib/game_runner'
require './lib/board'
require './lib/computer_player'
require './lib/human_player'
require './lib/user_interface'
require './lib/intel_computer_player'
require './lib/set_up'

setup = SetUp.new

setup.create_instances

new_game = GameRunner.new(setup.choose_board(setup.get_board_choice), setup.choose_player(setup.get_player_choice), setup.create_human_player(setup.get_game_piece(setup.prompt_for_game_piece)), setup.ui)

new_game.play!
