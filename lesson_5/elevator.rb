# Using OOP for modelling housing elevator

# Валидации данных
#   1. Проверка диапазона этажей
#   2. Вес
#   3. Проверка того что мы не едем на текущий этаж

class Elevator

  INITIAL_FLOOR  = 1
  INITIAL_WEIGHT = 0
  MAX_WEIGHT     = 400
  FLOOR_RANGE    = 1..25

  def initialize
    @current_floor = INITIAL_FLOOR
    @weight        = INITIAL_WEIGHT
  end

#   def floor_range
#     FLOOR_RANGE
#   end

  def move floor
    return puts("The floor should be an Integer number between #{FLOOR_RANGE.first} and #{FLOOR_RANGE.last}") unless Fixnum === floor && FLOOR_RANGE.include?(floor)
    # return puts("The floor should be an Integer number between #{FLOOR_RANGE.first} and #{FLOOR_RANGE.last}") if correct_floor?

    return puts("Current weight (#{@weight} kg) is more than allowed (#{MAX_WEIGHT}) kg. You will stay at the current floor, sorry.") unless allowed_weight?

    return puts("You are already on the #{floor} floor. Choose another floor or get out!") if current_floor? floor

    if floor > @current_floor
      up(floor)
    else
      down(floor)
    end

    set_current_floor!(floor)

    puts "Stop. You are on the #{@current_floor} floor"
  end

  def load! weight
    @weight += weight
  end

  def release! weight
    @weight -= weight
  end

  def to_s
    "Elevator with load #{@weight} kg on the #{@current_floor} floor."
  end

  private

  def allowed_weight?
    @weight <= MAX_WEIGHT
  end

  def current_floor? floor
    @current_floor == floor
  end

  def up floor
    puts "Moving up..."
    @current_floor.upto(floor) do |i|
      puts "#{i} floor"
    end
  end

  def down floor
    puts "Moving down..."
    @current_floor.downto(floor) do |i|
      puts "#{i} floor"
    end
  end

  def set_current_floor! floor
    @current_floor = floor
  end

end


# p Elevator::INITIAL_FLOOR
elevator = Elevator.new
# # # p elevator.floor_range
#
# elevator.move 5
elevator.set_current_floor!(10)
puts elevator

# # elevator.set_current_floor!
#
#
# elevator.load! 40
# elevator.load! 140
# elevator.load! 100
# elevator.load! 130
# elevator.release! 100
# elevator.move 5
# elevator.move 2
# elevator.set_current_floor! 190
