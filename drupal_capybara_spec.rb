require 'rspec'
require 'capybara'
require 'capybara/dsl'
require 'spec_helper.rb'
require 'config.rb'

Capybara.default_driver = :selenium
Capybara.app_host = :app_host

describe "Searching for a search box" do
  it "allows searching for words" do
  end
end
