@stories
  Feature: Stories
    Background: Connection to pivotal tracker API REST
      Given I have set a connection to pivotal_tracker API service
    @smoke_test
    Scenario Outline: Stories endpoint
      Given I have stories created in pivotal tracker
      When I send the GET request to /projects/<project_id>/stories to Stories endpoint
      Then I should expect the status code 200 to Get request to Stories endpoint

      Examples:
        | project_id |
        | 1595957    |

    @smoke_test
    Scenario Outline: New Story
      Given I have <project_id> of pivotal tracker project to Stories endpoint
      When I have the <name_story> name of new story
        And I send a POST request to /projects/<project_id>/stories to Stories endpoint
      Then I should expect the status code 200 for post request to Stories endpoint

      Examples:
        | project_id |name_story  |
        | 1595957    |story_smoke   |

    @functional_test
    Scenario Outline: Details new Story
      Given I have <project_id> of pivotal tracker project to Stories endpoint
      When I have the <name_story> name of new story
      And I send a POST request to /projects/<project_id>/stories to Stories endpoint
      Then I should expect the status code 200 for post request to Stories endpoint
      And I should expect that the kind of this story is Story
      And I should validate that the name is string

      Examples:
        | project_id |name_story  |
        | 1595957    |story_details   |

    @negative_test
    Scenario Outline: Stories nonexistent project
      Given I send the GET request to /projects/<nonexistent_project_id>/stories with nonexistent project ID
      Then I should expect the status code 404 to Get request to Stories endpoint

      Examples:
        | nonexistent_project_id |
        | 1234567    |

    @negative_test
    Scenario Outline: New Story with empty name
      Given I have <project_id> of pivotal tracker project to Stories endpoint
      When I have the empty name for a new story
      And I send a POST request to /projects/<project_id>/stories to Stories endpoint
      Then I should expect the status code 400 for post request to Stories endpoint with name different to string

      Examples:
        | project_id |
        | 1595957    |

    @negative_test
    Scenario Outline: New Story with integer name
      Given I have <project_id> of pivotal tracker project to Stories endpoint
      When I have the number <integer_name> for a new story
      And I send a POST request to /projects/<project_id>/stories to Stories endpoint
      Then I should expect the status code 400 for post request to Stories endpoint with name different to string

      Examples:
        | project_id |integer_name|
        | 1595957    |123456789   |