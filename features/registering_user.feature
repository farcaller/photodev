Feature: User registers account

  As a site visitor
  I want to register on site
  So I can access photo services
  
  Background: I am on site
    Given I navigate to index page
  
  Scenario: successfully register account
    When I register with username "testuser" and email "test@user.net"
    Then I should be redirected to index page
    And I should see account menu for "test@user.net"
    And I should see a flash message stating that registration is successful
  
  Scenario: fail to register account due to name duplicate
    Given there is user "testuser" registered with email "test@user.net"
    When I register with username "testuser" and email "other@user.net"
    Then I should see registration error
  
  Scenario: fail to register account due to email duplicate
    Given there is user "testuser" registered with email "test@user.net"
    When I register with username "hello" and email "test@user.net"
    Then I should see registration error
