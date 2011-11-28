When /^I attach a test image$/ do
  file = File.join(Rails.root, 'features', 'fixtures', 'horo.jpeg')
  attach_file 'Image', file
end

Then /^I should see "([^"]*)" photo(|s) in photostream$/ do |number_of_photos, unused|
  all('ul#photos li').count.should == number_of_photos.to_i+1
end