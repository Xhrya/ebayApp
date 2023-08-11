<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebay Website</title>
<body>

<%
    if ((session.getAttribute("user") == null)) 
    {%>
	You are not logged in<br/>
	<a href="login.jsp">Please Login</a>
	<%} 
    else if(session.getAttribute("user").toString().equals("admin"))
    {%>
    	<jsp:include page='adminPage.jsp'/>
	
	<%} 
	else if(session.getAttribute("user").toString().equals("taylor"))
	{%>
		<jsp:include page='customerRepPage.jsp'/>
	<%} 
    else {%>
	
		<jsp:include page='welcome.jsp'/>
	
	<br/>
	<a href='logout.jsp'>Log out</a>
<%}%>

</body>
</html>