Feature: Actualizar recurso en ReqRes API con datos dinámicos

Background:
  * url 'https://reqres.in/api'
  * configure headers = { 'x-api-key': 'reqres-free-v1' }

  # Definiciones generales para usar en los escenarios
  * def randomName = call read('classpath:utils/generateRandomColorName.js')
  * def year = 2000 + Math.floor(Math.random() * 25)  
  * def randomColor = call read('classpath:utils/generateRandomHexaName.js')
  * def randomPantone = '19-' + Math.floor(1000 + Math.random() * 9000)
  

@create-and-update-resource
Scenario Outline: Crear y actualizar recurso dinámicamente - <name>
  * def createPayload =
  """
  {
    "name": "<name>",
    "year": <year>,
    "color": "<color>",
    "pantone_value": "<pantone_value>"
  }
  """
  Given path 'unknown'
  And request createPayload
  When method post
  Then status 201
  * def createdId = response.id
  * print 'Recurso creado con ID:', createdId

  #  Actualizar ese recurso con datos aleatorios
  * def updatePayload =
  """
  {
    "name": "#(randomName)",
    "year": #year,
    "color": "#(randomColor)",
    "pantone_value": "#(randomPantone)"
  }
  """
  Given path 'unknown', createdId
  And request updatePayload
  When method put
  Then status 200

  # Validaciones básicas
  And match response.name == randomName
  And match response.color == randomColor
  And match response.pantone_value == randomPantone

  * print 'Recurso actualizado:', response

    Examples:
      | read('classpath:data/recurso.csv') |