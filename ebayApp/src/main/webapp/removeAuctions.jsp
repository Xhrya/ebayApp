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
	
		//display all auction
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		
		Statement stmt = con.createStatement();
		ResultSet result = stmt.executeQuery("SELECT * FROM auction a JOIN item i ON a.item_id=i.item_id AND a.category_id=i.category_id AND a.subcat_id=i.subcat_id WHERE a.startingtime<=NOW() AND a.closingtime>=NOW()");
		
		out.println("<b>Live auctions:</b><br/>");
		out.println("<table class='styled-table'>");
		out.println("<tr><th>Auction ID</th><th>Category ID</th><th>Subcategory ID</th><th>Item ID</th><th>Name</th><th>Brand</th><th>Starting time</th><th>Closing time</th><th>Initial price</th><th>Current Winner</th><th>Current price</th></tr>");
		//out.println("<tr><th>Auction ID</th><th>Category ID</th><th>Subcategory ID</th><th>Name</th><th>Brand</th><th>Starting time</th><th>Closing time</th><th>Initial price</th><th>Increment price</th><th>Current price</th></tr>");
		while (result.next()) {
			String item_id = result.getString("item_id");
			String category_id = result.getString("category_id");
			String subcat_id = result.getString("subcat_id");
			
			out.println("<tr><td>");
			out.print(result.getString("auction_id"));
			out.println("</td><td>");
			out.print(category_id);
			out.println("</td><td>");
			out.print(subcat_id);
			out.println("</td><td>");
			out.print(item_id);
			out.println("</td><td>");
			out.print(result.getString("item_name"));
			out.println("</td><td>");
			out.print(result.getString("brand"));
			out.println("</td><td>");
			out.print(result.getString("startingtime"));
			out.println("</td><td>");
			out.print(result.getString("closingtime"));
			out.println("</td><td>");
			out.print(result.getString("initialprice"));
			out.println("</td><td>");
			out.print(result.getString("curr_winner"));
			out.println("</td><td>");
			out.print(result.getString("curr_price"));
			out.println("</td><td>");
			
			out.println("</td></tr>");
		}
		out.println("</table><br/><br/>");
		
		
		
	
		//offer query to remove a particular auction
		out.println("<b>Remove Auction:</b><br/>");
		out.println("<form action='removeAuctionHandler.jsp' method='POST'>");
		out.println("<table>");
		out.println("<tr><td>Auction ID:</td><td><input type='text' name='auction_id' required/></td></tr>");
		out.println("</table>&nbsp;<br/> <input type='submit' value='Submit'>");
		out.println("</form><br/>");
%>



<a href='customerRepPage.jsp'> Home </a>	<br/>

</body>
</html>