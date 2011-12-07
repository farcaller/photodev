Feature: User manages collection

  As a registered user
  I want to modify my collections
  To manage collection name, availability, contained photos and index image
  
  Background: I am on site
    Given I navigate to index page
    And I am logged in as "testuser" and password "helloworld"
    And I upload a test photo with title "photo 1"
    And I upload a test photo with title "photo 2"
    And I upload a test photo with title "photo 3"
  
  @javascript
  Scenario: Add several photos to collection
    Given I create a private collection named "test collection" and store its path
    When I click on link "Photostream"
    And I click on link "Manage Photos"
    And I click on link "photo 1"
    And I click on link "photo 3"
    And I click on link "test collection"
    And I navigate to stored collection path
    Then I should see 2 photos in collection
  
  @javascript
  Scenario: Select several photos from collection
    Given I create a private collection named "test collection" and store its path
    When I add photo named "photo 1" to collection "test collection"
    And I add photo named "photo 3" to collection "test collection"
    And I click on link "Collections"
    And I click on link "test collection"
    And I click on link "Manage Photos"
    Then I should see a link "Edit Properties"
    And I should see a link "Done"
  