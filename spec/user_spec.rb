require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'Twitter User' do
  describe 'with a username' do
    before(:each) do
      @user = User.new
      @user.twitter_username = 'logosity'
    end

    it 'provides the last five tweets from twitter' do
      tweets = [
        { :text => 'tweet1' },
        { :text => 'tweet2' },
        { :text => 'tweet3' },
        { :text => 'tweet4' },
        { :text => 'tweet5' }
      ]

      mock_client = double('client')
      mock_client.should receive(:search)
                           .with('from:logosity', {:result_type => :recent })
                           .and_return(mock_client)
      mock_client.should receive(:take).with(5).and_return(tweets)

      Twitter::REST::Client.should_receive(:new).and_return(mock_client)

      expect(@user.last_five_tweets).to eq %w{tweet1 tweet2 tweet3 tweet4 tweet5 }
    end
  end
end
