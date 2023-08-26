<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.*"%>

   <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 <%@include file="navbar.jsp" %>

	<%
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		
		Statement stmt = con.createStatement();
		String userId = request.getParameter("userId");
		String password = request.getParameter("new");
		
		
		String update = "UPDATE user SET password=? WHERE userId=?";
		PreparedStatement ps = con.prepareStatement(update);				
		ps.setString(1, password);
		ps.setString(2, userId);
		ps.executeUpdate();
		
		con.close();
	%>


</body>
</html>