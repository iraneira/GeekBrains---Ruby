class Point

  attr_accessor :x, :y
  include Comparable

  def initialize x:, y:
    @x = x
    @y = y
  end

  def to_s
    "Point: (#{@x}; #{@y})"
  end
  
  
end

a = Point.new x: 5, y: 25
b = Point.new x: -5, y: -25


class Rectangle

  def initialize start_point, end_point
    @start_point = start_point
    @end_point   = end_point
  end

  def area
    return ((@start_point.x - @end_point.x).abs)*((@start_point.y - @end_point.y).abs)
  end

  def perimeter
  	p = ((@start_point.x - @end_point.x).abs*2)+((@start_point.y - @end_point.y).abs*2)
    return p
  end

end

ground = Rectangle.new(Point.new(x: -3, y: 1), Point.new(x: -2, y: -2))

p ground.area
p ground.perimeter

