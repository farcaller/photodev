Feature: User uploads a photo

  As a registered user
  I want to upload a photo
  To see it in my photostream
  
  Background: I am on site
    Given I navigate to index page
  
  Scenario: Succesfully upload a photo
    Given I am logged in as "testuser" and password "helloworld"  
    When I click on link "Photostream"
    And I click on link "Upload Photo"
    And I attach a test image
    And I click on button "Upload Photo"
    Then I should be on my photostream page
    And I should see a flash with text "Photo was successfully created"
    And I should see "1" photo in photostream
  
  Scenario: Succesfully upload a photo with title
    Given I am logged in as "testuser" and password "helloworld"  
    When I click on link "Photostream"
    And I click on link "Upload Photo"
    And I attach a test image
    And I fill in "Title" with "test title"
    And I click on button "Upload Photo"
    Then I should be on my photostream page
    And I should see a flash with text "Photo was successfully created"
    And I should see "1" photo in photostream
    And the photo with index "1" should have title "test title"
  
  Scenario: Fail to upload non-supported image type
    Given I am logged in as "testuser" and password "helloworld"  
    When I click on link "Photostream"
    And I click on link "Upload Photo"
    And I attach a random data
    And I click on button "Upload Photo"
    Then I should be on upload photo page
    And I should see "You are not allowed to upload"
  
  Scenario: Redirect to sign in page for anonymous users
    When I navigate to "new_photo" path
    Then I should be on sign in page
    And I should see a flash with text "You must sign in to upload photos"
