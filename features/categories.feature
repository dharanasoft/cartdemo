Feature: Manage categories
  As a user
  In order to manage products
  I should be able to manage categories

  Scenario: Show categories
    Given that I have the following categories
    | name |
    | book |
    | audio |
    | electronics |
    And I visit the home page
    Then I should see "book"
    And I should see "audio"
    And I should see "electronics"

  Scenario: Add a category
    Given I am on the home page
    And I click on the "New category" link
    And I fill in "books" for "Name"
    And I click on "Create Category"
    Then I should see "books" in the list of categories
