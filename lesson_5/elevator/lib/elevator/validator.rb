module Elevator
  module Validator

    MAX_WEIGHT  = 450
    FLOOR_RANGE = 1..25

    attr_reader :error

    def valid? *args
      clear_error!

      args.each do |validator_name|
        send "check_#{validator_name}!"
      end

      @error.nil? ? true : false
    end

    private

    def clear_error!
      @error = nil
    end

    def check_floor_range!
      @error = "The floor should be an Integer number between #{FLOOR_RANGE.first} and #{FLOOR_RANGE.last}" unless @engine.floor.instance_of?(Fixnum) && FLOOR_RANGE === @engine.floor
    end

    def check_floor_current!
      @error = "You are already on the #{@engine.floor} floor. Choose another floor or get out!" if @engine.current_floor == @engine.floor
    end

    def check_weight!
      @error = "Current weight (#{@weight} kg) is more than allowed (#{MAX_WEIGHT}) kg. You will stay at the current floor, sorry." unless allowed_weight?
    end

    def allowed_weight?
      @weight <= MAX_WEIGHT
    end

  end
end
