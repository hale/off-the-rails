Feature: match list
  As a user of Coitus cupid i expect to be able to
  Add users to my match list, and delete them.

  Background:
    Given I have an account
    And I am logged in

  Scenario: adding a user to the match list
    Given 'Jessica' has an account
    When I go to 'Jessica's' profile page
    And I click on 'Add'
    Then 'Jessica' should be in my match list

  Scenario: removing a user from the match list
    Given 'Gordon' is in my match list
    When I go to 'Gordon's' profile page
    And I click on 'Remove'
    Then 'Gordon' should not be in my match list

