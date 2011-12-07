Then /^I should be on the page for collection titled "([^"]*)"$/ do |title|
  find('h1').text.should == title + ' Collection'
end

When /^I create a (private|public) collection named "([^"]*)"(| and store its path)$/ do |privacy, name, store_path|
  steps %Q{
    When I click on link "Collections"
    And I click on link "New collection"
    And I fill in "Title" with "#{name}"
  }
  if privacy == 'private'
    steps 'And I choose "Allow access only to you"'
  else
    steps 'And I choose "Allow access by anonymous users"'
  end
  steps %Q{
    And I click on button "Create Collection"
  }
  if store_path.length > 0
    @current_collection_path = current_path
  end
end

When /^I navigate to stored collection path$/ do
  visit @current_collection_path
end

Then /^I should see (\d+) collections$/ do |number_of_collections|
  all('ul#collections li').count.should == number_of_collections.to_i+1
end

Then /^I shoud see a collection named "([^"]*)"$/ do |name|
  all('ul#collections li').map {|t| t.has_content?(name) ? t : nil}.compact[0].should_not be_nil
end

When /^I add photo named "([^"]*)" to collection "([^"]*)"$/ do |photo, collection|
  steps %Q{
    When I click on link "Photostream"
    And I click on link "Manage Photos"
    And I click on link "#{photo}"
    And I click on link "#{collection}"
  }
end

Then /^I should see a link "([^"]*)"$/ do |link_name|
  find_link(link_name).should_not be_nil
end

