module DiceGame
  module Validator

    attr_reader :error

    def valid? *args
      clear_error!

      args.each do |validator_name|
        send "check_#{validator_name}!"
      end

      @error.nil? ? true : false
    end

    private

    def clear_error!
      @error = nil
    end

    def check_score!
      wrong_users = Array.new
      for user in @users[:users]
        if user.score == 0
          wrong_users.push(user.name)
        end
      end
      puts @error = "Score was not determined for users: #{wrong_users.join(", ")}" if wrong_users != []

    end

    def check_credits!
	  wrong_users = []
	  for user in @users[:users]
	    if user.credits == 0
	      wrong_users.push(user.name)
	    end
	  end
	  puts @error = "Credits was not determined for users: #{wrong_users.join(", ")}" if wrong_users != []

	  for user in @users[:users]
	    if user.credits > user.total_credits
	      wrong_users.push(user.name)
	      puts @error = "Credits #{user.credits} should be smaller then total credits #{user.total_credits} for user #{user.name}"
	    end
	  end

    end

  end
end
