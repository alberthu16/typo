Feature: Merging articles
  As an admin
  In order to reduce redundancy amongst articles
  I want to merge two articles

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    And the following articles exist:
    | title    | author | body                 | type      |
    | Swag     | alb    | Lorem Ipsum          | 'Article' |
    | Swoggles | ken    | bloopy blooper bloop | 'Article' |
    And the following comments exist:
    | title | author | body               | type      | article_id |
    | "Rad" | Jack   | "It was rad!"      | 'Comment' | 0          |
    | "Tad" | Mina   | "It was a tad?"    | 'Comment' | 0          |          
    | "Dad" | Terry  | "It was my dad..." | 'Comment' | 1          |
    | "Bad" | Arlan  | "It was bad."      | 'Comment' | 1          |

  Scenario: When articles are merged, the merged article should contain the text of both previous articles 

    Given I am in the admin edit page for "Swag"
    And I merge this article with: "Swoggles"
    Then I should be reading the article "Swag"
    And the author for article "Swag" should be "alb"
    And the title for article "Swag" should be "Swag"
    And the article "Swag" should have the comment "Dad"
    And the article "Swag" should have the comment "Bad"
    And I should see the words: "Lorem Ipsum", "bloopy blooper bloop"

  Scenario: Article ID error shown when merging article with wrong ID
    
    Given I am in the admin edit page for "Swag"
    And I merge this article with: "Swoggles"
    Then I am in the admin edit page for "Swag"
    And I should see "Article ID not found, please try another ID"

