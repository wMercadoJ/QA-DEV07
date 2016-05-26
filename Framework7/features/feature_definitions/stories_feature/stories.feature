@stories
  Feature: Stories

    @new_stories
    Scenario Outline: Create New Story
      Given I have set a connection to pivotal tracker API service
        And I have <project_id> of pivotal tracker project
      When I have the <name_story> name of story
        And I send a POST request to /projects/<project_id>/stories
      Then I should create a new story
        And I should validate object details

      Examples:
        | project_id |name_story|
        | 1595957    |story_test |