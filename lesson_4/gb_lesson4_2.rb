#2. Моделирование реальности

#Подумайте над любой задачей из реального мира, определите сущность из этой задачи и опишите её с помощью класса. Желательно чтобы в классе было:

#Метод-конструктор initialize  +

#Переменные экземпляра  +

#Способность обращаться к переменным экземпляра за пределами области видимости объекта  +

# Метод to_s который будет переопределять такой же метод из класса Object и представлять ваш объект в строковом виде. Например, вы можете вывести словесное название объекта и его переменные экземпляра  +

# Пара методов, реализующих какое-либо поведение объекта

class Issue
  attr_accessor :name, :description, :priority, :assignee
  attr_reader :status

  def initialize(name:,description:, assignee: "Ivanov", priority: :normal)
  	@name = name
  	@description = description
  	@assignee = assignee
    @priority = priority
    @status = :open
  end

  def to_s
    puts "Name: #{@name}\nDescription: #{@description}\nPriority: #{@priority}\nAssignee: #{@assignee}\nStatus: #{@status}"
  end

  def change_status(value)
  	if @status == (:open) 
	  case @status == (:open) 
	    when value.equal?(:on_hold) || value.equal?(:resolved) || value.equal?(:open)
	      @status = value
	      puts "Status was changed to #{value}"
	    when value == :close
	    	puts "Issue can not be closed, it should be resolved"
        else
	      	puts "Unknown status"
	  end
    elsif @status == :on_hold

	  case @status == :on_hold
	    when value == :open || value == :resolved || value == :on_hold
	      @status = value
	      puts "Status was changed to #{value}"
	    when value == :close
	      puts "Issue can not be closed, it should be resolved"
	    else
	      puts "Unknown status"
	  end
    elsif @status == :resolved
      case @status == :resolved
        when value == :open || value == :resolved || value == :on_hold || value == :close
       	  @status = value
          puts "Status was changed to #{value}"
        else
      	  puts "Unknown status"
      end
    end
  end
end

p issue1 = Issue.new(name: "Server is dead", description: "Server wasn't started after new build")
p issue1.name = "Server is dead?"
p issue1.description = "OMG!"
p issue1.priority = :critical

p issue1.status
issue1.change_status :on_hold
p issue1.status
issue1.change_status :close
p issue1.status
issue1.change_status :resolved
p issue1.status