Given /^\'(\w*)\' has an account$/ do |name|
  User.create!(name: name, email: (name + '@example.com'), password: 'foobar', password_confirmation: 'foobar')
end

When /^I (?:go to|visit) \'(\w*)\'s?\'? profile page$/ do |name|
  user = User.find_by_email( name + '@example.com' )
  visit user_path( user )
end

Then /^\'(\w*)\' should( not)? be in my match list$/ do |name, bool|
  me = User.find_by_email(   'user@example.com' )
  match = User.find_by_email( name + '@example.com' )
  if bool == ' not'
    me.matches.include?( match ).should be_false
  else
    me.matches.include?( match ).should be_true
  end
end

Given /^\'(\w*)\' is in my match list$/ do |name|
  step "'#{name}' has an account"
  me = User.find_by_email( 'user@example.com' )
  user = User.find_by_email( name + '@example.com' )
  me.add_match!(user)
  step "'#{name}' should be in my match list"
end
  