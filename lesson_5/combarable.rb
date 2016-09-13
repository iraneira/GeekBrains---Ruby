class Fruits

  include Comparable

  attr_reader :name

  ITEMS = %w{
    orange
    apple
    banana
  }

  def initialize name
    @name = name
  end

  def <=> other_fruit
    return nil unless other_fruit.is_a? Fruits
    if ITEMS.index(@name) < ITEMS.index(other_fruit.name)
      1
    elsif ITEMS.index(@name) > ITEMS.index(other_fruit.name)
      -1
    else
      0
    end
  end

end

orange  = Fruits.new 'orange'
orange2 = Fruits.new 'orange'
apple   = Fruits.new 'apple'

puts orange > apple
