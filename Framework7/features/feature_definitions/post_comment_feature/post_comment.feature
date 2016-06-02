@post_comments
Feature: Post comments into a story

  Background: Connection
    Given I have set a connection to pivotal_tracker API service

  @post_comments @smoke
  Scenario: posting comments request from a User Story
    When I send a Post request to /projects/1596603/stories/120320037/comments
    Then I expect Status code of post request 200
    And I expect comment that is "bruno test 75"

  @post_max_length_of_character @post_comment @functional
  Scenario Outline: posting a comment into a story
    When I write a comment with the <max_range_character> character in the comment
    And I send a Post request to /projects/1596603/stories/120320037/comments with the previous text
    Then I expect Status code of post request 200
    Examples:
      | max_range_character |
      | 2000                |
      | 2001                |
      | 100                 |
      | 1                   |


