@post_comments
Feature: Post comments into a story

  @test_1
  @test_1
  Scenario: getting comments request from a User Story
    Given I have set another connection to pivotal_tracker API service
    When I send a Post request to /projects/1596603/stories/120320037/comments
    Then I expect Status code of post request 200
    And I expect that "bruno test 3"