Feature: Post Workspace

  @smoke_test
  Scenario Outline: Status code 200 when create new Workspace with name only
    Given I have set a connection to pivotal_tracker API service with workspace
    When I send workspace a POST request to /my/workspaces
    And I send workspaces with name <name> and id_projects <id_project>
    Then I expect Status code 200 of workspace

    Examples:
    |name|id_project|
    |workspace03|[]|

  @smoke_test @functional_test
  Scenario Outline: Status code 200 when create new Workspace with name and projects id
    Given I have set a connection to pivotal_tracker API service with workspace
    When I send workspace a POST request to /my/workspaces
    And I send workspaces with name <name> and id_projects <id_project>
    Then I expect Status code 200 of workspace

    Examples:
      |name|id_project|
      |workspace04|[1601125]|
      |WORKSPACE06|[1601125]|
      |Workspace07_long_name|[1601125]|


  @negative_test
  Scenario Outline: Status code 400 when I try to create new Workspace with empty name and valid projects id
    Given I have set a connection to pivotal_tracker API service with workspace
    When I send workspace a POST request to /my/workspaces
    And I send a invalid name <name> and valid id_project <id_project>
    Then I expect a message of error for empty name

    Examples:
      |name|id_project|
      ||[1595977]|

  @negative_test
  Scenario Outline: Status code 400 when I try to create new Workspace with valid name and  projects id as string
    Given I have set a connection to pivotal_tracker API service with workspace
    When I send workspace a POST request to /my/workspaces
    And I send a valid name <name> and invalid id_project <id_project>
    Then I expect a message of error for project as a string

    Examples:
      |name|id_project|
      |workspace06|[I_am_String]|
