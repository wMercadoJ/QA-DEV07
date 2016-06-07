Feature: Delete a comment of a story

  @smoke_test
  Scenario: Deleting a comment from a user story
    Given I have set another connection to pivotal_tracker API service to delete a comment
    When I send a Delete request
    Then I expect Status code of delete request 204

  @functional_test
  Scenario: Delete a non_existing comment
    Given I have set another connection to pivotal_tracker API service to delete a comment
    When I send a Delete request /projects/1601145/stories/120813473/comments/789987
    Then I expect bad request code of delete request 400