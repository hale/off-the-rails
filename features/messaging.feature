Feature: Messaging
  
  As a user of our dating app
  I want to be able to send messages to other users and
  read messages from other users.

  Background:
    Given I have an account
    And I am logged in
    And I have 'Sarah' in my match list 
    And I am on the 'inbox' page 

  Scenario: Write a message to Sarah
    When I visit 'Sarah's'  profile
    And I click on 'send message'
    Then I should be on the 'send message' page
    And 'To' should contain 'Sarah'

  Scenario: Read a message 'Happy birthday!'
    Given I have been sent a message by 'Sarah'
    When I click on the message
    Then I should see it is 'from Sarah'
    And I should see what 'time' it was sent
    And I should see the message 'Happy birthday!'

  Scenario: Reply to a message
    Given I have been sent a message by 'Sarah'
    When I click on the message
    And I click on 'reply'
    Then I should be on the 'send message' page
    And 'To' should contain 'Sarah'

  Scenario: Delete a message
    Given I have been sent a message by 'Sarah'
    When I click on the message
    And I click on 'delete'
    Then I should be on the 'inbox' page
    And I should see 'message deleted'



