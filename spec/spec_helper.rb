require 'drupal_test_helper.rb'

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include DrupalTestHelper
end
