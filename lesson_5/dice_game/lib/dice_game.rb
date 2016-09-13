require_relative('dice_game/user')
require_relative('dice_game/dice')

module DiceGame
  def self.create(*users)
    Dice.new(users: users)
  end

  def turn
    if valid? :score, :credits
      pass_dice
      result_of_turn
      reset
    end
  end

  def finish 
    puts "Game results:\n"
    for user in @users[:users]
      puts "#{user.name} earns #{user.gain} credits"
    end
  end

  def result_of_turn
    puts "Wheel of fortune throws: #{@fortune}\n"
    for user in @users[:users]
      if user.score == @fortune
        user.gain += user.credits * @coefficient_of_win
        user.total_credits += user.gain
        puts "#{user.name} wins"
        p user.gain
      else
        puts "#{user.name} loses"
        user.gain -= user.credits
        p user.gain
      end
    end
  end
  
  def reset
    for user in @users[:users]
      user.score = 0
      user.credits = 0
    end
    @fortune = 0
  end
end

user1 = User.new('Julie', 500) # => 19
user2 = User.new('Dan', 700) # => 19
user3 = User.new('Bob', 100)
current_game = DiceGame.create(user1, user2, user3)
user1.bet(score: 3, credits: 1000)
current_game.turn
user1.bet(score: 3, credits: 100)
user2.bet(score: 2, credits: 50)
user3.bet(score: 2, credits: 50)
current_game.turn
user1.bet(score: 3, credits: 100)
user2.bet(score: 2, credits: 50)
user3.bet(score: 2, credits: 50)
current_game.turn
user1.bet(score: 3, credits: 100)
user2.bet(score: 2, credits: 50)
user3.bet(score: 2, credits: 50)
current_game.turn
current_game.finish