Feature: Logging in
  In order to use the blog
  As a user
  I want to be able to log in
  
  Scenario: Logging in as an admin
    Given I am on the homepage
    And there is an admin with the login of "admin" and password "password"
    When I follow "Login"
    And I fill in "Login" with "admin"
    And I fill in "Password" with "password"
    And I press "Login"
    Then I should be on the admin page
    
    
  Scenario: Logging in as a user
    Given I am on the homepage
    And there is an user with the login of "user" and password "password"
    When I follow "Login"
    And I fill in "Login" with "user"
    And I fill in "Password" with "password"
    And I press "Login"
    Then I should be on the homepage

  
  

  
