@epics @api_test
Feature: Update Epic
  As a user
  I want to update information of  epics
  Because i need fix some mistakes or miss spells on field values

  Background: set connection to pivotal tracker API REST
    Given I have set a connection to pivotal_tracker API service
    @epics @smoke_test
    Scenario: Update epic
      Given I have a project created on pivotal tracker
      And I have the id of that project
      And I have the next epic created
      """
      {
        "name": "Epic PUT testing"
      }
      """
      When I send example as the new name of the epic
      And I send a epic UPDATE request to /projects/1600911/epics endpoint
      Then I expect status code 200
      And I should delete the epic created
