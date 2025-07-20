Feature: Casos básicos de prueba para el endpoint /users

  Background:
    * def config = call read('classpath:helpers/config-helper.feature@get-config')
    * url config.result.baseUrl
    * headers config.result.defaultHeaders

  Scenario: Obtener lista de usuarios (GET)
    Given path 'users'
    When method get
    Then status 200
    And match response.data[0].id != null

  Scenario: Crear un nuevo usuario (POST)
    Given path 'users'
    And request { name: 'Juan', job: 'Tester' }
    When method post
    Then status 201
    And match response.name == 'Juan'
    And match response.job == 'Tester'

  Scenario: Eliminar un usuario (DELETE)
    Given path 'users/2'
    When method delete
    Then status 204
