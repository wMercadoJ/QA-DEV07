@api_test
Feature: Final Project for Ruby class

  @test
  Scenario: Account Details
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request to the endpoint accounts with the id 887587
    Then I expect that my account will be validated