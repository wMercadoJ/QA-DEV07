@getting_comments
Feature: Get comments from a Story

  Background: Connection
    Given I have set a connection to pivotal_tracker API service

  @list_comments @get_comment @smoke_test
  Scenario: getting comments request from a User Story

    When I send a GET request to /projects/1601145/stories/120813473/comments
    Then I expect Status code 200

  @get_comment @smoke_test
  Scenario: getting individual comment request from a User Story

    When I send a GET request
    Then I expect Status code 200

  @ID_value  @story_id @person_id @get_comment @functional_test
  Scenario Outline: verifying that three parameters of a comment is an  integer value
    When I send a GET request
    And I validate <integer_parameter> parameter of a comment
    And I validate this integer parameters
    Then I should receive true as an answer for integer values
    Examples:
      | integer_parameter |
      | id                |
      | person_id         |
      | story_id          |

  @json_parameters @get_comment
  Scenario: verifying that a comment has seven parameters
    When I send a GET request
    And I validate that the json comment has 7 parameters
    Then I should receive true as an answer when the json has 7 numbers

  @Kind_value @text_value @get_comment @functional_test
  Scenario Outline: verify that the value of a parameter is a String value
    When I send a GET request
    And I validate <string_parameter> parameter of a comment
    Then I should receive true as an answer for string values
    Examples:
      | string_parameter |
      | kind             |
      | text             |

  @created_at_value @updated_at_value @get_comment @functional_test
  Scenario Outline: verifying that the created and updated value are correct
    When I send a GET request
    And I validate <date_parameter> parameter of a comment
    Then I should receive true as an answer for <date_parameter> values
    Examples:
      | date_parameter |
      | created_at     |
      | updated_at     |

  @length_comment @get_comment
  Scenario: verify that the comment text has 2000 characters
    When I send a GET request
    And I validate that text comment has between 1 and 20000 characters
    Then I should receive true as an answer for text_length values

  @id_invalid @negative @get_comment @negative_test
  Scenario: verify that there is not possible to get a comment with invalid id
    When I send a GET request to /projects/1601145/stories/120813473/comments/787788
    Then I expect bad request 404