module CalculateYears
  require 'date'
  def years_old
    p Time.now.year - Date.parse(self.first_date).year
  end
  
  private
  
  def first_date
  	if self.class == User
  		date_of_birth
  	elsif self.class == Winery
  		date_of_foundation
  	else
  		puts "Undefined class."
  	end
  end
end

class User
  include CalculateYears
  attr_accessor :date_of_birth
  def initialize name, date_of_birth
  	@name = name
  	@date_of_birth = date_of_birth
  end
end

class Winery
  include CalculateYears
  attr_accessor :date_of_foundation
  def initialize title, date_of_foundation
  	@title = title
  	@date_of_foundation = date_of_foundation
  end
end

User.new('Julie', '1996-07-22').years_old # => 19
Winery.new('A Light Drop', '1954-08-01').years_old # => 61