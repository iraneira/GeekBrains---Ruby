require_relative 'engine'
require_relative 'validator'

module Elevator
  class Control

    INITIAL_WEIGHT = 0

    include Validator

    def initialize
      @weight = INITIAL_WEIGHT
      @engine = Engine.new # Composition
      # @validator = Validator.new(:floor_range, :floor_current, :weight)
      # @engine = SuperEngine.new
    end

    def move floor
      @engine.floor = floor

      if valid? :floor_range, :floor_current, :weight
        @engine.move # Delegation
      else
        puts error
      end

      puts "Stop. You are on the #{@current_floor} floor"
    end

    def release! weight
      @weight -= weight
    end

    def load! weight
      @weight += weight
    end

  end
end
