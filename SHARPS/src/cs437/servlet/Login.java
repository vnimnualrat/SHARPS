package cs437.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import cs437.model.LoginModel;


@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Login() {
        super();
    }

    public void init( ServletConfig config ) throws ServletException
    {
        super.init( config );

        try
        {
            Class.forName( "com.mysql.jdbc.Driver" );
        }
        catch( ClassNotFoundException e )
        {
            throw new ServletException( e );
        }
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{   
        request.getRequestDispatcher("/WEB-INF/Login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		String userName = request.getParameter("username");
		
		String userPassword = request.getParameter("password");
		
		Integer userId = 0;
//		int userId = Integer.parseInt(request.getParameter("id"));
//		System.out.println(userName);
//		System.out.println(userId);
		Boolean authorized = false;
		
		Connection c = null;
      try
      {
          String url = "jdbc:mysql://localhost:3306/cs496stu02";
          String username = "cs496stu02";
          String password = "32rtalvU";

//          System.out.println("Connecting database...");
          
          c = DriverManager.getConnection( url, username, password );
          
//          System.out.println("Database connected");
          
          Statement stmt = c.createStatement();
          ResultSet rs = stmt.executeQuery( "select * from loginTable" );

          // Goes through the database and checks if parameters entered are equal to the username AND password in the database.
          while( rs.next() )
          {
        	  
//        	  System.out.println(rs.getInt("id") + rs.getString("user_name"));
        	  if(authorized == false){
        		  if(userName.equalsIgnoreCase(rs.getString("user_name")) && userPassword.equalsIgnoreCase(rs.getString("user_password"))){
        			  userId = rs.getInt("id");
//        			  System.out.println(userId);
        			  authorized = true;
        		  }
        	  }
          }
      }
      catch( SQLException e )
      {
      	System.out.println("Cannot connect");
          throw new ServletException( e );
      }
      finally
      {
          try
          {
              if( c != null ) {
              	c.close();
              }
          }
          catch( SQLException e )
          {
              throw new ServletException( e );
          }
      }
      if(authorized == true)
      {
    	  request.getSession().setAttribute("user", userName);
    	  request.getSession().setAttribute("id", userId);
//    	  System.out.println("this is the user id " + userId);
    	  response.sendRedirect("Members");
      }
      else
      {
    	  response.sendRedirect("Login");
      }

	}

}
