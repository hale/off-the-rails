# TODO Find a way of refactoring this so that we don't need steps for every route.
Given /^I (?:visit|go to|am on) the (?:homepage|'home' page)$/ do
  visit root_url
end

# NB: keep these steps at the bottom because they mess with syntax hilighting

Then /^I should see(?:.*)\'(.*)\'(?:.*)$/ do |content|
  page.should have_content content
end

