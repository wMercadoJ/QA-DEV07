@story
Feature: Put Story

  @smoke_test
  Scenario Outline: Updates a Story by ID
    Given I have set a connection to pivotal_tracker API service
      And I have <project_id> of pivotal tracker project to story put endpoint
    When I have the <story_id> ID of a Story to update it
    And I send the <new_name> to update
      And I send a PUT request to story endpoint /projects/<project_id>/stories/<story_id>
    Then I should expect the status code 200 to Story PUT endpoint

    Examples:
      | project_id  |story_id    |new_name    |
      | 1595957     |120881785   | put_story  |

  @functional_test
  Scenario Outline: Updates a Story details
    Given I have set a connection to pivotal_tracker API service
    And I have <project_id> of pivotal tracker project to story put endpoint
    When I have the <story_id> ID of a Story to update it
    And I send the <new_name> to update
    And I send a PUT request to story endpoint /projects/<project_id>/stories/<story_id>
    Then I should expect the status code 200 to Story PUT endpoint
    And I should expect that the kind of this story is Story
    And I should validate that the name is string

    Examples:
      | project_id  |story_id    |new_name    |
      | 1595957     |120881785   | put_story  |

  @negative_test
  Scenario Outline: Updates a Story without name
    Given I have set a connection to pivotal_tracker API service
    And I have <project_id> of pivotal tracker project to story put endpoint
    When I have the <story_id> ID of a Story to update it
    And I send the <empty_new_name> to update
    And I send a PUT request to story endpoint /projects/<project_id>/stories/<story_id>
    Then I should expect the status code 400 to Story PUT endpoint

    Examples:
      | project_id  |story_id    |empty_new_name|
      | 1595957     |120881785   |              |

  @negative_test
  Scenario Outline: Updates a Story without ID
    Given I have set a connection to pivotal_tracker API service
    And I have <project_id> of pivotal tracker project to story put endpoint
    When I have the <empty_story_id> ID of a Story to update it
    And I send the <new_name> to update
    And I send a PUT request to story endpoint /projects/<project_id>/stories/<empty_story_id>
    Then I should expect the status code 404 to Story PUT endpoint

    Examples:
      | project_id  |empty_story_id    |new_name|
      | 1595957     |                  |PUT_NAME |

  @negative_test
  Scenario Outline: Updates a Story with ID nonexistent
    Given I have set a connection to pivotal_tracker API service
    And I have <project_id> of pivotal tracker project to story put endpoint
    When I have the <nonexistent_story_id> ID of a Story to update it
    And I send the <new_name> to update
    And I send a PUT request to story endpoint /projects/<project_id>/stories/<nonexistent_story_id>
    Then I should expect the status code 400 to Story PUT endpoint

    Examples:
      | project_id  |nonexistent_story_id    |new_name|
      | 1595957     |1                  |PUT_NAME |

  @negative_test
  Scenario Outline: Updates a Story without ID and NAME
    Given I have set a connection to pivotal_tracker API service
    And I have <project_id> of pivotal tracker project to story put endpoint
    When I have the <empty_story_id> ID of a Story to update it
    And I send the <empty_new_name> to update
    And I send a PUT request to story endpoint /projects/<project_id>/stories/<empty_story_id>
    Then I should expect the status code 404 to Story PUT endpoint

    Examples:
      | project_id  |empty_story_id    |empty_new_name|
      | 1595957     |                  | |