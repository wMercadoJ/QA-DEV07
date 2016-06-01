@getting_comments
Feature: Get comments from a Story

  Background: Connection
    Given I have set a connection to pivotal_tracker API service

  @get_list_comments @get_comment @smoke
  Scenario: getting comments request from a User Story

    When I send a GET request to /projects/1596603/stories/120320037/comments
    Then I expect Status code 200

  @get_comment @get_comment @smoke
  Scenario: getting individual comment request from a User Story

    When I send a GET request to /projects/1596603/stories/120320037/comments/135075719
    Then I expect Status code 200

  @validating_ID_value  @story_id @person_id @get_comment @functional
  Scenario Outline: verifying that three parameters of a comment is an  integer value
    When I send a GET request to /projects/1596603/stories/120320037/comments/135075719
    And I receive <integer_parameter>  of a comment
    And I validate this integer parameters
    Then I should receive true as an answer for integer values
    Examples:
      | integer_parameter |
      | id                |
      | person_id         |
      | story_id          |

  @validating_json_has_7_parameters @get_comment
  Scenario: verifying that a comment has seven parameters
    When I send a GET request to /projects/1596603/stories/120320037/comments/135075719
    And I validate that the json comment has 7 parameters
    Then I should receive true as an answer

  @validating_Kind_value @validating_text_value @get_comment @functional @comment_has_2000_characters
  Scenario Outline: verify that the value of a parameter is a String value
    When I send a GET request to /projects/1596603/stories/120320037/comments/135075719
    And I receive <string_parameter> parameter of a comment
    And I validate that the parameter has a valid value
    Then I should receive true as an answer
    Examples:
      | string_parameter |
      | kind             |
      | text             |



  @comment_has_2000_characters @get_comment
  Scenario: verify that the comment text has 2000 characters
    When I send a GET request to /projects/1596603/stories/120320037/comments/135075719
    And I validate that text comment has 2000 characters
    Then I should receive true as an answer
