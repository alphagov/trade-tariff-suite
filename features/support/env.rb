require 'capybara/cucumber'
require 'capybara/mechanize'

def target_platform
  ENV["TARGET_PLATFORM"] || "preview"
end

def base_url
  if ENV["BASE_URL"]
    ENV["BASE_URL"]
  elsif target_platform == "production"
    "https://www.gov.uk"
  else
    "https://www.#{target_platform}.alphagov.co.uk"
  end
end

def api_url
  ENV["API_URL"]

end

def demo_api_url
  ENV["DEMO_API_URL"]
end

Capybara.default_driver = :mechanize
Capybara.app_host       = base_url
