module Elevator
  class Engine

    INITIAL_FLOOR  = 1

    attr_reader   :current_floor
    attr_accessor :floor

    def move
      @floor > @current_floor ? up : down
      set_current_floor!
      # if floor > @current_floor
      #   up(floor)
      # else
      #   down(floor)
      # end
      # set_current_floor!(floor)
    end

    private

    def initialize
      @current_floor = INITIAL_FLOOR
    end

    def up
      puts "Moving up..."
      @current_floor.upto(@floor) do |i|
        puts "#{i} floor"
      end
    end

    def down
      puts "Moving down..."
      @current_floor.downto(@floor) do |i|
        puts "#{i} floor"
      end
    end

    def set_current_floor!
      @current_floor = @floor
    end

  end
end

# engine = Elevator::Engine.new
#
# engine.floor = 5
# engine.move
# engine.floor = 9
# engine.move
# engine.floor = -100
# engine.move
