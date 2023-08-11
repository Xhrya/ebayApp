<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Page!</title>
</head>
<body>
	Welcome <%=session.getAttribute("user")%>! It's great to see you :)

	<h1>Login Successful</h1>
	
	<h2> Buyer Menu</h2>
	
	
	<h2> Seller Menu</h2>
</body>
</html>