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
 <%@include file="navbar.jsp" %>

<%
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();	

Statement stmt = con.createStatement();
String category_id = request.getParameter("category_id");
String subcat_id = request.getParameter("subcategory_id");
String item_id = request.getParameter("item_id");

ResultSet result = stmt.executeQuery("SELECT * FROM auction a JOIN item i ON a.item_id=i.item_id AND a.category_id=i.category_id AND a.subcat_id=i.subcat_id WHERE a.closingtime<NOW() AND a.category_id='"+ category_id+"' AND a.subcat_id='"+ subcat_id+"' ORDER BY a.closingtime DESC");

out.println("<b>Similar items on auction in the previous month:</b><br/>");
out.println("<table class='styled-table'>");
out.println("<tr><th>Category ID</th><th>Subcategory ID</th><th>Item ID</th><th>Name</th><th>Brand</th><th>Initial price</th><th>Selling price</th></tr>");
while (result.next()) {
	out.println("<tr><td>");
	out.print(result.getString("category_id"));
	out.println("</td><td>");
	out.print(result.getString("subcat_id"));
	out.println("</td><td>");
	out.print(result.getString("item_id"));
	out.println("</td><td>");
	out.print(result.getString("name"));
	out.println("</td><td>");
	out.print(result.getString("brand"));
	out.println("</td><td>");
	out.print(result.getString("initial_price"));
	out.println("</td><td>");
	if (result.getString("curr_winner")==null) {
		out.print("NOT SOLD");
	} else {
		out.print(result.getString("curr_price"));
	}
	out.println("</td></tr>");
}
out.println("</table><br/>");

con.close();



%>
</body>
</html>