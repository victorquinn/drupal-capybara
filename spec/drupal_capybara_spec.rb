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
    visit "#{site.url}/user"
    login_to_site(site.user, site.password)
    verify_login_worked
  end

  # Note: this is commented out by default on purpose. I wanted to include a
  # sample test, but beyond a login, many tests are specific to your Drupal site
  # setup so I include this but it comes commented so it can be tweaked to fit
  # your site particulars.
  # it "submitting subscribe works" do
  #   10.times do |i|
  #     start = Time.now
  #     visit site.url
  #     submit_subscribe_form
  #     page.should have_content("Thanks for your interest")
  #     p Time.now - start
  #   end
  # end
end
