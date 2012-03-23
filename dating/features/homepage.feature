Feature: viewing the homepage
  As a visitor to the site, I expect to see several things on the homepage

  Scenario: A returning user
    Given I have an account
    When I visit the 'home' page
    Then I should see 'Email'
    And I should see 'Password'

  Scenario: An interested potential user
    When I visit the 'home' page
    Then I should see 'About'

  Scenario: An interested user that wants to sign up
    When I visit the 'home' page
    Then I should see 'Name'
    And I should see 'Email'
    And I should see 'Password'
    And I should see 'Password confirmation'
