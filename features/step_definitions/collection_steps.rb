Then /^I should be on the page for collection titled "([^"]*)"$/ do |title|
  current_path.should == collection_path
end
