@stories
Feature: Story

  @smoke_testing_story
  Scenario Outline: Get Story by ID
    Given I have set connection to pivotal tracker API service
    And I have <project_id> of pivotal tracker project to Story endpoint
    When I have the <story_id> ID of a Story
    And I send a GET request /projects/<project_id>/stories/<story_id> to Story endpoint
    Then I should expect the status code 200 to Story endpoint

    Examples:
      | project_id  |story_id    |
      | 1595957     |120727153   |