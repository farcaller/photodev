Feature: Users signs in to site

  As a site visitor with existing account
  I want to sign in to site
  So I can access photo services
  
  Background: I am on site
    Given I navigate to index page
  
  Scenario: successfully sign in with existing account using username
    Given there is user "testuser" registered with email "test@user.net"
    When I sign in with "testuser" and password "helloworld"
    Then I should see account menu for "test@user.net"
    And I should see a flash message stating that login is successful

  Scenario: successfully sign in with existing account using email
    Given there is user "testuser" registered with email "test@user.net"
    When I sign in with "test@user.net" and password "helloworld"
    Then I should see account menu for "test@user.net"
    And I should see a flash message stating that login is successful

  Scenario: fail to sign in with non-existing account
    Given there is no user "testuser" registered
    When I sign in with "testuser" and password "helloworld"
    Then I should see login error
