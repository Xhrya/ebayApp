<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.*"%>

<%@ page import="java.io.*,java.util.*,java.sql.*,java.time.LocalDateTime"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<% 
	String customerId = session.getAttribute("user").toString(); // Replace with the actual end user ID
	String questionId = request.getParameter("question_id");
	String answer = request.getParameter("answer");
	LocalDateTime answeredTime = LocalDateTime.now();
	
	ApplicationDB db = new com.ApplicationDB();
	Connection conn = db.getConnection();
	
	Statement stmt = conn.createStatement();
	
	try {
		String resultQuery = "UPDATE question SET customer_rep_id = '" + customerId + "', answer = '" + answer + "', status = 'Answered', answeredTime = '" + answeredTime + "' WHERE question_id = '" + questionId + "'";
		out.println(resultQuery);

		stmt.executeUpdate(resultQuery);
		response.sendRedirect("customerRepPage.jsp"); //success

		conn.close();	
		} catch (SQLException e) {
	    e.printStackTrace();
	} finally {
	    try { conn.close(); } catch (Exception e) {}
	}
	
	
	
	
	

%>


</body>
</html>