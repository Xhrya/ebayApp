<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.*"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All current running auctions displayed here</title>
</head>
<body>
<%@include file="navbar.jsp" %>

<%

	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	
	Statement stmt = con.createStatement();
	ResultSet result = stmt.executeQuery("select * from auction;");
	
	
	
	out.println("<b>Current Auctions:</b><br/>"); //should I have use who started it show up?
	out.println("<table class='styled-table'>");
	out.println("<tr><th>Category ID</th><th>Subcategory ID</th><th>Item ID</th><th>Name</th><th>Starting time</th><th>Closing Time</th><th>Initial Price</th><th>Current Winner</th><th>Current Price</th></tr>");
	while (result.next()) {
		out.println("<tr><td>");
		out.print(result.getString("auction_id"));
		out.println("</td><td>");
		out.print(result.getString("category_id"));
		out.println("</td><td>");
		out.print(result.getString("subcat_id"));
		out.println("</td><td>");
		out.print(result.getString("item_id"));
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
	
	}
	out.println("</table><br/><br/>");

	
/* 	String category_id = request.getParameter("category_id");
	String subcat_id = request.getParameter("subcat_id");   
	String item_id = request.getParameter("item_id");
	String startingtime = request.getParameter("startingtime");
	String closingtime = request.getParameter("closingtime");
	String initialprice = request.getParameter("initialprice");
	String increment_price = request.getParameter("increment_price");
	
	
	out.println("<form action='addWishListItem.jsp'method='POST'>");
	out.println("<input type='hidden' name='category_id' value='" + category_id + "' >");
	out.println("<input type='hidden' name='subcat_id' value='" + subcat_id + "' >");
	out.println("<input type='hidden' name='item_id' value='" + item_id + "' >");
 	out.println("<input type='hidden' name='user_id' value='" + user_id + "' >");
	out.println("<input type='submit' value='Add to Wishlist'>");
	out.println("</form>"); 
*/

	out.println("</td></tr>");


	
	%>

</body>
</html>