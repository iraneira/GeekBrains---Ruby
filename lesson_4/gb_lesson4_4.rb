
class Point

  attr_accessor :x, :y
include Comparable

  def initialize x:, y:
    @x = x
    @y = y
  end

  def <=> other_point
    if self.class != Point || other_point.class != Point
      return nil
    end
    case self.class == Point
      when Math.sqrt(@x**2 + @y**2) < Math.sqrt(other_point.x**2 + other_point.y**2)
        return 1
      when Math.sqrt(@x**2 + @y**2) > Math.sqrt(other_point.x**2 + other_point.y**2)
        return -1
      when Math.sqrt(@x**2 + @y**2) == Math.sqrt(other_point.x**2 + other_point.y**2)
        return 0
    end
  end

end

a = Point.new x: 5, y: 25
b = Point.new x: -5, y: 125
c = 0
p a<=>b
p a<=>c
