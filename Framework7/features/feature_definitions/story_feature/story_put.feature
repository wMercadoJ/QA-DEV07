@story
Feature: Story

  @smoke_testing_story
  Scenario Outline: Updates a Story by ID
    Given I have set connection to pivotal tracker API service
      And I have <project_id> of pivotal tracker project to story put endpoint
    When I have the <story_id> ID of a Story to update it
      And I send a PUT request to story endpoint /projects/<project_id>/stories/<story_id>
    Then I should expect the status code 200 to Story PUT endpoint

    Examples:
      | project_id  |story_id    |
      | 1595957     |120726863   |