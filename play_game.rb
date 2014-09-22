require './lib/game'
require './lib/board'
require './lib/computer_player'
require './lib/human_player'
require './lib/user_interface'
require './lib/intel_computer_player'
require './lib/set_up'

setup = SetUp.new

setup.create_instances

setup.choose_board

setup.choose_player

new_game = Game.new(setup.player, setup.human_player, setup.ui, setup.board)

# p new_game.board

new_game.play!