<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Page!</title>
</head>
    <title>Welcome to Your Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin-left:50px
            
        }
        .container {
            text-align: center;
            margin-top: 100px;
            margin-left:20px
        }
        h1 {
            color: #007bff;
        }
        h2 {
            color: #pink;
        }
    </style>
    
<body>

<%@include file="navbar.jsp" %>
	
	<div class ="container">
	  <h1>Welcome <%= session.getAttribute("user") %>! It's great to see you <span style="color: #f58220;">:)</span></h1>
        <h2>Login Successful</h2>
	</div>
	
	
	<h2> Buy </h2>
	<a href='shop.jsp'>Shop</a>
	<br/>
	
	
	<a href='auctionsList.jsp'>Auctions List</a> 
	
	<br/>
	<a href='bidsList.jsp'> Bids and Autobids list </a>	<br/>
	<a href='bids.jsp'> Place a Bid</a>	<br/>
	
	
	<h2> Sell </h2>
	
	<a href='sellerPage.jsp'>Seller Page</a>
	
	<h2>Account Help</h2>
	<a href='askQuestions.jsp'>Ask Questions</a>
	
	

	
	
</body>
</html>