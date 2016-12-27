require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'Twitter User' do
  describe 'with a username' do
    before(:each) do
      @user = User.new
      @user.twitter_username = 'logosity'
    end

    it 'provides the last five tweets from twitter' do
      expect(@user.last_five_tweets).to have(5).tweets
    end

    it 'should not provide tweets if it does not have a twitter username' do
      @user .twitter_username = nil
      expect { @user.last_five_tweets }.to raise_error(LoginError)
    end
  end
end
