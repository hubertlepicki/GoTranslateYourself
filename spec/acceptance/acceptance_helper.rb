require File.dirname(__FILE__) + "/../spec_helper"
require "steak"
require 'capybara/rails'

Capybara.default_driver = :selenium

RSpec.configure do |config|
  config.include Capybara
end

RSpec.configuration.include Capybara, :type => :acceptance

# Put your acceptance spec helpers inside /spec/acceptance/support
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

def autoconfirm
  page.evaluate_script("window.alert = function(msg) { return true; }")
  page.evaluate_script("window.confirm = function(msg) { return true; }")
end

def sign_in_as_admin
  Admin.create! admin_attributes(:email => "a@b.com", :password => "testtest")
  visit "/admins/sign_in"
  fill_in "Email", :with => "a@b.com"
  fill_in "Password", :with => "testtest"
  click_button "Sign in"
end

def sign_in_as_superadmin
  admin = Admin.create! admin_attributes(:email => "super@super.com", :password => "super")
  admin.superadmin = true
  admin.save!
  visit "/admins/sign_in"
  fill_in "Email", :with => "super@super.com"
  fill_in "Password", :with => "super"
  click_button "Sign in"
end

