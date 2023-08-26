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
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		
		Statement stmt = con.createStatement();
		String auction_id = request.getParameter("auction_id");
		
		
		String update = "DELETE FROM auction WHERE auction_id=?";
		PreparedStatement ps = con.prepareStatement(update);				
		ps.setString(1, auction_id);
		ps.executeUpdate();
		out.println("Auction has been deleted");
		con.close();
	%>


</body>
</html>