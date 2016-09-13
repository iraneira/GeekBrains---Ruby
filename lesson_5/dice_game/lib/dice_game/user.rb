class User
  attr_accessor :score, :credits, :total_credits, :name, :gain
  def initialize name, total_credits
  	@name = name
  	@total_credits = total_credits
    @score = 0
    @credits = 0
    @gain = 0
  end

  def bet score:, credits:
    @score = score
    @credits = credits
  end
end
