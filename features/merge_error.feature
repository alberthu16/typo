Feature: Unsuccessfully merge articles
    As a normal user
    In order to sate my curiosity about merging articles
    I want to merge two articles unsuccessfully 

  Background:
    Given the blog is set up
    And I am not an admin
    And the following articles exist:
    | title      | author | body                   | type      |
    | "Swag"     | alb    | "Lorem Ipsum"          | 'Article' |
    | "Swoggles" | ken    | "bloopy blooper bloop" | 'Article' |

  Scenario: A non-admin cannot merge two articles
    Given I am on the admin edit page for "Swag"
    Then I should not see the "Merge With This Article" button
