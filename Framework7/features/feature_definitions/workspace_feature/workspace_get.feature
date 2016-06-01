@Get_test
Feature: Final Project for Api Test

  @Smock_test
  Scenario: All workspace details without to send any value
    Given I have set a connection to pivotal_tracker API service with workspace
    When I send workspace a GET request to /my/workspaces
    Then I expect Status code 200 of workspace


  @Smock_test
  Scenario: Workspace details of id_workspace value specific
    Given I have set a connection to pivotal_tracker API service with workspace
    When I send workspace with its ID a GET request to /my/workspaces/581849
    Then I expect Status code 200 of workspace


  @Functional_test
  Scenario Outline: Verify that workspace values are valid
    Given I have set a connection to pivotal_tracker API service with workspace
    When I send workspace with its ID a GET request to /my/workspaces/581849
    Then I expect that <kind>,<id_workspace>,<name>,<id_owner>,<id_projects> workspace values are equals to

    Examples:
      |kind|id_workspace|name|id_owner|id_projects|
      |workspace|581849|workspace_tirth|1929595|[]|


  @Functional_test
  Scenario Outline: Verify that workspace values are valid with a projects
    Given I have set a connection to pivotal_tracker API service with workspace
    When I send workspace with its ID a GET request to /my/workspaces/582099
    Then I expect that <kind>,<id_workspace>,<name>,<id_owner>,<id_projects> workspace values are equals to

    Examples:
      |kind|id_workspace|name|id_owner|id_projects|
      |workspace|582099|workspace99|1929595|[1595979]|


  @Functional_test
  Scenario Outline: Verify that workspace values are valid with projects
    Given I have set a connection to pivotal_tracker API service with workspace
    When I send workspace with its ID a GET request to /my/workspaces/581703
    Then I expect that <kind>,<id_workspace>,<name>,<id_owner>,<id_projects> workspace values are equals to

    Examples:
      |kind|id_workspace|name|id_owner|id_projects|
      |workspace|581703|My_Firts_Workspace|1929595|1595919_1595927_1595931_1595933|


  @Functional_test
  Scenario: Verify that workspace values are correct type
    Given I have set a connection to pivotal_tracker API service with workspace
    When I send workspace with its ID a GET request to /my/workspaces/582099
    Then I expect that workspace values are correct type

