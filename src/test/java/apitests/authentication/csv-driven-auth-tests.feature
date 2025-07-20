Feature: CSV Driven Authentication with Auth Helper

  Background:
    * def config = call read('classpath:helpers/config-helper.feature@get-config')
    * def dataGenerator = eval(read('classpath:utils/dataGenerator.js'))()
    * def password = dataGenerator.generatePassword()
    * url config.result.baseUrl
    * headers config.result.defaultHeaders

  @register-users-csv
  Scenario Outline: Register user from CSV - <first_name> <last_name>
    * def credentials = { email: '<email>', password: '#(password)' }
    # Ejecutando el registro con credenciales
    * def data = call read('classpath:helpers/auth-helper.feature@register-with-credentials') credentials
    # Validando el registro exitoso
    * call read('classpath:helpers/auth-validator.feature@validate-register-success') { resultData: '#(data)' }

    Examples:
      | read('classpath:data/users.csv') |

  @login-users-csv
  Scenario Outline: Login user from CSV - <email>
    * def credentials = { email: '<email>', password: '#(password)' }
    * def data = call read('classpath:helpers/auth-helper.feature@login-with-credentials') credentials
    * call read('classpath:helpers/auth-validator.feature@validate-login-success') { resultData: '#(data)' }

    Examples:
      | read('classpath:data/users.csv') |