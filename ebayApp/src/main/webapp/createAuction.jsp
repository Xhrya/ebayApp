<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.*"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Auction</title>
</head>
<body>
	<%@include file="navbar.jsp"%>


	<div class="content">
	<form action="createAuctionHandler.jsp" method="POST">
	

		<label for="category_id">Category</label> 
		<select name="category_id" id="category_id" required>
			<option value="" disabled selected hidden="true">Select
				category</option>
			<option value="Tran">VEH</option>
			<option value="Fash">FASH</option>
			<option value="Furn">FURN</option>
			<option value="Elec">ELEC</option>
		</select>  <br>
		
		
		<label for="subcat_id">Sub Category</label> 
		<select name="subcat_id" id="subcat_id" required>
			<option value="" disabled selected hidden="true">Select
				category</option>
			<option value="Tops">Tops</option>
			<option value="Bottoms">Bottoms</option>
			<option value="Shoes">Shoes</option>
			
			
		</select> <br> 
		<label for="item_id"> Item id </label> 
		<input type="number" name="item_id" id="item_id"
			placeholder="Enter item id" required> <br>
			
			
		<label for="startingtime"> Starting Time </label> 
		<input type="datetime-local" name="startingtime" id="startingtime" placeholder="Enter starting name" required> <br>

		<label for="closingtime"> Closing Time </label> <input type="datetime-local"
			name="closingtime" id="closingtime" placeholder="Enter closing time" required>
		<br> 
		
		<label for="initialprice"> Initial Price </label> <input type="number""
			name="initialprice" id="initialprice" placeholder="Enter intial price" required> <br>
			
			<label for="increment_price"> Increment Price </label> <input type="number"
			name="increment_price" id="increment_price" placeholder="Enter increment price" required> <br>
		
			
			<input type="submit" value="Submit">

	</form>
	</div>
	
	<br/>
	<%
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	
	Statement stmt = con.createStatement();
	ResultSet result = stmt.executeQuery("select * from item where created_by='" + session.getAttribute("user").toString()+ "'");
	
	
	
	out.println("<b>Your items:</b><br/>");
	out.println("<table class='styled-table'>");
	out.println("<tr><th>Category ID</th><th>Subcategory ID</th><th>Item ID</th><th>Name</th><th>Brand</th><th>Year</th><th>Description</th><th>Description</th><th>Description</th></tr>");
	while (result.next()) {
		out.println("<tr><td>");
		out.print(result.getString("category_id"));
		out.println("</td><td>");
		out.print(result.getString("subcat_id"));
		out.println("</td><td>");
		out.print(result.getString("item_id"));
		out.println("</td><td>");
		out.print(result.getString("brand"));
		out.println("</td><td>");
		out.print(result.getString("itemyear"));
		out.println("</td><td>");
		out.print(result.getString("size"));
		out.println("</td><td>");
	
	}
	

%>

<script>
		function checkStartingTime() {
			var today = new Date();
			var date_from = document.getElementById("starting_time").value;
			date_from = new Date(date_from)
			if (today >= date_from) {
				document.getElementById("startingDateError").innerHTML = "You cannot select today or the days before";
			} else {
				document.getElementById("startingDateError").innerHTML = " ";
			}
		}
		
		function checkClosingTime() {
			var today = new Date();
			var date_from = document.getElementById("closing_time").value;
			date_from = new Date(date_from)
			if (today >= date_from) {
				document.getElementById("closingDateError").innerHTML = "You cannot select today or the days before.";
			} else { 
				document.getElementById("closingDateError").innerHTML = " ";
			}
		}
	</script>
	
	


</body>
</html>