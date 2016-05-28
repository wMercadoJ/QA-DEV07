@accounts @api_test
Feature: Manage accounts
  Retrieving account resources via this endpoint is restricted to Owners and Administrators for the Account specified. Non authorized users will receive an error.
  @accounts @smoke
    Scenario: Accounts endpoint availability
      Given I have set a connection to pivotal_tracker API service
      When I send a GET request to /accounts endpoint
      Then I expect status code 200

  @accounts @functional
    Scenario: Account Details
      Given I have set a connection to pivotal_tracker API service
      And I have an account with id 887587
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
  @accounts @acceptance
  Scenario: Validate account attributes
    Given I have set a connection to pivotal_tracker API service
    And I have an account with id 887587
    When I send a GET request to /accounts endpoint
    Then I expect status code 200
    And The accounts should have the nex attributes:
      | attribute | type   |
      | kind      | String |
      | id     | Integer |
      | name     | String |
      | plan     | String |
      | status     | String |
      | created_at     | Date |
      | updated_at     | String |

