<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.*"%>
    
 <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Items List </title>
</head>
<body>

<%@include file="navbar.jsp" %>


<% 
		ApplicationDB db = new ApplicationDB();	
		Connection conn = db.getConnection();
		
		Statement stmt = conn.createStatement();
		ResultSet myList = stmt.executeQuery("select * from item where created_by = '" + session.getAttribute("user").toString() + "'");
		out.println("<b>Your items:</b><br/>");
		out.println("<table class='styled-table'>");
		out.println("<tr><td></td><td><select id='category' name='category' size=1 onclick='populateSecondDropdown()' onchange='populateSecondDropdown()'>");

		while(myList.next())
		{
			out.println("<tr><td>");
			out.print(myList.getString("item_id"));		
			
			out.println("<td><td>");
			out.print(myList.getString("category_id"));
			
			out.println("<td><td>");
			out.print(myList.getString("subcat_id"));
			
			out.println("<td><td>");
			out.print(myList.getString("item_name"));
			
			out.println("<td><td>");
			out.print(myList.getString("brand"));
			
			out.println("<td><td>");
			out.print(myList.getString("size"));
			
			out.println("<td><td>");
			out.print(myList.getString("itemyear"));
	
			out.println("<td><td>");
			out.print(myList.getString("created_by"));
			
			out.println("<td><td>");
		 	
		
		
		}
		out.println("<table/></td></tr>");

	%>
		
		<a href='createItem.jsp'>Add new item</a><br/>
		<a href='sellerPage.jsp'>Seller Page</a> <br/>
		<a href='userPage.jsp'>Home Page</a> <br/>
		<a href='logout.jsp'>Logout</a>
	

</body>
</html>