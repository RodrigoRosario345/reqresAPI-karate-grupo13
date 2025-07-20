Feature: Crear recursos en /api/unknown usando CSV

  Background:
    * def config = call read('classpath:helpers/config-helper.feature@get-config')
    * url config.result.baseUrl
    * headers config.result.defaultHeaders


  @create-resources-csv
  Scenario Outline: Crear recurso desde CSV - <name>
    * def payload =
    """
    {
      "name": "<name>",
      "year": <year>,
      "color": "<color>",
      "pantone_value": "<pantone_value>"
    }
    """
    Given path 'unknown'
    And request payload
    When method post
    Then status 201

    # Validaciones
    And match response.id == '#notnull'
    And match response.name == '<name>'
    And match response.year == <year>
    And match response.color == '<color>'
    And match response.pantone_value == '<pantone_value>'

    * print 'Recurso creado:', response

    Examples:
      | read('classpath:data/recurso.csv') |

  
        
        
