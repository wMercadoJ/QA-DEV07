@api_test
Feature: Final Project for Api Test

  @test
  Scenario: All workspaces details
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request to /my/workspaces
    Then I expect Status code 200
    And I expect WorkspaceDetails Object