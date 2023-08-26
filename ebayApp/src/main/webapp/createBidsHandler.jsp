 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.*"%>

<%@ page import="java.io.*,java.util.*,java.sql.*,java.time.LocalDateTime"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

	Welcome <%=session.getAttribute("user")%>! It's great to see you :)
<%@include file="navbar.jsp" %>


<%  //handler for creating item


/* 	ApplicationDB db = new ApplicationDB();	
 */	
	
String user_id = (session.getAttribute("user")).toString();
String auction_id = request.getParameter("auction_id");   
LocalDateTime time_stamp = LocalDateTime.now();
String amount = request.getParameter("amount");

ApplicationDB db = new com.ApplicationDB();
Connection conn = db.getConnection();

Statement stmt = conn.createStatement();

ResultSet auctionQuery = stmt.executeQuery("select * from auction where auction_id='" + auction_id+"';");
auctionQuery.next();
String incrementPrice = auctionQuery.getString("increment_price");
String currWinnerPrice = auctionQuery.getString("curr_price");

int currIncrememnt = Integer.parseInt(incrementPrice) + Integer.parseInt(currWinnerPrice);
out.println(currIncrememnt);

 if(Integer.parseInt(amount) >= currIncrememnt)
 {
 
	String itemQuery = "INSERT INTO bids (user_id, auction_id, time_stamp, amount) VALUES ('" + user_id + "',";
 	//don't insert, update the bids value
 	
	if(!auction_id.isEmpty()){
	    itemQuery += "'" + auction_id + "',";		}
	if(time_stamp!=null ){
	    itemQuery += "'" + time_stamp + "',";
	}
	if(!amount.isEmpty()){
	    itemQuery += "'" + amount + "'";
	}
		
		
	itemQuery += ");";
		
	out.println(itemQuery);
	Statement stmt1 = conn.createStatement();
	stmt1.executeUpdate(itemQuery);
	 
	 
	 String checkAuction = "UPDATE auction SET curr_winner ='" + user_id + "' , curr_price = " + amount + " WHERE auction_id ='" + auction_id + "';";
	 Statement stmt2 = conn.createStatement();
	 stmt2.executeUpdate(checkAuction);

	 //final step: alert and autoincrement for whoever has that setup installed
	 //now make sure this bid only goes through if it's the highest
 	//if highest, update winner and etc

	Statement stmt3 = conn.createStatement();

	ResultSet alertAuction = stmt.executeQuery("select * from auction where auction_id='" + auction_id+"';");
	alertAuction.next();
	String curr_winner = alertAuction.getString("curr_winner");
	String message = "You bid has been outplaced.";
	String alertUser = "INSERT INTO alert (end_user_login, time_stamp, message ) VALUES ('" + curr_winner + "'," + time_stamp + "','" + message + "';";
	
	try{
		stmt3.executeUpdate(alertUser);
	}
	catch(Exception E)
	{
		out.println(alertUser);
	}
	 
	 
	 //upper limit buyMe alert; and many people are going to get this alert
	 Statement stmt4 = conn.createStatement();

	 ResultSet alertAutoBid = stmt.executeQuery("select * from autoBid where auction_id='" + auction_id+"';");
	 while (alertAutoBid.next()){
		String newMessage = "You upper limit has been passed";
		String alertUserAutoBid = "INSERT INTO alert (end_user_login, time_stamp, message ) VALUES ('" + curr_winner + "'," + time_stamp + "','" + newMessage + "';";
		stmt4.executeUpdate(alertUserAutoBid);
			
	}
	
	out.println("Bid Has Been Added<br/><a href='bidsList.jsp'>Go back</a>");


	 conn.close();
 }
 else
 {
	out.println("Please input another value <a href='bidsList.jsp'>Go back.</a>");

 }
 
 
 
		


%>

 
 
 
