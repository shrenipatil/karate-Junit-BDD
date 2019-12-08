
Feature:check list of all user
	Background:
		* url 'https://gorest.co.in'
		* header Authorization = 'Bearer W6528NuugMYuHhwC4tLgCd_W775BXbUa7-OO'
	
	Scenario: Get all list of user
		Given path '/public-api/users'
		When method get
		Then status 200
		
	Scenario: Get list of user by first name
		Given path '/public-api/users'
		And param first_name = 'june'
		When method get
		Then status 200
		
		And def userResponse = response
		Then match userResponse.result[*].first_name contains ["june"]
		
	Scenario: Create new user
		Given path '/public-api/users'
		And request {"first_name":"june","last_name":"Collier","gender":"female","dob":"1957-06-28","email":"abc@example.com","phone":"1234567890","website":"http://www.abc.com","address":"abc.abc","status":"active"} 
		When method post
		Then status 200
		
	Scenario: Get single of user by id as path variable
		Given path '/public-api/users/1790'
		When method get
		Then status 200
		
		And def userResponse = response
		Then match userResponse.result.id == "1790"
	
	Scenario: Update the user details by its id as path variable
		Given path '/public-api/users/1790'
		# And request {"first_name":"june","last_name":"Collier","gender":"female","dob":"1957-06-28","email":"abc@example.com","phone":"1234567890","website":"http://www.abc.com","address":"abc.abc.abc","status":"inactive"}
		And request {"dob":"1990-11-11"}
		When method put
		Then status 200
		
		And def userResponse = response
		Then match userResponse.result.dob == "1990-11-11"
	
	@Test	
	Scenario: Check pagination
		Given path '/public-api/users'
		And param page = '4'
		When method get
		Then status 200	
	And def userResponse = response
	Then match userResponse._meta.currentPage == 4