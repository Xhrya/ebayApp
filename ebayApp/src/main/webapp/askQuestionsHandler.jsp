<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.*"%>

<%@ page import="java.io.*,java.util.*,java.sql.*,java.time.LocalDateTime"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	String user = session.getAttribute("user").toString(); // Replace with the actual end user ID
	String question = request.getParameter("question");
	LocalDateTime postedTime = LocalDateTime.now();
	
	ApplicationDB db = new com.ApplicationDB();
	Connection conn = db.getConnection();
	
	Statement stmt = conn.createStatement();
	
	try {
		String resultQuery = "INSERT INTO question(user_id, question, status, postedTime) values ('" + user + "','" + question+ "','pending', '" + postedTime + "')";
		out.println(resultQuery);

		stmt.executeUpdate(resultQuery);
		response.sendRedirect("askQuestions.jsp"); //success

		conn.close();	} catch (SQLException e) {
	    e.printStackTrace();
	} finally {
	    try { conn.close(); } catch (Exception e) {}
	}
	
	
	
	
	

%>


</body>
</html>