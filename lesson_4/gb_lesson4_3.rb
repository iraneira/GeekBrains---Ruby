# Добавьте метод similar_quarter? для проверки того, лежат ли обе точки в одной четверти координатной плоскости. Метод должен возвращать true или false

# Метод проверяющий лежит ли точка в начале координат

# Метод, устанавливающий точку в начало координат

# Метод + для сложения двух объектов класса Point
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
  
  def similar_quarter?(point)  
    if self.fourth1?(point) || self.fourth2?(point) || self.fourth3?(point) || self.fourth4?(point)
    	return true
    else
    	return false
    end
  end

  def fourth1?(point)
  	if @x > 0 && point.x > 0 && @y > 0 && point.y > 0
  		return true
  	else
  		return false
  	end
  end

  def fourth2?(point)
  	if @x > 0 && point.x > 0 && @y < 0 && point.y < 0
  		return true
  	else
  		return false
  	end
  end

  def fourth3?(point)
  	if @x < 0 && point.x < 0 && @y < 0 && point.y < 0
  		return true
  	else
  		return false
  	end
  end

  def fourth4?(point)
  	if @x < 0 && point.x < 0 && @y > 0 && point.y > 0
  		return true
  	else
  		return false
  	end
  end

  def origin?
  	if @x == 0 && @y == 0
  		return true
  	else
  		return false
  	end
  end

  def origin
  	@x = 0
  	@y = 0
  end

  def +(point)
  	@x = @x + point.x
  	@y = @y + point.y
  end
end

a = Point.new x: 5, y: 25
b = Point.new x: -5, y: -25
p a.similar_quarter?(b)
p a.to_s
p a.origin?
a.origin
p a.origin?
p a.to_s
a + b
p a.to_s

