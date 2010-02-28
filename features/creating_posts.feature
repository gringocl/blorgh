Feature: Creating posts
  In order to create posts
  As an admin
  I want some fields I can fill in 
  
  Background:
    Given the usual setup
    Given I am logged in as "admin" with the password "password"
    Then I should be on the admin page
    When I follow "Posts"
    And I follow "New"
  
  Scenario: Creating a post
    And I fill in "Title" with "Blorgh is awesome!"
    And I fill in "Text" with "Blorgh blows my mind!"
    And I press "Post"
    Then I should see "Post created."
    
  Scenario: Creating a post from the home page
    Given I am on the homepage
    When I follow "Admin"
    And I follow "Posts"
    And I follow "New"
    And I fill in "Title" with "Blorgh is awesome!"
    And I fill in "Text" with "Blorgh blows my mind!"
    And I press "Post"
    Then I should see "Post created."
    
  Scenario: Attempting to create a post with no title fails
    And I fill in "Text" with "Blorgh blows my mind!"
    And I press "Post"
    Then I should see "Could not create this post."
    And I should see "Title can't be blank"
    
  Scenario: Attempting to create a post with no text fails
    And I fill in "Title" with "Blorgh is awesome!"
    And I press "Post"
    Then I should see "Could not create this post."
    And I should see "Text can't be blank"
