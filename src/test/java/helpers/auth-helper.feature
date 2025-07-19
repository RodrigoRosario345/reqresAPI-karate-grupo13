@ignore
@auth-helper
Feature: Authentication Helper

  Background:
    * def config = call read('classpath:helpers/config-helper.feature@get-config')
    * url config.result.baseUrl
    * headers config.result.defaultHeaders

  @get-valid-users
  Scenario: Get valid users from API
    Given path config.result.endpoints.users
    When method GET
    Then status 200
    And match response.data == '#array'
    * def result = response.data

  @login-with-credentials
  Scenario: Login with provided credentials
    * def email = karate.get('email')
    * def password = karate.get('password')
    Given path config.result.endpoints.login
    And request { email: '#(email)', password: '#(password)' }
    When method POST
    Then status 200
    And match response.token == '#string'
    * def result = { token: response.token, email: email }

  @register-with-credentials
  Scenario: Register with provided credentials
    * def email = karate.get('email')
    * def password = karate.get('password')
    Given path config.result.endpoints.register
    And request { email: '#(email)', password: '#(password)' }
    When method POST
    Then status 200
    * def result = response