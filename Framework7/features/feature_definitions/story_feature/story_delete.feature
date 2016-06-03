@story
Feature: Story

  @smoke_test
  Scenario Outline: Delete a Story by ID
    Given I have set a connection to pivotal_tracker API service
    And I have <project_id> of pivotal tracker project to story delete endpoint
    When I have the <story_id> ID of a Story to delete it
    And I send a DELETE request to story endpoint /projects/<project_id>/stories/<story_id>
    Then I should expect the status code 400 to Story delete endpoint

    Examples:
      | project_id  |story_id    |
      | 1595957     |120805289   |