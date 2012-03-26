Feature: Logging in
  As a member of Coitus Cupid, I expect to be able
  to use my credentials to sign in from the homepage.
  My name is: Example User
  My email is: 'user@example.com'
  My password is: 'foobar'

  Background:
    Given I have an account

  Scenario: Incorrect information
    When I visit the 'login' page
    And I mistype my password
    And I click 'Log in'
    Then I should see an 'Invalid' message
    And I should be on the 'login' page

  Scenario: Correct information
    When I visit the 'login' page
    And I enter my username and password
    And I click 'Log in'
    Then I should see a 'Welcome back' message
    And I should be on my homepage
    And I should see a 'Log Out' link