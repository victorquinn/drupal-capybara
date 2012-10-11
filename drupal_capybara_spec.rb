require 'rspec'
require 'capybara'
require 'capybara/dsl'
require 'spec_helper.rb'

Capybara.default_driver = :selenium
Capybara.app_host = "http://www.google.com"
