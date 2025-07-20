Feature: Eliminar la lista de recurso disponible en ReqRes API

  Background:
    * def config = call read('classpath:helpers/config-helper.feature@get-config')
    * url config.result.baseUrl
    * headers config.result.defaultHeaders


  Scenario: Obtener lista de recursos
    #Given url 'https://reqres.in/api/unknown'
    Given path 'resource'
    When method GET
    Then status 200
    * print response
    * def resources = response.data
    * def result = karate.eval("resources.map(r => r.name)")
    * print result

  Scenario: Eliminar recurso con id aleatorio
    * def resource = 'resource'

    * def updateId = Math.floor(Math.random() * 12) + 1
 
    # Eliminar recurso por id
    Given path resource, updateId
    When method DELETE
    Then status 204
    * match response == ""
