Feature: Final Project for Ruby class

  Scenario Outline: List Proyects
    Given I have set a connection proyect to pivotal_tracker API service
    When I send a GET request the proyects to /projects/<idProyects>
    Then I expect Status the proyects code 200
    And I expects proyec Details Object
    Examples:
      | idProyects |
      | 1595901     |

  Scenario Outline: Create Tasks new Project
  Given I have set a connection to pivotal_tracker API service
  When I send a POST request to /projects with json
       """
  {
  "name": "<nameProyect>"
  }
		"""
  Then I expect Status code 200
  And I expect JSON for the Item equal to

    Examples:
    | nameProyect |
    | Proyect_Home1 |


