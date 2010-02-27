Feature: Installing Blorgh
  In order to use blorgh
  As a user
  I want to be able to easily install it
  
  Scenario: Installing Blorgh
    Given I am on the install page
    And I fill in "database_username" with "root"
    And I fill in "database_password" with ""
    And I fill in "database_database" with "blorgh"
    And I press "Submit"
    Then I should see "Blorgh install successful!"
    When I follow "continue"
    Then I should see "Welcome to Blorgh!"
  
  
  

  
