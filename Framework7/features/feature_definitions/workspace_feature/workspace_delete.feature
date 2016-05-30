@Delete_test
Feature: Final Project for Api Test

  @Smock_test
  Scenario: Status code 208 when delete new Workspace with name only
    Given I have set a connection to pivotal_tracker API service with workspace
    When I send workspace with its ID a DELETE request to /my/workspaces/581709
    Then I expect Status code 208 of workspace
