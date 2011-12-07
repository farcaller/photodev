Feature: Managing photostream

  As a registered user
  I want to modify my photostream
  To select photos and perform bulk operations

  Background: I am on site
    Given I navigate to index page
    And I am logged in as "testuser" and password "helloworld"
    And I upload a test photo with title "photo 1"
    And I upload a test photo with title "photo 2"
    And I upload a test photo with title "photo 3"
    And I click on link "Photostream"
  
  @javascript
  Scenario: Select several photos
    When I click on link "Manage Photos"
    And I click on link "photo 1"
    And I click on link "photo 3"
    Then I should see "2 photos selected"
    And the photo with title "photo 1" should be selected
    And the photo with title "photo 2" should not be selected
    And the photo with title "photo 3" should be selected
  
  @javascript
  Scenario: See a list of collection in photostream
    Given I create a private collection named "test private"
    Given I create a public collection named "test public"
    When I click on link "Photostream"
    And I click on link "Manage Photos"
    Then I should see a link for collection named "test private"
    And I should see a link for collection named "test public"
  