Given /^that I have the following categories$/ do |categories_table|
  categories_table.hashes.each do |cat|
    Category.create!(cat)
  end
  
end

Given /^I visit the home page$/ do
  visit root_path
end

Then /^I should see "([^"]*)"$/ do |name|
  page.should have_content(name)
end

Given /^I am on the home page$/ do
  visit root_path
end

Given /^I click on the "([^"]*)" link$/ do |link_name|
  click_link(link_name)
end

Given /^I fill in "([^"]*)" for "([^"]*)"$/ do |value, name|
  fill_in(name,:with=>value)
end

Given /^I click on "([^"]*)"$/ do |button_name|
  click_button(button_name)
end

Then /^I should see "([^"]*)" in the list of categories$/ do |category_name|
  page.should have_content(category_name)
end

