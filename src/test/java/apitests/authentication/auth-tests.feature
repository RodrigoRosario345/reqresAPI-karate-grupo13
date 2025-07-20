Feature: Authentication Tests

  Background:
    * def config = call read('classpath:helpers/config-helper.feature@get-config')
    * def dataHelper = read('classpath:helpers/data-helper.feature')
    * url config.result.baseUrl
    * headers config.result.defaultHeaders

  @positive-tests
  Scenario Outline: <testCase> - Success scenarios
    * def testData = call read('classpath:helpers/data-helper.feature@generate-test-data')
    * def email = '<email>' == 'DYNAMIC' ? testData.result.email : '<email>'
    * def password = '<password>' == 'DYNAMIC' ? testData.result.password : '<password>'
    
    Given path '<endpoint>'
    And request { email: '#(email)', password: '#(password)' }
    When method POST
    Then status <expectedStatus>
    And assert responseTime < <timeout>
    And match response.<responseField> == '#string'
    
    Examples:
      | testCase                           | endpoint  | email               | password   | expectedStatus | responseField | timeout |
      | POST_Login_ValidCredentials        | /login    | eve.holt@reqres.in  | cityslicka | 200            | token         | 3000   |
      | POST_Login_DynamicCredentials      | /login    | DYNAMIC             | DYNAMIC    | 200            | token         | 3000   |
      | POST_Register_ValidCredentials     | /register | emma.wong@reqres.in | pistol     | 200            | token         | 3000   |
      | POST_Register_DynamicCredentials   | /register | DYNAMIC             | DYNAMIC    | 200            | token         | 3000   |

  @negative-tests
  Scenario Outline: <testCase> - Error scenarios
    Given path '<endpoint>'
    And request <requestBody>
    When method POST
    Then status <expectedStatus>
    And assert responseTime < 3000
    And match response.error == '<expectedError>'
    
    Examples:
      | testCase                        | endpoint    | requestBody                       | expectedStatus | expectedError           |
      | POST_Login_MissingPassword      | /login      | { "email": "rodrigocruz@klaven" } | 400            | Missing password        |
      | POST_Register_MissingPassword   | /register   | { "email": "rodriogrosario@fife" }| 400            | Missing password        |

  # @invalid-path-tests
  # Scenario Outline: <testCase> - Invalid path scenarios
  #   Given path '<endpoint>'
  #   And request { "email": "test@test.com", "password": "test123" }
  #   When method POST
  #   Then status <expectedStatus>
    
  #   Examples:
  #     | testCase                     | endpoint     | expectedStatus |
  #     | POST_Login_InvalidPath       | /loginn      | 404            |
  #     | POST_Register_InvalidPath    | /registern   | 404            |

