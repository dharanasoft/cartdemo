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

