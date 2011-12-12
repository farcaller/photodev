Feature: User browses collection
  
  As a registered user
  I want to browse my collections
  To access and manage them
  
  As an anonymous user
  I want to browse public collections of other users
  To view photos inside them
  
  Background: I am on site
    Given I navigate to index page
    
  Scenario: Create two collections and see them in list
    Given I am logged in as "testuser" and password "helloworld"
    When I create a private collection named "test private"
    And I create a public collection named "test public"
    And I click on link "Collections"
    Then I should see 2 collections
    And I should see a collection named "test private"
    And I should see a collection named "test private"
  
  Scenario: Browse own collection
    Given I am logged in as "testuser" and password "helloworld"
    When I create a private collection named "test private"
    And I click on link "Collections"
    And I click on link "test private"
    Then I should be on the page for collection titled "test private"
  
  Scenario: Browse a public collection of other user when anonymous
    Given I am logged in as "testuser" and password "helloworld"
    When I create a public collection named "test public" and store its path
    And I sign out
    And I navigate to stored collection path
    Then I should be on the page for collection titled "test public"
    And I should not see the management UI
  
  Scenario: Fail to browse a private collection of other user when anonymous
    Given I am logged in as "testuser" and password "helloworld"
    When I create a private collection named "test public" and store its path
    And I sign out
    And I navigate to stored collection path
    Then I should be on sign in page
    And I should see a flash with text "You must sign in to access collections"
  
  Scenario: Browse a public collection of other user when other user
    Given I am logged in as "testuser" and password "helloworld"
    When I create a public collection named "test public" and store its path
    And I sign out
    And I am logged in as "testotheruser" and password "helloworld"
    And I navigate to stored collection path
    Then I should be on the page for collection titled "test public"

  Scenario: Fail to browse a private collection of other user when other user
    Given I am logged in as "testuser" and password "helloworld"
    When I create a private collection named "test public" and store its path
    And I sign out
    And I am logged in as "testotheruser" and password "helloworld"
    And I navigate to stored collection path
    Then I should be on index page
    And I should see a flash with text "You cannot access this collection"
