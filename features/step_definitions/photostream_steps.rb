Then /^I should be on my photostream page$/ do
  current_path.should == photostream_path
  page.should have_selector('ul#photos')
end

Then /^I should be on sign in page$/ do
  current_path.should == new_user_session_path
end

Then /^I should see a flash with text "([^"]*)"$/ do |text|
  page.should have_content(text)
end

Then /^the photo with title "([^"]*)" should be selected$/ do |title|
  find_link(title)[:class].should include("selected")
end

Then /^the photo with title "([^"]*)" should not be selected$/ do |title|
  find_link(title)[:class].should_not include("selected")
end
