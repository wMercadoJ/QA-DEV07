Feature: Delete Workspace

  @smock_test
  Scenario Outline: Status code 208 when delete new Workspace with name only
    Given I have set a connection to pivotal_tracker API service with workspace
    And I have workspaces with name <name> and id_projects <id_project>
    When I send workspace a DELETE request to /my/workspaces/
    Then I expect Status code 204 of workspace

  Examples:
      |name|id_project|
      |workspace05|[1601743]|
