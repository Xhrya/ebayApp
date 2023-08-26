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
String query = "SELECT item.created_by as seller, SUM(auction.curr_price) as earnings_per_seller FROM auction INNER JOIN item ON auction.item_id = item.item_id AND auction.category_id = item.category_id AND auction.subcat_id = item.subcat_id WHERE closingtime < NOW() AND curr_winner IS NOT NULL GROUP BY seller ORDER BY earnings_per_seller DESC";


result = stmt.executeQuery(query);
try{
	result = stmt.executeQuery(query);


	out.println("<b>Best Selling Item:</b><br/>"); //should I have use who started it show up?
	out.println("<table class='styled-table'>");
	out.println("<tr><th>Seller ID</th><th>Earning</th></tr>");
	while (result.next()) {
		out.println("<tr><td>");
		out.print(result.getString("seller"));
		out.println("</td><td>");
		out.print(result.getString("earnings_per_seller"));
		
		out.println("</td><td>");
	
	}
	out.println("</table><br/><br/>");
}catch(Exception e)
{
 	out.println(query);
}


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