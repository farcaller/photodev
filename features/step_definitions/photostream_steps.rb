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
