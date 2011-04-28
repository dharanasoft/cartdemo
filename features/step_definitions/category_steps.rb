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

Given /^I have the following products under "([^"]*)"$/ do |category_name, product_table|
  category = Category.where(:name=>category_name).first
  product_table.hashes.each do |prod|
    product = category.products.build prod
    product.save!
  end
end
Given /^I am on the "([^"]*)" category page$/ do |category_name|
  category = Category.where(:name=>category_name).first
  visit category_products_path(category)
end

When /^I click on "([^"]*)" button$/ do |button_name|
  click_button(button_name)
end


Then /^I should be on the "([^"]*)" product page$/ do |product_name|
  product = Product.where(:name=>product_name).first
  current_path.should == product_path(product)
end

