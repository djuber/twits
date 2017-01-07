require 'login_error'
require 'twitter'

# this defines the access tokey and consumer key needed for twitter.client
require_relative('/etc/twitter.config')


class User
  attr_accessor :twitter_username
  attr_accessor :address_text
  
  def client
    @client || new_client
  end

  def new_client
    config = {
      consumer_key:    TWITTER_CONSUMER_KEY,
      consumer_secret: TWITTER_CONSUMER_SECRET,
      access_token: TWITTER_ACCESS_TOKEN,
      access_token_secret: TWITTER_ACCESS_TOKEN_SECRET
    }
    client = Twitter::REST::Client.new(config)
  end

  def last_five_tweets
    return client.search("from:#{ @twitter_username }", result_type: :recent).take(5).map do |tweet|
      tweet[:text]
    end
  end

  def zip_code
    Locales.current.parse_postal_code(address_text)
  end

  def nearby_followers(user)
    return [] unless user.zip_code
  end
end
