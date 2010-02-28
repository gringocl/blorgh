Feature: Registering
  In order to use the site
  As a potential user
  I want a way in
  
  Scenario: User
    Given I am on the homepage
    When I follow "Register"
    And I fill in "Login" with "newbie"
    And I fill in "Password" with "password"
    And I fill in "Password Confirmation" with "password"
    And I press "Register"
    Then I should see "Thanks for registering!"
    And I should not see "Login"
    And I should not see "Register"
  
  
  

  
