require 'rspec'
require 'capybara'
require 'capybara/dsl'
require 'capybara/webkit'
require 'spec_helper.rb'
#require 'test_helper.rb'
require 'yaml'

# First load the config file and all its attributes
yaml = YAML::load(File.expand_path("../config.yaml"))
site = yaml['site']

Capybara.default_driver = :webkit
Capybara.javascript_driver = :webkit
Capybara.app_host = site

describe "Testing VictorQuinn.com" do
  it "page can be hit" do
    visit "http://victorquinn.com"
    page.should have_content("Victor")
  end
end
