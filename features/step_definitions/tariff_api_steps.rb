require 'faraday'
require 'pry'
require 'yajl'
require 'hashdiff'

Given /^I might need API access authorising$/ do
  if ENV["AUTH_USERNAME"] && ENV["AUTH_PASSWORD"]
    name = ENV["AUTH_USERNAME"]
    password = ENV["AUTH_PASSWORD"]

    @connection = Faraday.new
    @connection.basic_auth(name, password)
  end
end

When /^I fetch API show response for (\d+) on live system$/ do |commodity_code|
  @api_responses ||= []

  live_url = ENV["LIVE_HOST"] || 'http://tariff-api.dev.gov.uk/commodities/%{commodity_code}'

  response = @connection.get(live_url % { commodity_code: commodity_code })

  @api_responses << response.body
end

When /^I fetch API show response for (\d+) on demo system$/ do |commodity_code|
  @api_responses ||= []

  demo_url = ENV["DEMO_HOST"] || 'http://localhost:3018/commodities/%{commodity_code}'

  response = @connection.get(demo_url % { commodity_code: commodity_code })

  @api_responses << response.body
end

Then /^These reponses should be identical$/ do
  r1 = Yajl::Parser.parse(@api_responses.first)
  r2 = Yajl::Parser.parse(@api_responses.last)
  diff = HashDiff.diff(r1, r2)

  # @api_responses.uniq.size.should eq 1
end
