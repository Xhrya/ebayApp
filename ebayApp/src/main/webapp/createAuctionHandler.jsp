 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.*"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*, java.time.LocalDateTime"%>

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
		
		//get all the variables
		String category_id = request.getParameter("category_id");
		String subcat_id = request.getParameter("subcat_id");   
		String item_id = request.getParameter("item_id");
		String startingtime = request.getParameter("startingtime");
		String closingtime = request.getParameter("closingtime");
		String initialprice = request.getParameter("initialprice");
		String increment_price = request.getParameter("increment_price");
		String seller = (session.getAttribute("user")).toString();
/* 		String minimum_price = request.getParameter("minimum_price");
 */
	/* 	String curr_winner = (session.getAttribute("user")).toString();
		String curr_price = (session.getAttribute("user")).toString();
 */
		//create a reuest to get auction
	

	
			ResultSet result = stmt.executeQuery("select category_id,subcat_id,item_id from auction where category_id='" + category_id+ "' and subcat_id='" + subcat_id+ "' and item_id='" + item_id+"'");
			if (result.next()) {
				out.println("Item already on auction! <a href='createAuction.jsp'>Go back.</a>");
			} else 
			{
				
			
			String itemQuery = "INSERT INTO auction (category_id, subcat_id, item_id, startingtime, closingtime, initialprice, increment_price, minimum_price, userId ) VALUES (";
	 		

			if(!category_id.isEmpty()){
			    itemQuery += "'" + category_id + "',";
			}
			if(subcat_id!=null && !subcat_id.isEmpty()){
			    itemQuery += "'" + subcat_id + "',";
			}
			if(!item_id.isEmpty()){
			    itemQuery += "'" + item_id + "',";
			}
			if(!startingtime.isEmpty()){
			    itemQuery += "'" + startingtime + "',";
			}
			if(closingtime != null){
			    itemQuery += "'" + closingtime + "',";
			}
		
			if(!initialprice.isEmpty()){
			    itemQuery += "'" + initialprice + "',";
			}
			
			if(!increment_price.isEmpty()){ //adding increment and minimum price
			    itemQuery += "'" + increment_price + "','" + initialprice + "'";
			}
			if(!seller.isEmpty()){ //adding increment and minimum price
			    itemQuery += "'" + seller + "'";
			}
			
			itemQuery += ");";
			
			out.println(itemQuery);
			
			stmt.executeUpdate(itemQuery);
		
			
			
		
			//send out alerts and add to that table
			
			LocalDateTime now = LocalDateTime.now();
			Statement stmt1 = con.createStatement();
			ResultSet result1 = stmt1.executeQuery("select * from wishlist where category_id='" + category_id+ "' and subcat_id='" + subcat_id+ "' and item_id='" + item_id+"'");
			while(result1.next())
			{
				String insert1 = "INSERT IGNORE INTO alert(end_user_id, timestamp, message)"
						+ "VALUES (?, ?, ?)";
				PreparedStatement ps1 = con.prepareStatement(insert1);
				ps1.setString(1, result1.getString("user_id"));
				ps1.setString(2, now.toString());
				ps1.setString(3, "Your wishlist item " + category_id+ "-" + subcat_id+ "-" + item_id+ " is up on auction from " + startingtime+ " to " + closingtime+ ".");
				ps1.executeUpdate();
			}
			
			out.println("Auction added!  <br/><a href=''auctionsList.jsp'>Go back</a>");
			con.close();
			}
			
		
		
%>
	
</body>
</html>