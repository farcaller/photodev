When /^I register with username "([^"]*)" and email "([^"]*)"$/ do |username, email|
  steps %Q{
    When I click on link "Sign up"
    And I fill in "Username" with "#{username}"
    And I fill in "Email" with "#{email}"
    And I fill in "Password" with "123456"
    And I fill in "Confirm Password" with "123456"
    And I click on button "Sign up"
  }
end

Then /^I should be redirected to index page$/ do
  current_path.should == root_path
end

Then /^I should see account menu for "([^"]*)"$/ do |email|
  page.find('a.dropdown-toggle').should have_content(email)
end

Then /^I should see a flash message stating that registration is successful$/ do
  page.should have_content('You have signed up successfully')
end

Given /^there is user "([^"]*)" registered with email "([^"]*)"$/ do |username, email|
  User.create!(:username => username, :email => email, :password => 'helloworld', :password_confirmation => 'helloworld')
end

Then /^I should see registration error$/ do
  current_path.should == user_registration_path
  page.should have_content('has already been taken')
end

When /^I sign in with "([^"]*)" and password "([^"]*)"$/ do |username, password|
  steps %Q{
    When I click on link "Sign in"
    And I fill in "Username or email" with "#{username}"
    And I fill in "Password" with "#{password}"
    And I click on button "Sign in"
  }
end

Then /^I should see a flash message stating that login is successful$/ do
  page.should have_content('Signed in successfully')
end

Given /^there is no user "([^"]*)" registered$/ do |arg1|
end

Then /^I should see login error$/ do
  current_path.should == new_user_session_path
  page.should have_content('Invalid email or password')
end

Given /^I am logged in as "([^"]*)" and password "([^"]*)"$/ do |username, password|
  steps %Q{
    Given there is user "#{username}" registered with email "test#{Random.rand(1000)}@user.net"
    And I sign in with "#{username}" and password "#{password}"
  }
end

Then /^I should see a flash message stating that logout is successful$/ do
  current_path.should == root_path
  page.should have_content('Signed out successfully')
end

When /^I sign out$/ do
  steps 'When I click on link "Sign out"'
end
