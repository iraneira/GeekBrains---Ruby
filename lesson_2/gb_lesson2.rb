# coding: utf-8 

# 1. Методы Ruby Core API

# Найдите в документации Ruby по адресу http://ruby-doc.org/core/ методы для объектов разных классов. Поэкспериментируйте с ними в интерактивной оболочке irb

# Для класса Fixnum:

# Метод, возвращающий вещественный результат от деления

# Метод проверяющий, является ли число нечётным

#1.odd? #=> true
#2.odd? #=> false
#-5.odd? #=> true
#0.odd? #=> false

# Для класса Integer:

# Метод, возвращающий Наибольший Общий Делитель 2-х чисел

#100.gcd(1000) #=> 100
#1.gcd(99) #=> 1
#-5.gcd(20) #=> 5
#28.gcd(138) #=> 2

# Метод, позволяющий итерировать от одного числа до другого
#8.upto(10){ |i| print i, " " } #=> 8 9 100.upto(10){ |i| print i, " " } #=> 0 1 2 3 4 5 6 7 8 9 10-5.upto(5){ |i| print i, " " } #=> -5 -4 -3 -2 -1 0 1 2 3 4 55.upto(-5){ |i| print i, " " } #=> "ничего не выводится"

# Метод приведения целого числа к рациональному
#1.to_r #=> 1/1
#154.to_r #=> 154/1

# Для класса Numeric:

#Метод, позволяющий итерировать от данного целого числа с указанием шага итерации и числа верхнего предела итерации
#print 1.step.take(4) #=> [1,2,3,4]
#print 10.step(by: -1).take(4) #=> [10,9,8,7]
#3.step(to: 5) { |i| print i, " " } #=> 3,4,5
#1.step(10, 2) { |i| print i, " " } #=> 1,3,5,7,9
#Math::E.step(to: Math::PI, by: 0.2) { |f| print f, " " } #=> 2.718281828459045 2.9182818284590453 3.118281828459045
#Метод, приводящий данное число к комплексному (мнимому)
#print 10.to_c #=> 10+0i
#print -1.to_c #=> -1+0i
#print 0.to_c #=> 0+0i
#Для класса Float:

#Метод, приводящий вещественное число к строке
#1.2.to_s #=> "1.2"
#1.2.inspect #=> "1.2"
#Для класса Array:

#Метод, возвращающий последний элемент из массива (с его извлечением из массива)
#numbers = (1..15).to_a #=> [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
#numbers.pop  #=> 15
#numbers #=> [1,2,3,4,5,6,7,8,9,10,11,12,13,14]
#numbers.pop(4) #=> [11,12,13,14]
#numbers #=> [1,2,3,4,5,6,7,8,9,10]
#Метод, добавляющий элемент в конец массива
#symbols = ("a".."e").to_a #=> ["a", "b", "c", "d", "e"]
#symbols.push("f") #=> ["a", "b", "c", "d", "e", "f"]
#symbols.push("f", "g", 1, 2, 3) #=> ["a", "b", "c", "d", "e", "f", "f", "g", 1, 2, 3]
#Для класса Hash:

#Метод, возвращающий массив ключей хэша
#h = { "a" => 100, "b" => 200, "c" => 300, "d" => 400 }
#h.keys   #=> ["a", "b", "c", "d"]
#Метод, возвращающий массив значений хэша
#h = { "a" => 100, "b" => 200, "c" => 300 }
#h.values   #=> [100, 200, 300]
#Для класса Range:

#Метод, проверяющий, включено ли последнее значение в диапазон
#(1..5).exclude_end?     #=> false
#(1...5).exclude_end?    #=> true

#2. Условное выражение if-else-end

#Представьте, что у вас есть объект класса Hash:

player = { name: 'johnny', color: :red }
#и переменная colors:

colors = [:blue, :white, :green, :red, :orange, :FFF]
#Напишите код, который будет выбирать случайный цвет из массива colors и сравнивать его с цветом в хэше player.

#Если цвета совпадают — выводите сообщение «Джонни, ты прав!». Если цвета не совпадают, но количество символов из которых они состоят одинаково — выводите: «Джонни, букв столько же, но значение иное!». В остальных случаях — выводите любое другое сообщение.

#Постарайтесь сделать так, чтобы сообщения в выводе не включали явно заданное имя, а брали его из хэша с помощью интерполяции.
class Hash
  def rights(value_color)
  	if self[:color] && self[:name] 
	  	sample_color = value_color.sample
	    if sample_color==self[:color]
	    	p "Цвет #{self[:name].capitalize} - #{self[:color]}"
	    	p "Случайный цвет - #{sample_color}"
			p "#{self[:name].capitalize}, ты прав!"
		elsif sample_color.length == self[:color].length
			p "Цвет #{self[:name].capitalize} - #{self[:color]}"
			p "Случайный цвет - #{sample_color}"
			p "#{self[:name].capitalize}, букв столько же, но значение иное!"
		else
			p "Цвет #{self[:name].capitalize} - #{self[:color]}"
			p "Случайный цвет - #{sample_color}" 
			p "#{self[:name].capitalize}, ты не прав!"
		end
	else
		p "Неверные данные"
	end
  end
end
player.rights(colors)

#Оберните код в метод, можно в несколько.

#3. Итерация с условиями

#У вас есть массив имён, например:

names = %w[ambientsketchbook Erik\ Wollo Brian\ Eno Evangelos\ Papathanassiou Shulman]
#Пробегитесь по ним и выведите только те, длина которых меньше 10 символов и первая буква заглавная. При реализации условий постарайтесь каждое из них обернуть в отдельный метод.
class Array
  def names_shorter(value)
  	right_colors = []
  	for key in self
  		if key.shorter(value) && key.capitalize?
	    	right_colors.push(key)
		end
	end
	p right_colors
  end
end

class String
  def shorter(value)
  	is_shorter = self.length < value
  end
  def capitalize?()
  	is_capitalize = ("A".."Z") === self[0] || ("А".."Я") === self[0]
  end
end

names.names_shorter(12)
#4. Количество символов в элементе массива

#Посчитайте количество символов в каждом элементе массива:

languages_hash = {}
languages = ["Ruby", "Python", "JavaScript", "Java", ".NET", "HTML", "Clojure"]

#Подсказка:

#Используйте метод inject

#Результат выведите на экран в виде хэша:

{"Ruby"=>4, "Python"=>6, "JavaScript"=>10, "Java"=>4, ".NET"=>4, "HTML"=>4, "Clojure"=>7}

p languages.inject({}){ |result, element| languages_hash.merge!(element => element.length) }

#5. Самая удивительная последовательность

#Напишите метод вычисления последовательности Фибоначчи. Попробуйте реализовать алгоритм с помощью цикла и с помощью рекурсии. На следующем занятии мы сравним что работает быстрее.

class Integer
	def fibonachi_cycle
		fibonachi_prev = 0
		fibonachi_value = 1
		fibonachi_result = 0
		for i in (0..self)
			fibonachi_prev = fibonachi_value
			fibonachi_value = fibonachi_result
			fibonachi_result = fibonachi_value + fibonachi_prev
			p fibonachi_value
		end
	end
		
	
end
20.fibonachi_cycle

#6. Продвинутый шифр Цезаря

#Напишите алгоритм rot13, позволяющий кодировать и декодировать текст на английском языке. Например:

cypher = 'Lbh unpxrq n irel frperg zrffntr!'
#rot13(cypher) # => ?

class String
  def code(value)
  	code = self.split(//) 
  	code_array = []
  	for i in code
  		if ("A".."Z") === i || ("a".."z") === i
	  		for z in (0..value-1)
	  			i.succ!
	  		end

	  		if i.length > 1
		  		i = i[1]
		  	end

		end
		code_array.push i

  	end
  	code_array*""
  end
  def decode(value)
  	decode = self.split(//) 
  	decode_array = []
  	for i in decode
  		if ("A".."Z") === i || ("a".."z") === i
	  		for z in (0..26-value-1)
	  			i.succ!
	  		end

	  		if i.length > 1
		  		i = i[1]
		  	end

		end
		decode_array.push i

  	end
  	decode_array*""

  end
end
p cypher = cypher.decode(13)
p cypher = cypher.code(13)