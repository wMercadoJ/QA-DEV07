Feature: Get Story
  Background: Connection to pivotal tracker API REST
    Given I have set a connection to pivotal_tracker API service
  @smoke_test
  Scenario Outline: Get Story by ID
    Given I have <project_id> of pivotal tracker project to Story endpoint
    When I have the <story_id> ID of a Story
    And I send a GET request /projects/<project_id>/stories/<story_id> to Story endpoint
    Then I should expect the status code 200 to Story endpoint

    Examples:
      | project_id  |story_id    |
      | 1595957     |120881765   |

  @functional_test
  Scenario Outline: Details Story
    Given I have <project_id> of pivotal tracker project to Story endpoint
    When I have the <story_id> ID of a Story
    And I send a GET request /projects/<project_id>/stories/<story_id> to Story endpoint
    Then I should expect the status code 200 for post request to Stories endpoint
    And I should expect that the kind of story is Story
    And I should validate that the name of story is string

    Examples:
      | project_id |story_id  |
      | 1595957    |120881765   |

  @negative_test
  Scenario Outline: Get Story with string ID
    Given I have <project_id> of pivotal tracker project to Story endpoint
    When I have the <string_story_id> ID of a Story
    And I send a GET request /projects/<project_id>/stories/<string_story_id> to Story endpoint
    Then I should expect the status code 400 for post request to Stories endpoint

    Examples:
      | project_id  |string_story_id    |
      | 1595957     | ID  |