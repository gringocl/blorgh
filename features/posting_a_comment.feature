Feature: Posting a comment
  In order to post comments on a blorgh post
  As a user
  I want some things I can prattle into
  
  Background:
    Given the usual setup
    And there is a post called "Welcome to Blorgh!"
    And I am logged in as "user" with the password "password"
    Given I follow "Welcome to Blorgh!"
  
  Scenario: Posting a comment
    And I fill in "Text" with "I really love the enthusiastic attitude you have towards writing."
    And I press "Comment"
    Then I should see "Thanks for your comment!"
    And I should see the post has 1 comment
    And I should see "I really love the enthusiastic attitude you have towards writing."
    
  Scenario: Posting a spam comment just sends it away
    And I fill in "Text" with "-online 4u 4-u acne adipex advicer baccarrat blackjack bllogspot booker buy byob carisoprodol"
    And I press "Comment"
    Then I should see "Thanks for your comment"
    And I should see the post has 0 comments