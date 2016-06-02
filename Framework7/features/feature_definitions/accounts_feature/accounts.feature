@accounts @api_test
Feature: Manage accounts
  Retrieving account resources via this endpoint is restricted to Owners and Administrators for the Account specified. Non authorized users will receive an error.

  Background: set connection to pivotal tracker API REST
    Given I have set a connection to pivotal_tracker API service
  @accounts @smoke_test
    Scenario: Accounts endpoint availability
      Given I have a set of accounts
      When I send a GET request to /accounts endpoint
      Then I expect status code 200

  @accounts @functional_test
    Scenario: Account Details
      Given I have an account with id 887587
      When I send a GET request to /accounts endpoint
      Then I expect status code 200
      And The response should be the next JSON:
      """
        {
            "kind": "account",
            "id": 887587,
            "name": "Henrry Account",
            "plan": "Free",
            "status": "active",
            "created_at": "2016-05-24T22:10:41Z",
            "updated_at": "2016-05-24T22:10:41Z"
        }
      """
  @accounts @acceptance_test
  Scenario: Validate account attributes
    Given I have an account with id 887587
    When I send a GET request to /accounts endpoint
    Then I expect status code 200
    And I expect true as result of fields validations

  @summary_account @smoke_test
  Scenario: Get account summaries
    Given I have a set of accounts
    When I send a GET request to /account_summaries?with_permission=project_creation endpoint
    Then I expect status code 200

  @summary_account @acceptance_test
  Scenario: Validate summary account attributes
    Given I have a set of accounts
    When I send a GET request to /account_summaries?with_permission=project_creation endpoint
    Then I expect status code 200
    And I expect true as result of fields validations