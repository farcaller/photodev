Feature: Users signs out from site

  As a previously registered and logged in user
  I want to log out from site
  
  Background: User is on site
    Given I navigate to index page
    And I am logged in as "testuser" and password "helloworld"
  
  Scenario: successfully log out
    When I click on link "Sign out"
    Then I should see a flash message stating that logout is successful
