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
    When I send workspace with its ID a GET request to /my/workspaces/581709
    Then I expect Status code 200 of workspace


