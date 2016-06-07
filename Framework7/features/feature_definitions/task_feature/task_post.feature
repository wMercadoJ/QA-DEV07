Feature:Create task

@smoke_test, @functional_test
  Scenario Outline: Create task in a story with only description

    Given I have set a connection to pivotal tracker API service for Task
    And I have <story_id> from  Pivotal Tracker project the story for Task
    And I have <description_task> the task's name
    When I send my POST request to /projects/<project_id>/stories/<story_id>/tasks for Task
    Then I should receive a Object details for Task
    And I expect status code 200 to task

    Examples:
      | project_id | story_id |description_task|
      |1601613|120861243|Test_test2|

  @functional_test
  Scenario Outline: Create task in a story with all properties

    Given I have set a connection to pivotal tracker API service for Task
    And I have <story_id> from  Pivotal Tracker project the story for Task
    And I have <description_task> name, <complete> complete, <position> position of a new task in Story
    When I send my POST request to /projects/<project_id>/stories/<story_id>/tasks for Task
    Then I should receive a Object details for Task

    Examples:
      | project_id | story_id |description_task|complete|position|
      |1601613|120861243 |Test rules|||
      |1601613|120861243 |Test task|||
      |1601613|120861243 |Perform a----------- list of task||14|
      |1601613|120861243 |Create uuuuuuuu position for Task|True|12|
      |1601613|120861243|See you later * **  4|True||

  @negative_test
  Scenario Outline: A task is not created with special characters in its fields

    Given I have set a connection to pivotal tracker API service for Task
    And I have <story_id> from  Pivotal Tracker project the story for Task
    And I have <description_task> name, <complete> complete, <position> position of a new task in Story
    When I send my POST request to /projects/<project_id>/stories/<story_id>/tasks for Task
    Then I expect the details of error message


    Examples:
      | project_id | story_id |description_task|complete|position|
      |1601613|120861243 ||||
#      |1601613|120861243 |{'COMMIT' => 5, 'test' => *}||*|
#      |1601613|120861243 |pwd|GET|Y|
#      |1601613|120861243 |||?|
#      |1601613|120861243 ||?||
#      |1601613|120861243 |||2|
#      |1601613|120861243||TRUE||
#      |1601613|120861243||||
