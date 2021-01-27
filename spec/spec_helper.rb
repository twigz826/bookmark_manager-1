# frozen_string_literal: true

ENV['ENVIRONMENT'] = 'test'

require 'capybara'
require 'capybara/rspec'
require 'clear_test_database'
require 'features/web_helpers'
require 'simplecov'
require 'simplecov-console'

require File.join(File.dirname(__FILE__), '..', 'app.rb')
Capybara.app = BookmarkManager

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console
])
SimpleCov.start

RSpec.configure do |config|
  config.before(:each) do
    clear_test_database
  end
  config.after(:suite) do
    clear_test_database
    config.expect_with :rspec do |expectations|
      expectations.include_chain_clauses_in_custom_matcher_descriptions = true
    end
    config.mock_with :rspec do |mocks|
      mocks.verify_partial_doubles = true
    end
    config.shared_context_metadata_behavior = :apply_to_host_groups
  end
end
