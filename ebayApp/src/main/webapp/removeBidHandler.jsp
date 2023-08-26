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
	<%
		
		ApplicationDB db = new com.ApplicationDB();
		Connection conn = db.getConnection();
		
		Statement stmt = conn.createStatement();
		String auction_id = request.getParameter("auction_id");
		String bid_id = request.getParameter("bid_id");

		
		String updateDelete = "DELETE FROM bids WHERE bid_id = '" + bid_id + "' AND auction_id = " + auction_id;
		stmt.executeUpdate(updateDelete);
		out.println(updateDelete);

		out.println("Bid has been deleted");
		conn.close();
		
		
		response.sendRedirect("removeBids.jsp"); //success

	%>


</body>
</html>