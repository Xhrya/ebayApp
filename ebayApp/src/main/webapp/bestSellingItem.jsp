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
<%@include file="navbarAdmin.jsp" %>

<%
ApplicationDB db = new ApplicationDB();	
Connection conn = db.getConnection();
Statement stmt = conn.createStatement();

ResultSet result = null;
double earningPer =0;
String query="SELECT auction_id, category_id, subcat_id, item_id, startingtime, closingtime, initialprice, curr_winner, curr_price as earnings_best_selling_items FROM auction WHERE closingtime < NOW() AND curr_winner IS NOT NULL ORDER BY earnings_best_selling_items DESC LIMIT 10";
try{
	result = stmt.executeQuery(query);


	out.println("<b>Best Selling Item:</b><br/>"); //should I have use who started it show up?
	out.println("<table class='styled-table'>");
	out.println("<tr><th>Auction ID</th><th>Category ID</th><th>Subcat ID</th><th>Item ID</th><th>Starting time</th><th>Closing Time</th><th>Initial Price</th><th>Current Winner</th><th> Price</th></tr>");
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
		out.print(result.getString("earnings_best_selling_items"));
		out.println("</td><td>");
	
	}
	out.println("</table><br/><br/>");
}catch(Exception e)
{
/* 	out.println(query);
 */}

%>
	
	<div class="container">
		<a class="link" href="totalEarnings.jsp">Total earnings</a>
		<a class="link" href="earningsPerItem.jsp">Earnings per item</a>
		<a class="link" href="earningsPerItemType.jsp">Earnings per item type</a>
		<a class="link" href="earningsPerEndUser.jsp">Earnings per end-user</a>
		<a class="link" href="bestSellingItem.jsp">Best-selling items</a>
		<a class="link" href="bestSellingUser.jsp">Best buyers</a>
	</div>
</body>
</html>