@stories
  Feature: Stories

    @smoke_testing_stories
    Scenario Outline: New Story by name
      Given I have set connection to pivotal tracker API service
        And I have <project_id> of pivotal tracker project to Stories endpoint
      When I have the <name_story> name of new story
        And I send a POST request to /projects/<project_id>/stories to Stories endpoint
      Then I should expect the status code 200 to Stories endpoint
        And I should validate the name and project_id story

      Examples:
        | project_id |name_story  |
        | 1595957    |story_test_new  |