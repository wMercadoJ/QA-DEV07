@story
Feature: Delete Story
  Background: Connection to pivotal tracker API REST
    Given I have set a connection to pivotal_tracker API service

  @smoke_test @functional_test
  Scenario Outline: Delete a Story by ID
    Given I have <project_id> of pivotal tracker project to story delete endpoint
    When I have the new_story_id of a new Story to delete it
    And I send the DELETE request to story delete endpoint /projects/<project_id>/stories/
    Then I should expect the status code 204 to Story delete endpoint

    Examples:
      | project_id  |
      | 1595957     |

  @negative_test
  Scenario Outline: Delete nonexistent story
    Given I have <project_id> of pivotal tracker project to story delete endpoint
    And I have the <nonexistent_story_id> ID of a Story to delete it
    When I send a DELETE request to story endpoint /projects/<project_id>/stories/<nonexistent_story_id>
    Then I should expect the status code 400 to Get request to Stories endpoint

    Examples:
      | project_id  |nonexistent_story_id    |
      | 1595957     |1   |

  @negative_test
  Scenario Outline: Delete story with empty ID
    Given I have <project_id> of pivotal tracker project to story delete endpoint
    And I have the <empty_story_id> ID of a Story to delete it
    When I send a DELETE request to story endpoint /projects/<project_id>/stories/<nonexistent_story_id>
    Then I should expect the status code 400 to Get request to Stories endpoint

    Examples:
      | project_id  |empty_story_id |
      | 1595957     ||
