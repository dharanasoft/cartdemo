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
    I should see "book"
    I should see "audio"
    I should see "electronics"
