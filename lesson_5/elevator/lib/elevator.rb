require_relative('elevator/control')
# require '/Users/psylone/school/gb/ruby-rails/lessons/lesson-6/code/elevator/lib/elevator/control.rb'
# require File.expand_path('../elevator/control', __FILE__)
# require File.expand_path('../elevator/control')

# gem 'StopElevator'
#
# module StopElevator
#   class Engine
#   end
# end

# StopElevator::Engine.new
#
# module Elevator
#   class Engine
#
#     def initialize
#     end
#
#   end
# end

# # Elevator.new
# # Engine.new
# ############
#
module Elevator

  VERSION = '1.0.0'

  def self.create
    Control.new
  end

  def self.version
    VERSION
  end

end


# # Elevator::Control.new
#
#
# elevator = Elevator::Control.new
elevator = Elevator.create

elevator.move 7


#
# # elevator = Elevator.create
# # p elevator
# # puts Elevator.version
#
elevator.load! 40
elevator.load! 140
elevator.load! 100
elevator.load! 100
elevator.load! 100


elevator.release! 100
elevator.move 13
# # elevator.move -100
