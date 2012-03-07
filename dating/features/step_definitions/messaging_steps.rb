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

Given /^I mistype my password$/ do
  visit login_url
  within 'div.login' do
    fill_in( 'Email', :with => 'user@example.com' )
    fill_in( 'Password', :with => 'FOOBAR' )
  end
end

Given /^I enter my username and password$/ do
  step 'I have an account'
  visit login_url
  within 'div.login' do
    fill_in( 'Email', :with => 'user@example.com' )
    fill_in( 'Password', :with => 'foobar' )
  end
end


# Find a way of refactoring this so that we don't need steps for every route.
Given /^I (?:visit|go to|am on) the (?:homepage|'home' page)$/ do
  visit root_url
end

Given /^I (?:visit|go to|am on) my (?:homepage|home page)$/ do
  visit user_home_url, :id => 1
end


Given /^I should be on my (?:home page|homepage)$/ do
  current_url.should =~ /users\/(\d*)\/home/
end

# NB: keep these steps at the bottom because they mess with syntax hilighting

Given /^I click(?: on)? \'(.*)\'$/ do |button|
  click_button button
end

Given /^I enter \'(.*)\' as my (\w*)$/ do |content, field|
  fill_in field, :with => content
end

Given /^I should be on the \'(?:login|log in|sign in|)\' page$/ do
  current_url.should =~ /sessions/i
end

Given /^I (?:visit|go to|am on) the \'(?:login|log in|sign in|)\' page$/ do
  visit login_path
end

Then /^I should see(?:.*)\'(.*)\'(?:.*)$/ do |content|
  page.body.should have_content content
end

Given /^I have \'(\w*)\' in my match list$/ do |match_name|
  pending "Need to dsicuss how matches are stored - which controller etc"
  # find our user --> get her match list --> check match_name is in list
end
