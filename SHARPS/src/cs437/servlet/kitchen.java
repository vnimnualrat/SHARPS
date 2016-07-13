package cs437.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
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

import cs437.model.KitchenEntry;



/**
 * Servlet implementation class kitchen
 */
@WebServlet("/kitchen")
public class kitchen extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public kitchen() {
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


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 List<KitchenEntry> entries = new ArrayList<KitchenEntry>();
	        Connection c = null;
	        try
	        {
	            String url = "jdbc:mysql://cs3.calstatela.edu/cs496stu02";
	            String username = "cs496stu02";
	            String password = "32rtalvU";

	           c = DriverManager.getConnection( url, username, password );
	            Statement stmt = c.createStatement();
	            ResultSet rs = stmt.executeQuery( "select * from kitchen" );
	            
	            while( rs.next() )
	            {
	            	KitchenEntry entry = new KitchenEntry(
	            			rs.getInt("quantity"),rs.getString( "item"),rs.getString( "exp" ), rs.getInt("percent") );
	            	entries.add(entry);
	            }
	        }
	        catch( SQLException e )
	        {
	            throw new ServletException( e );
	        }
	        finally
	        {
	        	try
	        	{
	        			if( c != null) c.close();
	        	}
	        	catch( SQLException e)
	        	{
	        		throw new ServletException(e);
	        	}
	        }
	    	request.setAttribute("entries", entries);
		
		 request.getRequestDispatcher("/WEB-INF/kitchen1.jsp").forward(
	        		request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
