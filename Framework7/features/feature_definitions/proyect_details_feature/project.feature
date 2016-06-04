Feature: Final Project for Ruby class

  @functional
  Scenario Outline: I get one project
    Given I have set a connection project to pivotal_tracker API service
    When I send a GET request the projects to /projects/<idProjects>
    Then I expect Status the projects code 200
    And it should have the field "Id" and "name" containing the value <idProjects> and <name>
    Examples:
      | idProjects | name |
      | 1598453     |   getProject  |
  @functional_test
  Scenario Outline: Create Tasks new Project
  Given I have set a connection to pivotal_tracker API service
  When I send a POST request to /projects with name project <nameProject>
   Then I expect Status the projects code 200
  And I expect JSON for the name project equal a <nameProject>

    Examples:
    | nameProject |
    | Project_Home12 |

  @smoke_test
  Scenario Outline: GET request
    Given I have set a connection project to pivotal_tracker API service
    When I send a GET request the projects to /projects/<idProjects>
    Then I expect Status the projects code 200
  Examples:
    | idProjects |
    | 1598453    |
  @smoke_test
  Scenario Outline: : POST request with params
    Given I have set a connection to pivotal_tracker API service
    When I send a POST request to /projects with name project <nameProject>
    Then I expect Status the projects code 200

  Examples:
  | nameProject |
  | Project_Home1 |
  | Project_Home2 |
  | Project_Home3 |
  | Project_Home4 |

  @smoke_test
  Scenario: Delete request with params
    Given I have set a connection to pivotal_tracker API service
    And I have have  least one project create in /projects/
    When I a Delete the project  in request the projects to /projects/
    Then I expect Status the projects code 204


  @functional_test
  Scenario Outline: Verified that kind have value equals a project
      Given I have set a connection project to pivotal_tracker API service
      When I send a GET request the projects to /projects/<idProjects>
      Then I expect Status the projects code 200
      And I expect kind field in the project is equals a project
    Examples:
    | idProjects |
    | 1598453    |

  @functional_test
  Scenario Outline: Verified that name have length 50
    Given I have set a connection project to pivotal_tracker API service
    When I send a GET request the projects to /projects/<idProjects>
    Then I expect Status the projects code 200
    And I expect name project is less than 50 letters
    Examples:
      | idProjects |
      | 1598453    |
  @functional_test
  Scenario: Validate project attributes
    Given I have set a connection project to pivotal_tracker API service
    When I send a GET request the projects to /projects/1598453
    Then I expect Status the projects code 200
    And I expect the project should have the new attributes:
      | attribute | type   |
      | kind      | String |
      | id     | Integer |
      | name     | String |
      | iteration_length     | String |
      | week_start_day     | date |

  @functional_test
  Scenario: Validate project attributes id size
    Given I have set a connection project to pivotal_tracker API service
    When I send a GET request the projects to /projects/1598453
    Then I expect Status the projects code 200
    And I expect the project should id have less than 7 characters:

  @smoke_test
  Scenario Outline: : Validate values project
    Given I have set a connection to pivotal_tracker API service
    When I send a POST request to /projects with name project <nameProject>
    Then I expect Status the projects code 200
    And I expect validate the values of the projects return by request

    Examples:
      | nameProject |
      | Project_Home24|
      | Project_Home25|
      | Project_Home26|

  @functional_test
  Scenario Outline:  POST request with params week_start_day
    Given I have set a connection to pivotal_tracker API service
    When I send whit different values a POST request to /projects with name project <nameProject> week start day <start_day>
    Then I expect Status the projects code 200
    And I expect validate the values of the projects return by request

    Examples:
      | nameProject |start_day|
      |  Project 1|  sunday         |
      |  Project 2|   monday        |









