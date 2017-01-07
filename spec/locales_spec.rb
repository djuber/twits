require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'locales'

describe Locales do

  describe Locales::Locale do
    let(:locale) { Locales::Locale.new(/\d{5}/) }

    it "parses postal codes with a regex" do
      expect(locale.parse_postal_code('10121')).to eq '10121'
    end

    it "returns nil if a postal code cannot be parsed" do
      expect(locale.parse_postal_code('abcde')).to be_nil 
    end
  end

  it "Uses US Locale by default" do
    expect(Locales.current).to eq Locales::UNITED_STATES
  end

  it "can parse 5 digit zip codes" do
    expect(Locales.current.parse_postal_code('zip is 12345')).to eq '12345'
  end

  it "allows the locale to be changed" do
    Locales.current = Locales::UNITED_KINGDOM
    expect(Locales.current).to eq Locales::UNITED_KINGDOM
  end
end
