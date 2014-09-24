require '../lib/game.rb'
require '../lib/board.rb'
require '../lib/computer_player.rb'
require'../lib/human_player.rb'
require '../lib/user_interface.rb'
require '../lib/set_up.rb'
require '../lib/intel_computer_player.rb'
require_relative 'mock_ui'
require_relative 'mock_human'
require_relative 'mock_board'
require_relative 'mock_player'

RSpec.configure do |config|
  config.failure_color = :red
  config.success_color = :green
  config.detail_color = :yellow
  config.tty = true
  config.color = true
  config.formatter = :documentation
end