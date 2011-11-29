Then /^I should be on the page for collection titled "([^"]*)"$/ do |title|
  find('h1').text.should == title + ' Collection'
end
