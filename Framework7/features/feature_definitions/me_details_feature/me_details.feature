@api_test
Feature: Final Project for Ruby class

  @test
  Scenario: Me Details
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request to /me
    Then I expect Status code 200
    And I expect MeDetails Object
