Feature: Get all countries
	Background:
		* url 'https://restcountries.eu'
		* header Accept = 'application/json'
	Scenario: Get list of all countries
		Given path '/rest/v2/all'
		When method get
		Then status 200
		
	Scenario: Get countries by name at path
		Given path '/rest/v2/name/india'
		When method get
		Then status 200
		
	Scenario: Get countries by name as parameter
		Given path '/rest/v2/name/india'
		And param fullText = 'true'
		When method get
		Then status 200