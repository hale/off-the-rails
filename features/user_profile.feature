Feature: The user's profile page
  As a member of Coitus Cupid, I expect to have a profile page which functions as an advertisement for anyone who might be interested in dating or hooking up with me.  

  I want to feel like my profile is my own creation, but I want the site to make it look good for me.  I'm not very good at talking about myself, so no big empty pages for me to fill in please!  

  In addition, as a member of the site I intend to find other people to date by looking at their profile page.  I should be able to see quickly what they look like, who they're interested in and some basic info like their age and location.  It should be easy for me to get in contact with them from their profile page.  I should have an idea of how active they are on the site.  

  Background:
    Given I have an account
    And I am logged in
    And I am on my homepage

  Scenario: Viewing my own profile page 
    Given I am on my profile page
    Then I should see 'This is your profile page'
    And I should see a link to 'edit profile'

  Scenario: Editing my homepage
    Given I am on my homepage
    When I click on 'Edit your profile'
    Then I should see 'Update'

  Scenario: Checking out someone's profile
    Given 'Timothy' is in my match list
    And I visit 'Timothy's' profile page
    Then I should see 'About'
    And I should see 'Interests'
    And I should see 'Member since'
    And I should see 'Status'
    And I should see 'remove from your match list'
    And I should see 'Message me'
    And I should see 'Twitter'