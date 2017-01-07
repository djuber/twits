# require simplecov before loading any code
require 'simplecov'

module SimpleCov::Configuration
  def clean_filters
    @filters = []
  end
end

SimpleCov.configure do
  clean_filters
  load_adapter 'test_frameworks'
end

# to get coverage, run ```COVERAGE=true rspec```
ENV["COVERAGE"] && SimpleCov.start do
  add_filter "/.rvm/"
  puts 'simplecov started'
end
# simplecov loaded, run real application

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rspec'
require 'rspec/collection_matchers'
require 'rspec/mocks'


require 'twits'
require 'user'
require 'locales'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
end
