
Feature:Delete task

  @smoke_test
  Scenario Outline: Delete a task in story

    Given I have set a connection to pivotal tracker API service for Task
    And I have a <task_id> ID task from  Pivotal Tracker project the story for Task
    When I send ID task DELETE request to /projects/<project_id>/stories/<story_id>/tasks/<task_id> for Task
    Then I expect status code 204 to task


    Examples:
      | project_id | story_id |task_id|
      |1601613|120861243|  43472143 |
      |1601613|120861243| 43472139  |