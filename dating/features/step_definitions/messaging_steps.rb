Given /^I have an account$/ do
  visit '/signup'
  within 'div.signup' do
    fill_in( 'Name', :with => 'Example User' )
    fill_in( 'Email', :with => 'user@example.com' )
    fill_in( 'Password', :with => 'foobar' )
    fill_in( 'Password confirmation', :with => 'foobar')
    click_button 'Sign up'
  end
end

Given /^I am logged in$/ do
  step 'I have an account'
  visit '/login'
  within 'div.login' do
    fill_in( 'Email', :with => 'user@example.com' )
    fill_in( 'Password', :with => 'foobar' )
    click_button 'Log in'
  end
end

# Find a way of refactoring this so that we don't need steps for every route.
Given /^I (?:visit|go to|am on) the 'home' page$/ do
  visit ('/')
end

# NB: keep these steps at the bottom because they mess with syntax hilighting

Then /^I should see \'(.*)\'$/ do |content|
  page.body.should =~ /content/i
end

Given /^I have \'(\w*)\' in my match list$/ do |match_name|
  pending
  # find our user --> get her match list --> check match_name is in list
end
