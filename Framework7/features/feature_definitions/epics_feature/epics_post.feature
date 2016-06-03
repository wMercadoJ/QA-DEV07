@epics @api_test
Feature: post epics
  As a user
  i want to add new epics to my project
  because i need to make it easier to plan and track progress of large features at a high level

  Background: set connection to pivotal tracker API REST
    Given I have set a connection to pivotal_tracker API service
  @epics @smoke_test
  Scenario: create a new epic
    Given I have a project created on pivotal tracker
    And I have the id of that project
    And I have the next epic as JSON:
    """
    {
      "name":"Post example 1233"
    }
    """
    When I send an epic POST request to /projects/1600911/epics endpoint
    Then I expect status code 200

