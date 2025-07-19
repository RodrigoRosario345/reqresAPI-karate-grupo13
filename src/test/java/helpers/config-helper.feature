@ignore
@config-helper
Feature: Configuration Helper

  Background:
    * def config =
      """
      {
        "baseUrl": "https://reqres.in/api",
        "defaultHeaders": {
          "x-api-key": "reqres-free-v1",
          "Content-Type": "application/json"
        },
        "endpoints": {
          "login": "/login",
          "register": "/register",
          "users": "/users"
        },
        "timeouts": {
          "default": 3000,
          "long": 5000
        }
      }
      """

  @get-config
  Scenario: Get application configuration
    * def result = config
  