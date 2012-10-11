require 'rspec'
require 'capybara'
require 'capybara/dsl'
require 'spec_helper.rb'
require 'yaml'

# First load the config file and all its attributes
yaml = YAML::load(File.expand_path("../config.yaml"))

Capybara.default_driver = :selenium
Capybara.app_host = yaml['app_host']

describe "Searching for a search box" do
  it "allows searching for words" do
    starts = Time.now
    visit "http://www.google.com"
    fill_in('q', :with => 'banana')
    page.should have_content("Banana")
    p Time.now - starts
  end
end
