Feature: Final Project API

  @negative_test
  Scenario Outline: I get project that does not exist
    Given I have set a connection project to pivotal_tracker API service
    When I send a GET request the projects not exist to /projects/<idProjects>
    Then I expect Status the projects code 404
    Examples:
      | idProjects |
      | 1598453     |

  @negative_test
  Scenario Outline: I get project that does not exist
    Given I have set a connection project to pivotal_tracker API service
    When I send a GET request the projects not exist to /projects/<idProjects>
    Then I expect Status the projects code 404
    And I expect the error message that the project not exist
    Examples:
      | idProjects |
      | 1598457    |

