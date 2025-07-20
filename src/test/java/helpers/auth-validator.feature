@ignore
Feature: Authentication response validations
    Background:
  * def resultData = karate.get('resultData')
  * def parameters = karate.get('parameters') || {timeout: 3000, expectedError: 'Invalid credentials'}


  @validate-login-success
  Scenario: Validate login response success
    * match resultData.response.token == '#string'
    * assert resultData.responseTime < parameters.timeout

  @validate-register-success
  Scenario: Validate register response success
    * match resultData.response.token == '#string'
    * match resultData.response.id == '#number'
    * assert resultData.responseTime < parameters.timeout

  @validate-login-error
  Scenario: Validate login error response
    * match resultData.error == karate.get('expectedError')
    * assert resultData.responseTime < parameters.timeout

 
