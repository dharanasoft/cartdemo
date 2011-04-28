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

  Scenario: List products
    Given that I have the following categories
    | name |
    | books |
    | audio |
    | electronics |
    And I have the following products under "books"
    | name                    | description               |
    | Anthem - by Ayn Rand    | Objectivism at its best   |
    | The Mythical Man Month  | Every PM should read this |
    When I visit the home page
    And I click on the "books" link
    Then I should see "Anthem - by Ayn Rand"
    And I should see "The Mythical Man Month"
