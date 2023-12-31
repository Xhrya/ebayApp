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
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();

	Statement stmt = con.createStatement();
	String user_id = session.getAttribute("user").toString();
	
	
	String going_back = request.getParameter("going_back");
	
	String name = request.getParameter("name");
	String year = request.getParameter("year");
	String transmission = request.getParameter("desc_3");
	
	String category_id = request.getParameter("category");
	String subcat_id = request.getParameter("subcategory");
	String item_id = request.getParameter("item_id");
	String item_name =request.getParameter("item_name");
	
	
	String brand = request.getParameter("brand");
	String itemyear=request.getParameter("itemyear");
	String created_by = request.getParameter("created_by");
	String size = request.getParameter("size");
	
	 	
	
	
	//String price_low = request.getParameter("price_low");
	//String price_high = request.getParameter("price_high");
	
	/* out.println(cat_id);
	out.println(subcat_id);
	out.println(name);
	out.println(brand);
	out.println(year);
	out.println(item_id);
	out.println(transmission);
	out.println(price_low);
	out.println(price_high);
	out.println("<br/>"); */
	out.println("<b>Filter:</b><br/>");
	out.println("<form action='shop.jsp' method='POST'>");
	out.println("<table>");
	out.println("<tr><td></td><td><select id='category' name='category' size=1 onclick='populateSecondDropdown()' onchange='populateSecondDropdown()'>");
	

	out.println("<option value='Fash'>Fashion</option>");
	out.println("<option value='Tran'>Transportation</option>");
	out.println("<option value='Elec'>Electronics</option>");
	out.println("<option value='Furn'>Furniture</option>");
	//}

	out.println("</select></td></tr>");
	out.println("<tr><td>Subcategory:</td><td><select id='subcategory' name='subcategory' size=1></select></td></tr>");

	out.println("<tr><td>Name:</td><td><input type='text' name='name'/></td></tr>");
	out.println("<tr><td>Brand:</td><td><input type='text' name='brand'/></td></tr>");
	out.println("<tr><td>Size:</td><td><input type='text' name='size'/></td></tr>");
	out.println("<input type='hidden' name='going_back' value='false'>");
	out.println("</table>&nbsp;<br/> <input type='submit' value='Submit'>");
	out.println("</form>");
	
	
	String WishlistQuery = "select * from item where created_by !='" + user_id + "'";
	
	if(going_back!=null && !going_back.matches("true")){
	
		if(!category_id.isEmpty()){
			WishlistQuery += " AND category_id LIKE '" + category_id + "'";
		}
		if(subcat_id!=null && !subcat_id.isEmpty()){
			WishlistQuery += " AND subcat_id LIKE '" + subcat_id + "'";
		}
		if(!name.isEmpty()){
			WishlistQuery += " AND name LIKE '" + name + "'";
		}
		if(!brand.isEmpty()){
			WishlistQuery += " AND brand LIKE '" + brand + "'";
		}
	
		
	}
	
	//out.println(WishlistQuery);
	
	
	//Cannot add items added by user to wishlist
	ResultSet result = stmt.executeQuery(WishlistQuery);
	
	//ResultSet result = stmt.executeQuery("select * from item");

	if (result.next() == false) {
		out.println("No items in the inventory<br/><br/>");
	}

	else{

		out.println("<b> All available items:</b><br/>");
		out.println("<table class='styled-table'>");
		out.println(
				"<tr><th>Category</th><th>Subcategory</th><th>Item Name</th><th>Brand</th><th>Year </th><th>Size </th><th>created_by</th></tr>");

		do{
			
			 item_id = result.getString("item_id");
			category_id = result.getString("category_id");
			subcat_id = result.getString("subcat_id");
			
			out.println("<tr><td>");
			out.print(category_id);
			out.println("</td><td>");
			out.print(subcat_id);
			out.println("</td><td>");
			out.print(result.getString("item_name"));
			out.println("</td><td>");
			out.print(result.getString("brand"));
			out.println("</td><td>");
			out.print(result.getString("itemyear"));
			out.println("</td><td>");
			out.print(result.getString("size"));
			out.println("</td><td>");
			
			out.print(result.getString("created_by"));
			out.println("</td><td>");
			
			
			out.println("</form>");
			
			out.println("</td></tr>");
		}while (result.next());
		
		result.close();
		
		out.println("</table><br/><br/>");		
	}
		

		
	
	
		
	
	con.close();		
	%>
<br />
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
	    } 
		if (selectedOption === "Tran") {
	    	const option1 = document.createElement("option");
	    	option1.value = "Car";
	    	option1.text = "Car";
	    	secondDropdown.add(option1);
	    	const option2 = document.createElement("option");
	    	option2.value = "Bus";
	    	option2.text = "Bus";
	    	secondDropdown.add(option2);
	    	const option3 = document.createElement("option");
	    	option3.value = "Bike";
	    	option3.text = "Bike";
	    	secondDropdown.add(option3);
		}
		if (selectedOption === "Furn") {
	    	const option1 = document.createElement("option");
	    	option1.value = "Sofa";
	    	option1.text = "Sofa";
	    	secondDropdown.add(option1);
	    	const option2 = document.createElement("option");
	    	option2.value = "Chair";
	    	option2.text = "Chair";
	    	secondDropdown.add(option2);
	    	const option3 = document.createElement("option");
	    	option3.value = "Lamp";
	    	option3.text = "Lamp";
	    	secondDropdown.add(option3);
		}
		if (selectedOption === "Elec") {
	    	const option1 = document.createElement("option");
	    	option1.value = "Phone";
	    	option1.text = "Phone";
	    	secondDropdown.add(option1);
	    	const option2 = document.createElement("option");
	    	option2.value = "Laptop";
	    	option2.text = "Laptop";
	    	secondDropdown.add(option2);
	    	const option3 = document.createElement("option");
	    	option3.value = "Bike";
	    	option3.text = "Bike";
	    	secondDropdown.add(option3);
		}
		
	    	else {
	    	const option1 = document.createElement("option");
	    	option1.value = "";
	    	option1.text = "";
	    	secondDropdown.add(option1);
 }
	}
		
	</script>

</body>
</html>