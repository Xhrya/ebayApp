package Login;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class Login
 */

public class Login extends HttpServlet {
	
	
	private static final long serialVersionUID = 1L;
	String connectionUrl = "jdbc:mysql://localhost:3306/ebayProject1";

	public Login()
	{
		super();
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			PrintWriter out=response.getWriter();
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection con = DriverManager.getConnection(connectionUrl,"root", "Shreyaroot!");
			String n=request.getParameter("txtName");
			String p = request.getParameter("txtPassword");
			
			
			//retrieve values and check to see if this exists or not
			
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("Select userId from user where userId =? and password =? ");
			ps.setString(1,  n);
			ps.setString(2, p);
			
			ResultSet rs =ps.executeQuery();
			
			if(rs.next())
			{
				RequestDispatcher rd = request.getRequestDispatcher("welcome.jsp");
				rd.forward(request, response);
			}
			else
			{
				//redirect to another page and show login failed
				out.println("<font color=red size=18> Login Failed <br>");
				out.println("<a hreg=login.jsp> Try Again! <a/>");
			}
			
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		
	}

}