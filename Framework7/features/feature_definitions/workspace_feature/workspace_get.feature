Feature: Final Project for Api Test

  @smock_test
  Scenario: All workspace details without to send any value
    Given I have set a connection to pivotal_tracker API service with workspace
    When I send workspace a GET request to /my/workspaces
    Then I expect Status code 200 of workspace


  @smock_test
  Scenario: Workspace details of id_workspace value specific
    Given I have set a connection to pivotal_tracker API service with workspace
    When I send workspace with its ID a GET request to /my/workspaces/582929
    Then I expect Status code 200 of workspace


  @functional_test
  Scenario Outline: Verify that workspace values are valid
    Given I have set a connection to pivotal_tracker API service with workspace
    When I send workspace with its ID a GET request to /my/workspaces/582929
    Then I expect that <kind>,<id_workspace>,<name>,<id_owner>,<id_projects> workspace values are equals to

    Examples:
      |kind|id_workspace|name|id_owner|id_projects|
      |workspace|582929|danielWorkspaceTest|2008365|[]|


  @functional_test
  Scenario Outline: Verify that workspace values are valid with a projects
    Given I have set a connection to pivotal_tracker API service with workspace
    When I send workspace with its ID a GET request to /my/workspaces/582931
    Then I expect that <kind>,<id_workspace>,<name>,<id_owner>,<id_projects> workspace values are equals to

    Examples:
      |kind|id_workspace|name|id_owner|id_projects|
      |workspace|582931|danielWorkspaceTest2|2008365|[1601743]|


  @functional_test
  Scenario Outline: Verify that workspace values are valid with projects
    Given I have set a connection to pivotal_tracker API service with workspace
    When I send workspace with its ID a GET request to /my/workspaces/582933
    Then I expect that <kind>,<id_workspace>,<name>,<id_owner>,<id_projects> workspace values are equals to

    Examples:
      |kind|id_workspace|name|id_owner|id_projects|
      |workspace|582933|danielWorkspaceTest3|2008365|1601743_1601767_1601769|


  @functional_test
  Scenario: Verify that workspace values are correct type
    Given I have set a connection to pivotal_tracker API service with workspace
    When I send workspace with its ID a GET request to /my/workspaces/582929
    Then I expect that workspace values are correct type

  @negative_test
  Scenario: Workspace specific not exist
    Given I have set a connection to pivotal_tracker API service with workspace
    When I send workspace with its ID a GET request to /my/workspaces/55555
    Then I expect a message of error for workspace not exist


  @negative_test
  Scenario: The name of a workspace specific is sent as zero
    Given I have set a connection to pivotal_tracker API service with workspace
    When I send workspace with its ID a GET request to /my/workspaces/0
    Then I expect a message of error for id workspace is zero