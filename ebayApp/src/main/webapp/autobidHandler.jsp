 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.*"%>

<%@ page import="java.io.*,java.util.*,java.sql.*,java.time.LocalDateTime"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

	Welcome <%=session.getAttribute("user")%>! It's great to see you :)
<%@include file="navbar.jsp" %>


<%  //handler for creating item


/* 	ApplicationDB db = new ApplicationDB();	
 */	
	
String auction_id = request.getParameter("auction_id");
String upper_limit = request.getParameter("upper_limit");   
String user_id = session.getAttribute("user").toString();
LocalDateTime time_stamp = LocalDateTime.now();

ApplicationDB db = new ApplicationDB();
Connection conn = db.getConnection();


Statement stmt = conn.createStatement();

//get current price and incremement price to make sure autobid limit valid
ResultSet auctionQuery = stmt.executeQuery("select * from auction where auction_id='" + auction_id+"';");
auctionQuery.next();
String incrementPrice = auctionQuery.getString("increment_price");
String currWinnerPrice = auctionQuery.getString("curr_price");
int currIncrememnt = Integer.parseInt(incrementPrice) + Integer.parseInt(currWinnerPrice);


Statement stmt2 = conn.createStatement();

ResultSet autoBids = stmt2.executeQuery("select * from autoBid where user_id='" + session.getAttribute("user").toString()+"' and auction_id='" + auction_id+"'");


if(!autoBids.next())
{
	out.println("You have already an autobid set for this. <br/><a href='auctionsList.jsp'>Go back</a>");

}
else
{
	// now check if there are other autobids set; if there are, and their max price is higher than mine, I need to update that; 
	//if others upperlimit less than mine, send them alert
	//if no other autobids, place my bid and declare winner. 
	ResultSet autoBidList = stmt.executeQuery("select * from autoBid where auction_id='" + auction_id+"';");
	autoBidList.next();
	int autoBidOldPrice = Integer.parseInt(autoBidList.getString("upper_limit"));
	String winner_old = autoBidList.getString("user_id");

	int newPrice=0;
	newPrice = Integer.parseInt(incrementPrice) + autoBidOldPrice;

	if(Integer.parseInt(upper_limit) >= currIncrememnt)
	{
		if (autoBidList.next())
		{
						
				if( autoBidOldPrice > newPrice )
				{
					
					//add a bid to auction from this user
					String bidPlace = "INSERT INTO bids (user_id, auction_id, time_stamp, amount) VALUES ('" + user_id + "',";
				 	//don't insert, update the bids value
					if(!auction_id.isEmpty()){
						bidPlace += "'" + winner_old + "',";		}
					if(time_stamp!=null ){
						bidPlace += "'" + time_stamp + "',";
					}
					bidPlace += "'" + autoBidOldPrice + "'";
					
					bidPlace += ");";
					out.println(bidPlace);
					Statement bidQuery = conn.createStatement();
					bidQuery.executeUpdate(bidPlace);
					
					
				 	
					String checkAuction = "UPDATE auction SET curr_winner ='" + winner_old + "' , curr_price = " + currIncrememnt + " WHERE auction_id ='" + auction_id + "';";
					Statement stmtnew = conn.createStatement();
					stmtnew.executeUpdate(checkAuction);
					
				}
				else if (autoBidOldPrice < newPrice && autoBidOldPrice > Integer.parseInt(currWinnerPrice))
				{
			
				 	//add a bid to auction from this user
					String bidPlace = "INSERT INTO bids (user_id, auction_id, time_stamp, amount) VALUES ('" + user_id + "',";
				 	//don't insert, update the bids value
					if(!auction_id.isEmpty()){
						bidPlace += "'" + auction_id + "',";		}
					if(time_stamp!=null ){
						bidPlace += "'" + time_stamp + "',";
					}
					bidPlace += "'" + newPrice + "'";
					
					bidPlace += ");";
					out.println(bidPlace);
					Statement bidQuery = conn.createStatement();
					bidQuery.executeUpdate(bidPlace);
					
					
				 	
					String checkAuction = "UPDATE auction SET curr_winner ='" + user_id + "' , curr_price = " + currIncrememnt + " WHERE auction_id ='" + auction_id + "';";
					Statement stmtnew = conn.createStatement();
					stmtnew.executeUpdate(checkAuction);
					
					//alerting happening in the end
				}
				else if (autoBidOldPrice == newPrice)		
				{
					//add a bid to auction from this user
					String bidPlace = "INSERT INTO bids (user_id, auction_id, time_stamp, amount) VALUES ('" + user_id + "',";
				 	//don't insert, update the bids value
					if(!auction_id.isEmpty()){
						bidPlace += "'" + auction_id + "',";		}
					if(time_stamp!=null ){
						bidPlace += "'" + time_stamp + "',";
					}
					bidPlace += "'" + newPrice + "'";
					
					bidPlace += ");";
					out.println(bidPlace);
					Statement bidQuery = conn.createStatement();
					bidQuery.executeUpdate(bidPlace);
					
					
					String checkAuction = "UPDATE auction SET curr_winner ='" + user_id + "' , curr_price = " + currIncrememnt + " WHERE auction_id ='" + auction_id + "';";
					Statement stmtnew = conn.createStatement();
					stmtnew.executeUpdate(checkAuction);
					
					
				}
				
					
		}
		
		
			String itemQuery = "INSERT INTO autoBid (user_id, auction_id, time_stamp, upper_limit) VALUES (";
			if(!user_id.isEmpty()){
			    itemQuery += "'" + user_id + "',";
			}
			if(auction_id!=null && !auction_id.isEmpty()){
			    itemQuery += "'" + auction_id + "',";
			}
			if(time_stamp!= null){
			    itemQuery += "'" + time_stamp + "',";
			}
			
			if(!upper_limit.isEmpty()){
			    itemQuery += "'" + upper_limit + "'";
			}
			itemQuery += ");";
			out.println(itemQuery);
			
			try{
			 	stmt.executeUpdate(itemQuery);

			}
			catch(Exception e)
			{
				out.println(itemQuery);
			}
		
		 	
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
				String alertUserAutoBid = "INSERT INTO alert (end_user_login, time_stamp, message) VALUES ('" + curr_winner + "', '" + time_stamp + "','" + newMessage + "');";
				try
				{
					stmt4.executeUpdate(alertUserAutoBid);

				}
				catch(Exception e1){
					out.println(alertUserAutoBid);
				}
			}
			 
		out.println("Autobid Has Been Added<br/><a href='bidsList.jsp'>Go back</a>");

			 

		conn.close();
	}
	else
	{
		
		
		out.println("Please place a valid upper limit higher than current bid<br/><a href='auctionsList.jsp'>Go back</a>");
	}

}


		 
		


%>

 
 
 
