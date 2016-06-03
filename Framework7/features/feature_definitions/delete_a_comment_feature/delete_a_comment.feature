@delete_a_comment
Feature: Delete a comment of a story

  @delete_comment @smoke
  Scenario: Deleting a comment from a user story
    Given I have set another connection to pivotal_tracker API service to delete a comment
    When I send a Delete request
    Then I expect Status code of delete request 204