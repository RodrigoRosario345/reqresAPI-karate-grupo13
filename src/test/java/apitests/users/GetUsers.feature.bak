Feature: Get Users

  Scenario: Get all users
    Given url baseUrl
    And path 'users'
    When method GET
    Then status 200
    * print response
    And match response.data == "#array"
    And assert response.data.length > 0


