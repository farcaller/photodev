Feature: User creates collection

  As a registered user
  I want to create new collections
  And modify existing ones
  To manage photos in groups and specify their availability
  
  Background: I am on site
    Given I navigate to index page
  
  Scenario: Successfully create a private collection
    Given I am logged in as "testuser" and password "helloworld"
    When I click on link "Collections"
    And I click on link "New collection"
    And I fill in "Title" with "test collection"
    And I choose "Allow access only to you"
    And I click on button "Create Collection"
    Then I should be on the page for collection titled "test collection"
  
  Scenario: Successfully create a public collection
    Given I am logged in as "testuser" and password "helloworld"  
    When I click on link "Collections"
    And I click on link "New collection"
    And I fill in "Title" with "test collection"
    And I choose "Allow access by anonymous users"
    And I click on button "Create Collection"
    Then I should be on the page for collection titled "test collection"
  
  Scenario: Redirect to sign in page for anonymous users
    When I navigate to "new_collection" path
    Then I should be on sign in page
    And I should see a flash with text "You must sign in to access collections"
  
  Scenario: Fail to create a collection without a title
    Given I am logged in as "testuser" and password "helloworld"  
    When I click on link "Collections"
    And I click on link "New collection"
    And I click on button "Create Collection"
    Then I should see an error "can't be blank" for field "Title"
  