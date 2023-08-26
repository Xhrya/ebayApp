<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.*"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ask Questions Here</title>
</head>

<style>
.content{
	padding:30px;
}
.question-form {
    max-width: 400px;
    margin: 0 auto;
    padding: 20px;
    background-color: #f9f9f9;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.form-group {
    margin-bottom: 15px;
}

label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}

input[type="text"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.submit-button {
    padding: 10px 20px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.submit-button:hover {
    background-color: #0056b3;
}


</style>
<body>

<%@include file="navbar.jsp" %>


	<div class="content">
	<form class="question-form" action="askQuestionsHandler.jsp" method="POST">
    <div class="form-group">
        <label for="question">Your Question:</label>
        <input type="text" name="question" id="question" placeholder="Enter your question" required>
    </div>

    <div class="form-group">
        <button type="submit" class="submit-button">Submit</button>
    </div>
	</form>
	
	  <form  class="action="" method="GET">
        <label for="keyword"> Search by Keyword: </label>
        <input type="text" name="keyword" id="keyword" placeholder="Enter keyword">
        <input type="submit" value="Search">
    </form>
    
    
	</div>
	
	<br/>
	
	<%
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	
	Statement stmt = con.createStatement();
	 
    String keyword = request.getParameter("keyword");
	String query = "select * from question where user_id='" + session.getAttribute("user").toString()+ "'";

	if (keyword != null && !keyword.isEmpty()) {
          query += " AND question LIKE '%" + keyword + "%'";
     }
	ResultSet result = stmt.executeQuery(query);

	
	
	out.println("<b>Your questions:</b><br/>");
	out.println("<table class='styled-table'>");
	out.println("<tr><th>Question ID</th><th>Question ID</th><th>Answer</th><th>Customer Rep ID</th><th>Post Status</th><th>Date Post ID</th></tr>");
	while (result.next()) {
		out.println("<tr><td>");
		out.print(result.getString("question_id"));
		out.println("</td><td>");
		out.print(result.getString("question"));
		out.println("</td><td>");
		out.print(result.getString("answer"));
		out.println("</td><td>");
		out.print(result.getString("customer_rep_id"));
		out.println("</td><td>");
		out.print(result.getString("status"));
		out.println("</td><td>");	
		out.print(result.getString("postedTime"));
		out.println("</td><td>");
	
	}
	
	
	
	

%>


</body>
</html> 
