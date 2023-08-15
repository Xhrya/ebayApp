<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Page!</title>
</head>
<body>

<%@include file="navbar.jsp" %>

	Welcome <%=session.getAttribute("user")%>! It's great to see you :)

	<h1>Login Successful</h1>
	
	<h2> Buy </h2>
	<a href='shop.jsp'>Shop</a>
	<br/>
	<a href='summaryReport.jsp'>Summary</a>
	<br/>
		<a href='auctionsList'>Auctions List</a> //place Bids here
	
	<br/>
	<a href='bids.jsp'> List of Bids and Offers</a>	<br/>
		<a href='createBids.jsp'>  Bids and Offers</a>	<br/>
	
	<a href='auctions.jsp'> Autobid </a>	<br/>
	
	<h2> Sell </h2>
	
	<h2> <a href='sellerPage.jsp'>Seller Page</a></h2>
	
	
	<h3>Account Help</h3>
	<a href='changePassword'> Change password</a>
	

	
	
</body>
</html>