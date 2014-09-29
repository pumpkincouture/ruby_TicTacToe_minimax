require_relative 'board.rb'
require_relative 'ttt_constants.rb'

class IntelComputerPlayer
  include TTTConstants
  
  attr_reader :comp_winning_combos
  
end
