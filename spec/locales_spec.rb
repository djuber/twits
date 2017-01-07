require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'locales'

describe Locales do

  describe Locales::Locale do
    let(:locale) { Locales::Locale.new(/\d{5}/) }

    it "parses postal codes with a regex" do
      locale.parse_postal_code('10121').should == '10121'
    end

    it "returns nil if a postal code cannot be parsed" do
      locale.parse_postal_code('abcde').should be_nil 
    end
  end

  it "Uses US Locale by default" do
    Locales.current.should == Locales::UNITED_STATES
  end

  it "can parse 5 digit zip codes" do
    Locales.current.parse_postal_code('zip is 12345').should == '12345'
  end

  it "allows the locale to be changed" do
    Locales.current = Locales::UNITED_KINGDOM
    Locales.current.should == Locales::UNITED_KINGDOM
  end
end
