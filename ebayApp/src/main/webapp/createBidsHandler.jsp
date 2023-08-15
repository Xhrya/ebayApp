 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.*"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

	Welcome <%=session.getAttribute("user")%>! It's great to see you :)
<%@include file="navbar.jsp" %>


<%  //handler for creating item


/* 	ApplicationDB db = new ApplicationDB();	
 */	
	
String user_id = (session.getAttribute("user")).toString();
String auction_id = request.getParameter("auction_id");   
String time_stamp = request.getParameter("time_stamp");
String amount = request.getParameter("amount");


 try{
 	com.ApplicationDB db = new com.ApplicationDB();
	Connection conn = db.getConnection();
	
	Statement stmt = conn.createStatement();
	
	
		String itemQuery = "INSERT INTO bids (user_id, auction_id, time_stamp, amount) VALUES ('" + user_id + "',";
 		

		if(!auction_id.isEmpty()){
		    itemQuery += "'" + auction_id + "',";
		}
		if(time_stamp!=null && !time_stamp.isEmpty()){
		    itemQuery += "'" + time_stamp + "',";
		}
		if(!amount.isEmpty()){
		    itemQuery += "'" + amount + "'";
		}
		
		itemQuery += ");";
		
		out.println(itemQuery);
		
	 stmt.executeUpdate(itemQuery);
	 response.sendRedirect("shop.jsp"); //success

	 conn.close();
 }
 catch(SQLException e)
 {

	 out.println(" <a href='bids.jsp'>try again</a>");
	  

 	
	 e.printStackTrace();
 }
 
 //now make sure this bid only goes through if it's the highest
 //if highest, update winner and etc

		 
		


%>

 
 
 
