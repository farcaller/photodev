@working
Feature: User browses photostream
  As a registered user
  I want to see my photostream
  To get access to all uploaded photos
  
  Background: I am on site
    Given I navigate to index page
  
  Scenario: Successfully access my photostream
    Given I am logged in as "testuser" and password "helloworld"  
    When I click on link "Photostream"
    Then I should be on my photostream page
  
  Scenario: Redirect to sign in page for anonymous users
    When navigate to Photostream
    Then I should be on sign in page
    And I should see a flash with text "You must sign in to access your photostream"
