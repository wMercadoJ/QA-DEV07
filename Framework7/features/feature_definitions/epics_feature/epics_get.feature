@epics @api_test
Feature: GET epic information
  As a user
  I want to get  information of the epics
  Because i need to know the values of each property

  Background: set connection to pivotal tracker API REST
    Given I have set a connection to pivotal_tracker API service

    @smoke_test
    Scenario: Get all epics
      Given I have a project created on pivotal tracker
      And I have the id of that project
      When I send a epic GET request to /projects/1600911/epics endpoint
      Then I expect status code 200
