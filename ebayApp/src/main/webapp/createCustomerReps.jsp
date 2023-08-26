<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="navbarAdmin.jsp" %>


	<div class="content">
	<form action="createRepHandler.jsp" method="POST">
	
		
		<label for="userId"> Username </label> 
		<input type="text" name="userId" id="userId"
			placeholder="Enter user name" required> <br>
			
			
		<label for="password"> password </label> 
		<input type="text" name="password" id="password" placeholder="Enter password" required> <br>

		<label for=email> Email </label> <input type="text"
			name="email" id="email" placeholder="Enter rep email" required>
		<br> 
		
		<label for=firstName> First Name </label> <input type="text"
			name="firstname" id="firstname" placeholder="Enter rep first name" required>
		<br> 
		
		<label for=lastName> lastName </label> <input type="text"
			name="lastName" id="lastName" placeholder="Enter rep last name" required>
		<br> 
		
					<input type="submit" value="Submit">
		
		
		
		

	</form>
	</div>

</body>
</html>