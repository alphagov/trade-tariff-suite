Given /^I might need authorising$/ do
  if ENV["AUTH_USERNAME"] && ENV["AUTH_PASSWORD"]
    name = ENV["AUTH_USERNAME"]
    password = ENV["AUTH_PASSWORD"]

    # REVIEW: This is quite tightly coupled to mechanize
    page.driver.browser.agent.add_auth(base_url, name, password)
  end
end

When /^I visit "(.*?)"$/ do |relative_url|
  # nginx rate-limiting seems to kick in if we test the service too aggressively?
  sleep 0.1
  visit "#{base_url}#{relative_url}"
end

Then /^I should see "(.*?)"$/ do |content|
  page.body.include?(content).should == true
end

Then /^I should not see "(.*?)"$/ do |content|
  page.body.include?(content).should == false
end

Then /^I should see a selector like "(.*?)"$/ do |selector|
  page.has_selector?(selector).should == true
end

Then /^I should see a measure for a country:$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |row|
    selector = "tr.#{row['code']}"
    measure = page.all(selector)
    measure.size.should be > 0
    measure.map(&:text)[0].should =~ Regexp.new(Regexp.escape(row['type']))
  end
end