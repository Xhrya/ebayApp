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
<%@include file="navBarRep.jsp" %>

<%
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	
	Statement stmt = con.createStatement();
	ResultSet result = stmt.executeQuery("select * from question where status LIKE 'pending'");
	
	out.println("<b>Your questions:</b><br/>");
	out.println("<table class='styled-table'>");
	out.println("<tr><th>Question ID</th><th>Question ID</th><th>Answer</th><th>Customer Rep ID</th><th>Post Status</th><th>Date Post ID</th></tr>");
	while (result.next()) {
		out.println("<tr><td>");
		out.print(result.getString("question_id"));
		out.println("</td><td>");
		out.print(result.getString("question"));
		out.println("</td><td>");
		out.print(result.getString("answer"));
		out.println("</td><td>");
		out.print(result.getString("customer_rep_id"));
		out.println("</td><td>");
		out.print(result.getString("status"));
		out.println("</td><td>");	
		out.print(result.getString("postedTime"));
		out.println("</td><td>");
		out.println("</tr><td>");
		out.println("</tr><td>");


	}
	
	out.println("</tr><td>");
	out.println("</tr><td>");
	out.println("</tr><td>");

	out.println("<b>Answer Question:</b><br/>");
	out.println("<form action='answerQuestionsHandler.jsp' method='POST'>");
	out.println("<table>");
	out.println("<tr><td>Question ID:</td><td><input type='text' name='question_id' required/></td></tr>");

	out.println("<tr><td>Answer:</td><td><input type='text' name='answer' required/></td><td><div id='account'></div></td></tr>");
	out.println("</table>&nbsp;<br/> <input type='submit' value='Submit'>");
	out.println("</form><br/>");
	

	

	con.close();
	
	
	
	
%>

	<a href='customerRepPage.jsp'> Home </a>	<br/>



</body>
</html>