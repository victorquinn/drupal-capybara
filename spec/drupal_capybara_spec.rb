require 'rspec'
require 'capybara'
require 'capybara/dsl'
require 'capybara/webkit'
require 'spec_helper.rb'
require 'yaml'

Capybara.default_driver = :webkit
Capybara.javascript_driver = :webkit

describe "DrupalTest" do
  class DrupalSiteObject < Struct.new(:url, :user, :password); end

  let(:site) do
    # First load the config file and all its attributes
    yaml = YAML::load(File.open('config.yaml'))
    DrupalSiteObject.new(yaml['site'], yaml['user'], yaml['password'])
  end

  it "page can be hit" do
    visit site.url
  end

  it "login works" do
    login_to_site(site.url, site.user, site.password)
    verify_login_worked
  end
end
