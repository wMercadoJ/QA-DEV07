Feature: Post comments into a story

  Background: Connection
    Given I have set a connection to pivotal_tracker API service

  @smoke_test
  Scenario: posting comments request from a User Story
    When I send a Post request to /projects/1601145/stories/120813473/comments
    Then I expect Status code of post request 200
    And I expect comment that is "bruno test 75"

  @functional_test
  Scenario Outline: posting a comment into a story
    When I write a comment with the <max_range_character> character in the comment
    And I send a Post request to /projects/1601145/stories/120813473/comments with the previous text
    Then I expect Status code of post request 200
    Examples:
      | max_range_character |
      | 2000                |
      | 2001                |
      | 100                 |
      | 1                   |

  @negative_test
  Scenario Outline: posting a comment into a story with invalid parameter
    When I write a comment with the <max_range_character> character in the comment
    And I send a Post request to /projects/1601145/stories/120813473/comments with the bad text
    Then I expect bad request code of post request 400
    Examples:
      | max_range_character |
      | 22000               |
      | 0                   |

