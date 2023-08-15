<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.*"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Item</title>
</head>
<body>
	<%@include file="navbar.jsp"%>


	<div class="content">
	<form action="createItemHandler.jsp" method="POST">
	

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
		<label for="item_name"> Item Name </label> 
		<input type="text" name="item_name" id="item_name"
			placeholder="Enter item name" required> <br>
			
			
		<label for="brand"> Brand </label> 
		<input type="text" name="brand" id="brand" placeholder="Enter brand name" required> <br>

		<label for="itemyear"> Year </label> <input type="number"
			name="itemyear" id="itemyear" placeholder="Enter item year" required>
		<br> 
		
		<label for="size"> Size </label> <input type="text"
			name="size" id="size" placeholder="Enter size" required> <br>
			<input type="submit" value="Submit">

	</form>
	</div>
	
	


</body>
</html>