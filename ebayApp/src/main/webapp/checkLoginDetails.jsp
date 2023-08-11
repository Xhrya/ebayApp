<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("username");   
    String pwd = request.getParameter("password");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebayProject1","root", "Shreyaroot!");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from user where userId='" + userid + "' and password='" + pwd + "'");
  
    if (rs.next()) {
        session.setAttribute("user", userid); // the username will be stored in the session
        out.println("welcome " + userid);
        out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("success.jsp");
    } else {
        out.println("Invalid password <a href='login.jsp'>try again</a>");
    }
%>