@Post_test
Feature: Final Project for Api Test

  @Smock_test
  Scenario Outline: Status code 200 when create new Workspace with name only
    Given I have set a connection to pivotal_tracker API service with workspace
    When I send workspace a POST request to /my/workspaces
    And I send name <name> and id_project <id_project>
    Then I expect Status code 200 of workspace

    Examples:
    |name|id_project|
    |danielsworkspace000|[]|

  @Smock_test
  Scenario Outline: Status code 200 when create new Workspace with name and projects id
    Given I have set a connection to pivotal_tracker API service with workspace
    When I send workspace a POST request to /my/workspaces
    And I send name <name> and id_project <id_project>
    Then I expect Status code 200 of workspace

    Examples:
      |name|id_project|
      |danielsworkspace001|[1601125]|