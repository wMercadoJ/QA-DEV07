@put_a_comment_into_a_previous_comment
Feature: Put comments into a story
  @test_1
  Scenario: putting a comment request into a User Story
    Given I have set another connection into pivotal_tracker API service
    When I send a Put request to /projects/1596603/stories/120320037/comments/135079563
    Then I expect Status code of put request 200
    And I expect that "updating a comment"