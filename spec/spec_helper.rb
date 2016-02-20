ENV['RACK_ENV'] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../app.rb")
require 'simplecov'
require 'factory_girl'

SimpleCov.start do
  add_filter '/support/'
end

RSpec.configure do |config|

  # wrap each test in a transaction, so one doesn't mess up another one
  config.around do |example|
    ActiveRecord::Base.transaction do
      example.run
      raise ActiveRecord::Rollback
    end
  end

  # Ability to filter tests
  config.alias_example_to :fit, focused: true
  config.filter_run focused: true
  config.run_all_when_everything_filtered = true

  # Run tests randomly, so they're order independent
  config.order = :random

  # Factory Girl
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    FactoryGirl.find_definitions
  end

end
