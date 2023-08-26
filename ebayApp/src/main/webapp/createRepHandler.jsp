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
<body>
<% 

		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		
		Statement stmt = con.createStatement();
		Statement stmt1 = con.createStatement();
		String userId = request.getParameter("userId");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");

		String insert = "INSERT INTO user(userId, password, email, FirstName, LastName)"
				+ "VALUES (?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(insert);
		ps.setString(1, userId);
		ps.setString(2, password);
		ps.setString(3, email);
		ps.setString(4, firstName);
		ps.setString(5, lastName);
		
		try{
			ps.executeUpdate();

		}
		catch(Exception E)
		{
			out.println(ps);
		}
		insert = "INSERT INTO customer_representative(userId) VALUES (?)";
		ps = con.prepareStatement(insert);
		ps.setString(1, userId);
		try{
			ps.executeUpdate();

		}
		catch(Exception E)
		{
			out.println(ps);
		}
		
		out.println("<a href='adminPage.jsp'>Admin Page</a>");
	
%>	

	<a href='createCustomerReps.jsp'>  Create Customer Reps </a>	<br/>
	<a href='generateSummary.jsp'> Generate Summary Results </a>	<br/>
		

</body>
</html>