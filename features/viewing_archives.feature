Feature: Viewing archives
  In order to go back in time
  As a user
  I want to see posts from certain months
  
  Scenario: Viewing the January 2010 archive
    Given time is frozen
    And there is a post called "Welcome to Blorgh!"
    And there is a post called "Welcome to the future!" created on "01-02-2010"
    And I am on the homepage
    Then I should see "February 2010" before "January 2010"
    When I follow "January 2010"
    Then I should see "January 2010 Archives"
    Then I should see "Welcome to Blorgh!"