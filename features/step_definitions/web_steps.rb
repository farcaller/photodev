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

Then /^I should see an error "([^"]*)" for field "([^"]*)"$/ do |error, field|
  find(:xpath, find_field(field).path + '/../span').should have_content(error)
end

When /^I navigate to "([^"]*)" path$/ do |controller|
  visit send("#{controller.downcase}_path".to_sym)
end

When /^I choose "([^"]*)"$/ do |radio|
  choose radio
end
