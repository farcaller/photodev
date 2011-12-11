When /^I attach a test image$/ do
  steps %Q{When I attach "horo.jpeg" to upload field named "Image"}
end

Then /^the photo with index "([^"]*)" should have title "([^"]*)"$/ do |index, title|
  index = index.to_i
  all('ul#photos li').count.should >= index
  all('ul#photos li')[index-1].find('a')[:title].should == title
end

Given /^I upload a test photo with title "([^"]*)"$/ do |title|
  steps %Q{
    When I click on link "Photostream"
    And I click on link "Upload Photo"
    And I attach a test image
    And I fill in "Title" with "#{title}"
    And I click on button "Upload Photo"
  }
end

When /^I attach a random data$/ do
  steps %Q{When I attach "random.data" to upload field named "Image"}
end

Then /^I should be on upload photo page$/ do
  current_path.should == photos_path
end