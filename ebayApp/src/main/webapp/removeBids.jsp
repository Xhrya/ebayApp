<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.*"%>

<%@ page import="java.io.*,java.util.*,java.sql.*,java.time.LocalDateTime"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Bids</title>
</head>
<body>
<%@include file="navBarRep.jsp" %>

<% 
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		
		Statement stmt = con.createStatement();
		ResultSet result = stmt.executeQuery("SELECT * FROM bids;");
	
		out.println("<b>Bids Active:</b><br/>");
		out.println("<table class='styled-table'>");
		out.println("<tr><th>Bid ID</th><th>Auction ID</th><th>Time Placed</th><th>Amount</th></tr>");
		//out.println("<tr><th>Auction ID</th><th>Category ID</th><th>Subcategory ID</th><th>Name</th><th>Brand</th><th>Starting time</th><th>Closing time</th><th>Initial price</th><th>Increment price</th><th>Current price</th></tr>");
		while (result.next()) {

			out.println("<tr><td>");
			out.print(result.getString("bid_id"));
			out.println("</td><td>");
	
			out.print(result.getString("auction_id"));
			out.println("</td><td>");
			out.print(result.getString("time_stamp"));
			out.println("</td><td>");
			out.print(result.getString("amount"));
		
			out.println("</td></tr>");
		}
		out.println("</table><br/><br/>");
		
		//offer query to remove a particular auction
		out.println("<b>Remove Bids:</b><br/>");
		out.println("<form action='removeBidHandler.jsp' method='POST'>");
		out.println("<table>");
		out.println("<tr><td>Bid ID:</td><td><input type='text' name='bid_id' required/></td></tr>");
		out.println("<tr><td>Auction ID:</td><td><input type='text' name='auction_id' required/></td></tr>");
		out.println("</table>&nbsp;<br/> <input type='submit' value='Submit'>");
		out.println("</form><br/>");
		
	%>



<a href='customerRepPage.jsp'> Home </a>	<br/>

</body>
</html>