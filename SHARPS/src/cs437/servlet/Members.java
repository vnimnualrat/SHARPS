package cs437.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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
import cs437.model.User;

/**
 * Servlet implementation class Members
 */
@WebServlet("/Members")
public class Members extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Members() {
        super();
    }
    
    public void init(ServletConfig config) throws ServletException 
    {
    	super.init(config);
    	
        try
        {
            Class.forName( "com.mysql.jdbc.Driver" );
        }
        catch( ClassNotFoundException e )
        {
            throw new ServletException( e );
        }
    }
    
    private LoginModel getEntry( Integer id ) throws ServletException
    {
    	LoginModel entry = null;
        Connection c = null;
        try
        {
            String url = "jdbc:mysql://localhost:3306/cs496stu02";
            String username = "cs496stu02";
            String password = "32rtalvU";

            String sql = "select * from loginTable where id = ?";
            
//            System.out.println("connecting member");
            c = DriverManager.getConnection( url, username, password );
            
            PreparedStatement pstmt = c.prepareStatement( sql );
            pstmt.setInt( 1, id );
            ResultSet rs = pstmt.executeQuery();

            if( rs.next() )
                entry = new LoginModel(rs.getInt("id"), rs.getString("user_name"), rs.getString("user_password"));
        }
        catch( SQLException e )
        {
//        	System.out.println("unable to connect to member");
            throw new ServletException( e );
        }
        finally
        {
            try
            {
                if( c != null ) c.close();
            }
            catch( SQLException e )
            {
                throw new ServletException( e );
            }
        }

        return entry;
    }
    
    private User getUser(Integer id) throws ServletException {
		User user = null;
		Connection c = null;
		try {
			String url = "jdbc:mysql://localhost/cs496stu02";
			String username = "cs496stu02";
			String password = "32rtalvU";

			String sql = "select * from users where user_id = ?";

			c = DriverManager.getConnection(url, username, password);
			PreparedStatement pstmt = c.prepareStatement(sql);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next())
				user = new User(rs.getInt("user_id"), rs.getString("first_name"),
						rs.getString("last_name"));
		} catch (SQLException e) {
			throw new ServletException(e);
		} finally {
			try {
				if (c != null)
					c.close();
			} catch (SQLException e) {
				throw new ServletException(e);
			}
		}

		return user;
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer id = (Integer) request.getSession().getAttribute("id");
		User user = getUser(id);
		request.getSession().setAttribute("user", user);
		
		request.getRequestDispatcher("/WEB-INF/Members.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
