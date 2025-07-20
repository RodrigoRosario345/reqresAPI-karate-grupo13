Feature: Eliminar la lista de recurso disponible en ReqRes API

  Background:
     Background:
    * url 'https://reqres.in/api'
    * configure headers = { 'x-api-key': 'reqres-free-v1' }

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
    * def resource = 'unknown'

    # Obtener lista de recursos
    Given path resource
    When method GET
    Then status 200
    * def resourceId = response.data
    * print 'Recurso a eliminar: ', resourceId
    # Obtener detalle del recurso antes de eliminar
 
    * def result = read('classpath:utils/generaRandonID.js')(resourceId)
    * def resourceId = result.id
    * def recursoAEliminar = result.data
    * print ' Recurso aleatorio a eliminar:', recursoAEliminar
    # Validar que el recurso existe  

    # Eliminar recurso por id
    Given path resource, resourceId
    When method DELETE
    Then status 204
 * print 'NOTA: La API https://reqres.in es simulada. El recurso eliminado fue:', recursoAEliminar


 