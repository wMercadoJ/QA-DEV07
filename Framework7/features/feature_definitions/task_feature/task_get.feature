@Task_get
Feature: Get task
  @Smoke
  Scenario Outline: Get a task from a story

    Given I have set a connection to pivotal tracker API service
    When I send my GET request to /projects/<project_id>/stories/<story_id>/tasks
    Then I expect Status code 200 to task

  Examples:
  | project_id | story_id |
  |1595959| 120240033 |

  @Functional
  Scenario Outline: Get a task details from a story

    Given I have set a connection to pivotal tracker API service
    When I send my GET request to /projects/<project_id>/stories/<story_id>/tasks
    Then I expect Status code 200 to task
    And I expect number test <i>, id task <id_task>,kind <kind>,is story <story_id>,description <description>, complete <complete>, position <position>, created date <created_at>, updated date <updated_at>
    And I expect TaskDetails Object to task

    Examples:
     |i | project_id | story_id |id_task|kind|description|complete|position|created_at|updated_at|
     |0 |1595959| 120240033 |43209645   |task  |Test2   |true    |1       |2016-05-25T22:59:29Z|2016-05-25T22:59:29Z|
   |1  |1595959| 120240033 |43169379   |task   |Test1   |true    |2       |2016-05-24T22:17:15Z|2016-05-24T22:17:15Z|
   | 2|1595959| 120240033 |43168623   |task   |we      |false   |3       |2016-05-24T21:47:41Z|2016-05-24T21:47:41Z|
   |3   |1595959| 120240033 |43168625   |task  |re      |false   |4       |2016-05-24T21:47:45Z|2016-05-24T21:47:45Z|
   |4   |1595959| 120240033 |43196973   |task   |Test1   |false   |5       |2016-05-25T17:34:45Z|2016-05-25T17:34:45Z|
   |5   |1595959| 120240033 |43209761   |task   |Test test|false  |6       |2016-05-25T23:04:16Z|2016-05-25T23:04:16Z|
   |6   |1595959| 120240033 |43210065   |task   |Test3    |false  |7       |2016-05-25T23:24:58Z|2016-05-25T23:24:58Z|
