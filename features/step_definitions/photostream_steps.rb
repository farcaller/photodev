Then /^I should be on my photostream page$/ do
  current_path.should == photostream_path
  page.should have_selector('ul#photos')
end

Then /^I should see (\d+) photo(|s) in (photostream|collection)$/ do |number_of_photos, unused1, unused2|
  all('ul#photos li').count.should == number_of_photos.to_i
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

Then /^I should see a link for collection named "([^"]*)"$/ do |title|
  all(:xpath, "//div[@id='collections']/a[@title='#{title}']").length.should == 1
end