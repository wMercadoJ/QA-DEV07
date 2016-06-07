Feature: Get Epic
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

    @smoke_test
    Scenario: Get epic by id
      Given I have a project created on pivotal tracker
      And I have the id of that project
      And I have the ids of the epics
      And I send a epic GET request to /projects/1600911/epics endpoint
      Then I expect epic status code 200


    @functional_test
    Scenario: validate epic fields by id
      Given I have a project created on pivotal tracker
      And I have the id of that project
      And I have the ids of the epics
      And I send a epic GET request to /projects/1600911/epics endpoint
      And I expect true as result of epics fields validations
