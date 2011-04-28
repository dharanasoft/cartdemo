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
