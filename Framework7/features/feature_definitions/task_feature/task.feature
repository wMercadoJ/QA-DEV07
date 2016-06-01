@Task_post
Feature:Create task

  Scenario Outline: Create task in a story with only description

    Given I have set a connection to pivotal tracker API service
    And I have <project_id> from  Pivotal Tracker project
    And I have <story_id> from  Pivotal Tracker project the story
    And I have <description_task> the task name
    When I send my POST request to /projects/<project_id>/stories/<story_id>/tasks
    Then I should receive a Object details

    Examples:
      | project_id | story_id |description_task|
      |1595959| 120240033 |Test test2   |

  Scenario Outline: Create task in a story with all properties

    Given I have set a connection to pivotal tracker API service
    And I have <project_id> from  Pivotal Tracker project
    And I have <story_id> from  Pivotal Tracker project the story
    And I have <description_task> name, <complete> complete, <position> position of a new task
    When I send my POST request to /projects/<project_id>/stories/<story_id>/tasks
    Then I should receive all properties of Task

    Examples:
      | project_id | story_id |description_task|complete|position|
      |1595959| 120240033 |Test test test|true|7|
