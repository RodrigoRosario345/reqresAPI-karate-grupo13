Feature: Actualizar recurso en ReqRes API con datos dinámicos

  Background:
    * def config = call read('classpath:helpers/config-helper.feature@get-config')
    * url config.result.baseUrl
    * headers config.result.defaultHeaders


    # Definiciones generales para usar en los escenarios
    * def randomName = call read('classpath:utils/generateRandomColorName.js')
    * def year = 2000 + Math.floor(Math.random() * 25)  
    * def randomColor = call read('classpath:utils/generateRandomHexaName.js')
    * def randomPantone = '19-' + Math.floor(1000 + Math.random() * 9000)

    * print 'Datos aleatorios generados:', randomName, year, randomColor, randomPantone
  

    @create-and-update-resource
  Scenario Outline: Crear y actualizar recurso dinámicamente - <name>

    * def createdId = Math.floor(Math.random() * 12) + 1
    #  Actualizar ese recurso con datos aleatorios
    * def updatePayload =
    """
    {
      "name": '#(randomName)',
      "year": '#(year)',
      "color": '#(randomColor)',
      "pantone_value": '#(randomPantone)'
    }
    """
    Given path 'resource', createdId
    And request updatePayload
    When method PUT
    Then status 200

    # Validaciones básicas
    And match response.name == randomName
    And match response.color == randomColor
    And match response.pantone_value == randomPantone

    * print 'Recurso actualizado:', response

    Examples:
      | read('classpath:data/recurso.csv') |