@api_test
Feature: Manage accounts
  Retrieving account resources via this endpoint is restricted to Owners and Administrators for the Account specified. Non authorized users will receive an error.

  @account
  Scenario: Account Details
    Given I have set a connection to pivotal_tracker API service
    And I have an account with id 887587
    When I send a GET request to /accounts with the id
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
    Scenario: Create a new account membership
      Given I have set a connection to pivotal_tracker API service
      And I have an account with id 887587
      And I have the next membership:
      """
      {
      "email":"Lookas@example.com",
      "initials":"LO",
      "name":"Lookas possva"
      }
      """
      When I send a POST request to /accounts/887587/memberships
      Then I expect status code 200

