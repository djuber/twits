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
      allow(mock_client).to receive(:search)
                              .with('from:logosity', {:result_type => :recent })
                              .and_return(mock_client)
      allow(mock_client).to receive(:take).with(5).and_return(tweets)

      expect(Twitter::REST::Client).to receive(:new).and_return(mock_client)

      expect(@user.last_five_tweets).to eq %w{tweet1 tweet2 tweet3 tweet4 tweet5 }
    end
  end

  
  it "should allow addresses with no zip code" do
    user = User.new 
    user.address_text = 'P.O. BOX 7122 Chicago, IL'
    user.zip_code
  end
 
  it "should treat missing zip codes as nil" do
    user = User.new 
    user.address_text = 'P.O. BOX 7122 Chicago, IL'
    expect(user.zip_code).to be nil
  end

  it 'uses the current locale to parse zip codes' do
    Locales.current = Locales::UNITED_KINGDOM
    user = User.new
    user.address_text = '51-55 Gresham Street, 6th Floor London, England EC2V 7HQ'
    expect(user.zip_code).to eq 'EC2V 7HQ'
  end
end
