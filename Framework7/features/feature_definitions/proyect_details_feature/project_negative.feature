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
  Scenario Outline:  POST request with params empty
    Given I have set a connection to pivotal_tracker API service
    When I send a POST request to /projects with name project <nameProject>
    Then I expect Status the projects code 400

    Examples:
      | nameProject |
      |  |
      |  |

  @negative_test
  Scenario Outline: I get project that does not exist
    Given I have set a connection project to pivotal_tracker API service
    When I send a GET request the projects not exist to /projects/<idProjects>
    Then I expect Status the projects code 404
    And I expect the error message that the project not exist
    Examples:
      | idProjects |
      | 1598457    |

  @negative_test
  Scenario Outline:  POST request with params week_start_day not valid
    Given I have set a connection to pivotal_tracker API service
    When I send whit different values a POST request to /projects with name project <nameProject> week start day <start_day>
    Then I expect Status the projects code 400
    And I expect the error message that the project not exist

    Examples:
      | nameProject |start_day|
      |  Project 1|   May        |
      |  Project 2|   June        |