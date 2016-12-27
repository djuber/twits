require 'login_error'

class User
  attr_accessor :twitter_username

  def last_five_tweets
    if twitter_username
      [1,2,3,4,5]     
    else
      raise LoginError.new("user name not set")
    end
    
  end
end

