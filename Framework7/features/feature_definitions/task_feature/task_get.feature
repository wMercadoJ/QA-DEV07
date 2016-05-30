@Task_get
Feature: Get task

  Scenario Outline: Get a task from a story

    Given I have set a connection to pivotal tracker API service
    When I send my GET request to /projects/<project_id>/stories/<story_id>/tasks
    Then I expect Status code 200 to task
    And I expect TaskDetails Object to task

  Examples:
  | project_id | story_id |
  |1595959| 120240033 |
