Feature: Home Page

  Scenario: Viewing application's home page
    Given there is a post titled "My first" with "Hello, Cucumber" content
    When I am on the homepage
    Then I should see the "My first" post
