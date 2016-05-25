@Task
Feature:Create
  Scenario Outline: Task created
    Given I have set a connection to pivotal tracker API service
    And I have <project_id> from  Pivotal Tracker project the project
    And I have <story_id> from  Pivotal Tracker project the story
    And I have <description_task> the task name
    When I send my POST request to /projects/<project_id>/stories/<story_id>/tasks
    Then I should create a new task
    And I should receive a Object details
    Examples:
      | project_id | story_id |description_task|
      |1595881 | 120232755 |Test_test   |
