@ignore
@data-helper
Feature: Data Management Helper

  Background:
    * def dataGenerator = eval(read('classpath:utils/dataGenerator.js'))()

  @load-users-csv
  Scenario: Load users from CSV
    * def users = read('classpath:data/users.csv')
    * def result = users

  @get-random-user
  Scenario: Get random user from dataset
    * def users = call read('classpath:helpers/data-helper.feature@load-users-csv')
    * def randomUser = dataGenerator.getRandomUser(users.result)
    * def result = randomUser

  @generate-test-data
  Scenario: Generate dynamic test data
    * def baseUser = call read('classpath:helpers/data-helper.feature@get-random-user')
    * def testData = dataGenerator.generateDynamicData(baseUser.result)
    * def result = testData

  @generate-password
  Scenario: Generate secure password
    * def length = karate.get('length', 8)
    * def password = dataGenerator.generatePassword(length)
    * def result = password
