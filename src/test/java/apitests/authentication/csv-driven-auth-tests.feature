Feature: CSV Driven Authentication with Auth Helper

  Background:
    * def config = call read('classpath:helpers/config-helper.feature@get-config')
    * def dataGenerator = eval(read('classpath:utils/dataGenerator.js'))()
    * url config.result.baseUrl
    * headers config.result.defaultHeaders

  @register-users-csv
  Scenario Outline: Register user from CSV - <first_name> <last_name>
    * def password = dataGenerator.generatePassword()
    * def credentials = { email: '<email>', password: '#(password)' }
    * def result = call read('classpath:helpers/auth-helper.feature@register-with-credentials') credentials
    * print 'Register result:', result

    Then match result == '#object'

    Examples:
      | read('classpath:data/users.csv') |

  @login-users-csv
  Scenario Outline: Login user from CSV - <email>
    * def password = dataGenerator.generatePassword()
    * def credentials = { email: '<email>', password: '#(password)' }

    * def response = call read('classpath:helpers/auth-helper.feature@login-with-credentials') credentials
    * print 'Login result:', response.result

    Then match response.result == '#object'

    Examples:
      | read('classpath:data/users.csv') |