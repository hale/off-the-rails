Feature: match list
  As a user of Coitus cupid i ecpect to be able to
  Add users to my match list, and delete them.

  Background:
    Given I have an account
    And I am logged in
    And 'Sarah' has an account

  Scenario: adding a user to the match list
    When I go to 'Sarah's' profile page
    And I click on 'Add to my matches'
    Then 'Sarah' should be added to my match list