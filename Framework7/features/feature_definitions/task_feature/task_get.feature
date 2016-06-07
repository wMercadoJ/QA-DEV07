Feature: Get task
  @smoke_test
  Scenario Outline: Get a status task from a story

    Given I have set a connection to pivotal tracker API service for Task
    When I send my GET request to /projects/<project_id>/stories/<story_id>/tasks for Task
    Then I expect status code 200 to task

  Examples:
  | project_id | story_id |
  |1601613|120861243|

  @functional_test
  Scenario Outline: Get a task details from a story

    Given I have set a connection to pivotal tracker API service for Task
    When I send my GET request to /projects/<project_id>/stories/<story_id>/tasks for Task
    And I expect TaskDetails of number test <i>, id task <id_task>,kind <kind>,is story <story_id>,description <description>, complete <complete>, position <position>, created date <created_at>, updated date <updated_at> for Task

    Examples:
     |i | project_id | story_id |id_task|kind|description|complete|position|created_at|updated_at|
     |0 |1601613|120861243|43472133|task|Test_test2|false|1 |2016-06-04T00:53:15Z|2016-06-04T00:53:15Z|
     |1  |1601613|120861243|43494569 |task   |Create uuuuuuuu position for Task   |true    |2   |2016-06-06T13:56:28Z|2016-06-06T13:56:28Z|
     | 2|1601613|120861243|43494547   |task   |Create uuuuuuuu position for Task   |true    |3    |2016-06-06T13:56:03Z|2016-06-06T13:56:03Z|
     |3 |1601613|120861243|43494495   |task  |Create uuuuuuuu position for Task   |true    |4     |2016-06-06T13:55:10Z|2016-06-06T13:55:10Z|
     |4 |1601613|120861243|43494567   |task  |Perform a----------- list of task  |false   |5  |2016-06-06T13:56:27Z|2016-06-06T13:56:27Z|


  @negative_test
  Scenario Outline: The fields for task have to accomplish the parameters

    Given I have set a connection to pivotal tracker API service for Task
    When I send my GET request to /projects/<project_id>/stories/<story_id>/tasks/<id_task> for Task
    Then I expect status code 404 to task
    Examples:
      | project_id | story_id |id_task|
      |1601613|120861243|43494670  |
