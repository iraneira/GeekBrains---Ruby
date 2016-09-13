
require_relative 'validator'

module DiceGame
  class Dice
  	include DiceGame
    include Validator
    
    def initialize count_of_dices = 2, count_of_faces = 2, coefficient_of_win = 0.25, users
      @count_of_dices = count_of_dices
      @count_of_faces = count_of_faces
      @fortune = 0
      @users = users
      @coefficient_of_win = coefficient_of_win

    end

    def pass_dice
        for i in (1..@count_of_dices) 
	      @fortune+=sample_dice
	      i.next
	    end  
    end

    def sample_dice
      (1..@count_of_faces).to_a.sample
    end
  end
end