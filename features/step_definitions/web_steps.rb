Given /^I navigate to index page$/ do
  visit root_path
end

When /^I click on link "([^"]*)"$/ do |link|
  click_on link
end

When /^I fill in "([^"]*)" with "([^"]*)"$/ do |field, data|
  fill_in field, :with => data
end

When /^I click on button "([^"]*)"$/ do |button|
  click_button button
end
