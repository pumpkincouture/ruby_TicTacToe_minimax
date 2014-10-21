require './lib/game_runner'
require './lib/set_up'

setup = SetUp.new

setup.create_instances

setup.set_up_game

new_game = GameRunner.new(setup.board, setup.player, setup.human_player, setup.ui)

new_game.play!
