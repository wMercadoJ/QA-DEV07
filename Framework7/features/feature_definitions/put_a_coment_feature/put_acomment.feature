@put_a_comment_into_a_previous_comment
Feature: Put comments into a story

  Background: Connection
    Given I have set another connection into pivotal_tracker API service

  @update_text_comment @put_comment @smoke
  Scenario: putting a comment request into a User Story

    When I send a Put request to /projects/1596603/stories/120320037/comments/135079563
    Then I expect Status code of put request 200
    And I expect that "updating a comment"


  @updating_comment @put_comment @functional
  Scenario Outline: posting a comment into a story
    When I write a comment with the <max_range_character> character to update a comment
    And I send Put request to /projects/1596603/stories/120320037/comments/135079563 with the previous text to update a comment
    Then I expect Status code of post request 200
    And I expect True as an answer of the updated comment
    Examples:
      | max_range_character |
      | 2000                |
      | 2001                |
      | 100                 |
      | 1                   |