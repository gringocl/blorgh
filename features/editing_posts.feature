Feature: Editing posts
  In order to be able to edit posts
  As an admin
  I want some fields I can edit
  
  Background:
    Given the usual setup
    Given I am logged in as "admin" with the password "password"
    And there is a post called "Welcome to Blorgh!"
    Then I should be on the admin page
    When I follow "Posts"
    When I follow the edit link for the post called "Welcome to Blorgh!"
  
  Scenario: Editing a post
    And I fill in "Title" with "Hello from Blorgh!"
    And I press "Update"
    Then I should see "Post updated."
    Then I should see "Editing Post: Hello from Blorgh"
    
  Scenario: Editing a post fails with no title set
    And I fill in "Title" with ""
    And I press "Update"
    Then I should see "Could not update this post."
    And I should see "Title can't be blank"

  Scenario: Editing a post fails with no text set
    And I fill in "Text" with ""
    And I press "Update"
    Then I should see "Could not update this post."
    And I should see "Text can't be blank"