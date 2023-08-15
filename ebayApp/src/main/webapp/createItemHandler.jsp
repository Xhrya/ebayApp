 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.*"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

	Welcome <%=session.getAttribute("user")%>! It's great to see you :)
<%@include file="navbar.jsp" %>


<%  //handler for creating item


/* 	ApplicationDB db = new ApplicationDB();	
 */	
	
String category_id = request.getParameter("category_id");
String subcat_id = request.getParameter("subcat_id");   
String item_name = request.getParameter("item_name");
String brand = request.getParameter("brand");
String itemyear = request.getParameter("itemyear");
String size = request.getParameter("size");
String seller = (session.getAttribute("user")).toString();

 try{
 	com.ApplicationDB db = new com.ApplicationDB();
	Connection conn = db.getConnection();
	
	Statement stmt = conn.createStatement();
	
	
		String itemQuery = "INSERT INTO item (category_id, subcat_id, item_name, brand, itemyear, created_by, size) VALUES (";
 		

		if(!category_id.isEmpty()){
		    itemQuery += "'" + category_id + "',";
		}
		if(subcat_id!=null && !subcat_id.isEmpty()){
		    itemQuery += "'" + subcat_id + "',";
		}
		if(!item_name.isEmpty()){
		    itemQuery += "'" + item_name + "',";
		}
		if(!brand.isEmpty()){
		    itemQuery += "'" + brand + "',";
		}
		if(itemyear != null){
		    itemQuery += "'" + itemyear + "',";
		}
	
		if(!seller.isEmpty()){
		    itemQuery += "'" + seller + "',";
		}
		
		if(!size.isEmpty()){
		    itemQuery += "'" + size + "'";
		}
		itemQuery += ");";
		
		out.println(itemQuery);
		
	 stmt.executeUpdate(itemQuery);
	 response.sendRedirect("shop.jsp"); //success

	 conn.close();
 }
 catch(SQLException e)
 {

	 out.println(" <a href='createItem.jsp'>try again</a>");
	  

 	
	 e.printStackTrace();
 }

		 
		


%>

 
 
 
