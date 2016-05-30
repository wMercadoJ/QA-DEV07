Feature: Final Project for Ruby class

  @functional
  Scenario Outline: I get one project
    Given I have set a connection project to pivotal_tracker API service
    When I send a GET request the projects to /projects/<idProjects>
    Then I expect Status the projects code 200
    And it should have the field "Id" and "name" containing the value <idProjects> and <name>
    Examples:
      | idProjects | name |
      | 1595901     |   test  |
  @functional
  Scenario Outline: Create Tasks new Project
  Given I have set a connection to pivotal_tracker API service
  When I send a POST request to /projects with name project <nameProject>
   Then I expect Status code 200
  And I expect JSON for the name project equal a <nameProject>

    Examples:
    | nameProject |
    | Project_Home6 |

  @SmokeTest
  Scenario Outline: GET request
    Given I have set a connection project to pivotal_tracker API service
    When I send a GET request the projects to /projects/<idProjects>
    Then I expect Status the projects code 200
  Examples:
    | idProjects |
    | 1595901    |
  @SmokeTest
  Scenario Outline: : POST request with params
    Given I have set a connection to pivotal_tracker API service
    When I send a POST request to /projects with name project <nameProject>
    Then I expect Status code 200

  Examples:
  | nameProject |
  | Project_Home7 |
  | Project_Home8 |

  @SmokeTest
  Scenario Outline: : Delete request with params
    Given I have set a connection to pivotal_tracker API service
    When I a Delete the project  in request the projects to /projects/<id_project>
    Then I expect Status code 204

    Examples:
    |id_project|
    |1598003   |




