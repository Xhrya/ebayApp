<%@ page language="java" contentType="text/html; charset=UTF-8"
		import="com.*"
    pageEncoding="UTF-8"%>
<%@ page import ="java.io.*, java.util.*, java.sql.*" %>
<%@ page import ="javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop :)</title>
</head>
<body>
	
<!-- <h1> List of Items Currently:</h1>
 -->`
 <%@include file="navbar.jsp" %>
 
 
 <%
		com.ApplicationDB db = new com.ApplicationDB();
	 	Connection conn = db.getConnection();
	 	
	 	Statement stmt = conn.createStatement();
	 	String user_id = session.getAttribute("user").toString();
		
	 	//check what this is tho
	 	String going_back = request.getParameter("going_back");

	 	
	 	/* get all the attrivutes I need for items */
	 	String category_id = request.getParameter("category");
	 	String subcat_id = request.getParameter("subcategory");
	 	String item_id = request.getParameter("item_id");
	 	String item_name =request.getParameter("item_name");
	 	String brand = request.getParameter("brand");
	 	String itemyear=request.getParameter("itemyear");
	 	String created_by = request.getParameter("created_by");
	 	String size = request.getParameter("size");
	 	
	 	 	
	 	
	 	
	 	/* Show List of Items */
	 	
	 	
 		out.println("<b>Filter:</b><br/>");
		out.println("<form action='shop.jsp' method='POST'>");
		out.println("<table>");
		out.println("<tr><td></td><td><select id='category' name='category' size=1 onclick='populateSecondDropdown()' onchange='populateSecondDropdown()'>");
		
		/*		
		out.println("<option value='VEH'>Vehicle</option>");
		out.println("<option value='CLO'>Clothing</option>");
		out.println("<option value='ELO'>Electronics</option>");
		out.println("<option value='FUR'>Furniture</option>");
		//}

		out.println("</select></td></tr>");
		out.println("<tr><td>Subcategory:</td><td><select id='subcategory' name='subcategory' size=1></select></td></tr>");

		out.println("<tr><td>Name:</td><td><input type='text' name='name'/></td></tr>");
		out.println("<tr><td>Brand:</td><td><input type='text' name='brand'/></td></tr>");
		out.println("<tr><td>Newer than Year:</td><td><input type='number' name='year'/></td></tr>");
		//out.println("<tr><td>Price Range:</td><td><input type='number' name='price_low'/></td> <td><input type='number' name='price_high'/></td></tr>");
		out.println("<tr><td>Color:</td><td><input type='text' name='color'/></td></tr>");
		out.println("<tr><td>Fuel:</td><td><input type='text' name='fuel'/></td></tr>");
		out.println("<tr><td>Transmission:</td><td><input type='text' name='desc_3'/></td></tr>");
		out.println("<input type='hidden' name='going_back' value='false'>");
		out.println("</table>&nbsp;<br/> <input type='submit' value='Submit'>");
		out.println("</form>"); */
		
		
	 	
	 	String itemsQuery = "'select * from item where created_by != " + user_id + "'";
	 	
	 	if(going_back!=null && !going_back.matches("true")){
	 		
			if(!category_id.isEmpty()){
		itemsQuery += " AND category_id LIKE '" + category_id + "'";
			}
			if(subcat_id!=null && !subcat_id.isEmpty()){
		itemsQuery += " AND subcat_id LIKE '" + subcat_id + "'";
			}
			if(!item_id.isEmpty()){
		itemsQuery += " AND item_id LIKE '" + item_id + "'";
			}
			if(!brand.isEmpty()){
		itemsQuery += " AND brand LIKE '" + brand + "'";
			}
			if(!itemyear.isEmpty()){
		itemsQuery += " AND itemyear >= '" + itemyear + "'";
			}
			if(!created_by.isEmpty()){
		itemsQuery += " AND created_by LIKE '" + created_by + "'";
			}
			if(!size.isEmpty()){
		itemsQuery += " AND size LIKE '" + size + "'";
			}
		}
	 	
		
	 			
	 	//ResultSet myList = stmt.executeQuery(itemsQuery);
		ResultSet myList = stmt.executeQuery("select * from item");

	 	if(myList.next() == false)
	 	{
			out.println("No items in the inventory<br/><br/>");
	 	}
	 	else
	 	{
	 		out.println("List of Items Currently:");
	 		out.println("<table class='styled-table'>");
	 		out.println(
	 				"<tr><th>Category</th><th>Subcategory</th><th>item_id</th><th>item_name</th><th>brand</th><th>item_year</th><th>created_by</th><th>size</th></tr>");
	 		
	 		
	 		do{
	 		
		out.println("<tr><td>");
		out.print(myList.getString("item_id"));		
		
		out.println("<td><td>");
		out.print(myList.getString("category_id"));
		
		out.println("<td><td>");
		out.print(myList.getString("subcat_id"));
		
		out.println("<td><td>");
		out.print(myList.getString("item_name"));
		
		out.println("<td><td>");
		out.print(myList.getString("brand"));
		
		out.println("<td><td>");
		out.print(myList.getString("size"));
		
		out.println("<td><td>");
		out.print(itemyear);

		out.println("<td><td>");
		out.print(myList.getString("created_by"));
		
		out.println("<td><td>");
	 	
		
		/* allow item to be added to wishlist */

		
		out.println("<form action='addWishListItem.jsp'method='POST'>");
		out.println("<input type='hidden' name='category_id' value='" + category_id + "' >");
		out.println("<input type='hidden' name='subcat_id' value='" + subcat_id + "' >");
		out.println("<input type='hidden' name='item_id' value='" + item_id + "' >");
		out.println("<input type='hidden' name='user_id' value='" + user_id + "' >");
		out.println("<input type='submit' value='Add to Wishlist'>");
		out.println("</form>");

		out.println("</td></tr>");

	 		
	 		}
	 		while(myList.next());
	 		myList.close();
	 		out.println("</table><br/><br/>");
	 	}
	 	
	 	
	 	/* View WishList Items */
	 	
	 	

	%>

  	conn.close()
 	<a href='shop.jsp'>Clear all filters</a><br/>
 	<a href='userPage.jsp'>Home Page</a>
	<a href='logout.jsp'>Logout</a>

	<script>
	function populateSecondDropdown()
	{		
		const firstDropdown = document.getElementById("category");
		const secondDropdown = document.getElementById("subcategory");
		const selectedOption = firstDropdown.value;
		secondDropdown.innerHTML = "";
		
		if (selectedOption === "Fash") {
	    	const option1 = document.createElement("option");
	    	option1.value = "Tops";
	    	option1.text = "Tops";
	    	secondDropdown.add(option1);
	    	const option2 = document.createElement("option");
	    	option2.value = "Bottoms";
	    	option2.text = "Bottoms";
	    	secondDropdown.add(option2);
	    	const option3 = document.createElement("option");
	    	option3.value = "Shoes";
	    	option3.text = "Shoes";
	    	secondDropdown.add(option3);
	    } else {
	    	const option1 = document.createElement("option");
	    	option1.value = "";
	    	option1.text = "";
	    	secondDropdown.add(option1);
    }
	}
		
	</script>

</body>
</html>