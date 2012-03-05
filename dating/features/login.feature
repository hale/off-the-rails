Feature: Logging in
  As a member of Coitus Cupid, I expect to be able
  to sign in using my credentials from the homepage.

  Scenario: Incorrect information
    When I visit the 'login' page
    And I submit the wrong information
    Then I should see an error message
    And I should be on the 'login' page

  Scenario: Correct information
    When I visit the 'login' page
    And I submit the correct information
    Then I should see a welcome message
    And I should be on my homepage
    And I should see a 'log out' link