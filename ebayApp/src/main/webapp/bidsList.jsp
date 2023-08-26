<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.*"%>

<%@ page import="java.io.*,java.util.*,java.sql.*,java.time.LocalDateTime"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List of All your Bids</title>
</head>
<body>
<%@include file="navbar.jsp" %>

<% 
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		
		Statement stmt = con.createStatement();
		ResultSet result = stmt.executeQuery("SELECT * FROM bids where user_id ='" + session.getAttribute("user").toString() + "';");
		
		out.println("<b>Bids Placed:</b><br/>");
		out.println("<table class='styled-table'>");
		out.println("<tr><th>Auction ID</th><th>Bid ID</th><th>Time Placed</th><th>Amount</th></tr>");
		//out.println("<tr><th>Auction ID</th><th>Category ID</th><th>Subcategory ID</th><th>Name</th><th>Brand</th><th>Starting time</th><th>Closing time</th><th>Initial price</th><th>Increment price</th><th>Current price</th></tr>");
		while (result.next()) {

			out.println("<tr><td>");
			out.print(result.getString("auction_id"));
			out.println("</td><td>");
	
			out.print(result.getString("bid_id"));
			out.println("</td><td>");
			out.print(result.getString("time_stamp"));
			out.println("</td><td>");
			out.println("</td><td>");
			out.print(result.getString("amount"));
		
			out.println("</td></tr>");
		}
		out.println("</table><br/><br/>");
		
		Statement stmt2 = con.createStatement();

		ResultSet autoBidList = stmt2.executeQuery("select * from autoBid where user_id='" + session.getAttribute("user").toString() +"';");

		out.println("<b>Autobids Placed:</b><br/>");
		out.println("<table class='styled-table'>");
		out.println("<tr><th>Auction ID</th><th>Upper Limit </th></tr>");
		//out.println("<tr><th>Auction ID</th><th>Category ID</th><th>Subcategory ID</th><th>Name</th><th>Brand</th><th>Starting time</th><th>Closing time</th><th>Initial price</th><th>Increment price</th><th>Current price</th></tr>");
		while (autoBidList.next()) {

			out.println("<tr><td>");
			out.print(autoBidList.getString("auction_id"));
			out.println("</td><td>");
	
			out.print(autoBidList.getString("upper_limit"));
			out.println("</td><td>");
			
		
			out.println("</td></tr>");
		}
		out.println("</table><br/><br/>");
	%>

</body>
</html>