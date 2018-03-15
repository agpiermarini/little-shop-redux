require 'simplecov'
require 'bundler'
SimpleCov.start

ENV["RACK_ENV"] ||= "test"

Bundler.require(:default, :test)
require File.expand_path("../../config/environment", __FILE__)
require 'rspec'
require 'capybara/dsl'
require 'rack/test'
require 'sinatra'

Capybara.app = LittleShopApp
Capybara.save_path = 'tmp/capybara'

RSpec.configure do |c|
  c.include Capybara::DSL
  c.include Rack::Test::Methods
end

DatabaseCleaner.strategy = :truncation

RSpec.configure do |c|
  c.before(:all) do
    DatabaseCleaner.clean
  end

  c.after(:each) do
    DatabaseCleaner.clean
  end
end

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end
