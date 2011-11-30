When /^I attach a test image$/ do
  file = File.join(Rails.root, 'features', 'fixtures', 'horo.jpeg')
  attach_file 'Image', file
end

Then /^I should see "([^"]*)" photo(|s) in photostream$/ do |number_of_photos, unused|
  all('ul#photos li').count.should == number_of_photos.to_i
end

Then /^the photo with index "([^"]*)" should have title "([^"]*)"$/ do |index, title|
  index = index.to_i
  all('ul#photos li').count.should >= index
  all('ul#photos li')[index-1].find('a')[:title].should == title
end
