<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Info</title>
</head>
<body>
<%@include file="navBarRep.jsp" %>


	<b>Change password</b>
	<form action="changeCustomerInfoHandler" method="POST">
		<table>
			<tr>
				<td>User ID:</td><td><input type="text" name="userId" required/></td>
			</tr>
			<tr>
				<td>New password:</td><td><input type="text" name="new" required/></td>
			</tr>
		</table>
		<input type="submit" value="Submit"/>
	</form>
	
	
	<a href='customerRepPage.jsp'> Home </a>	<br/>
	
	
</body>
</html>