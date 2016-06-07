
Feature:Delete task

  @smoke_test
  Scenario Outline: Delete a task in story

    Given I have set a connection to pivotal tracker API service for Task
    When I send ID task DELETE request to /projects/<project_id>/stories/<story_id>/tasks/for Task
    Then I expect status code 204 to task


    Examples:
      | project_id | story_id |
      |1601613|120861243|
