@working
Feature: User browses photostream
  As a registered user
  I want to see my photostream
  To get access to all uploaded photos
  
  Scenario: Successfully access my photostream
    Given I navigate to index page
    And I am logged in as "testuser" and password "helloworld"  
    When I click on link "Photostream"
    Then I should be on my photostream page
