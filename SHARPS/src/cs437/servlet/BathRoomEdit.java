package cs437.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BathRoomEdit")
public class BathRoomEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BathRoomEdit() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/BathRoomEdit.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer id = Integer.valueOf(request.getParameter("id"));
		Integer lightIntensity = Integer.valueOf(request.getParameter("lightIntensity"));
		Integer roomTemperature = Integer.valueOf(request.getParameter("roomTemperature"));
		Integer waterTemperature = Integer.valueOf(request.getParameter("waterTemperature"));
		String radioPower = request.getParameter("radioPower");
		Integer radioVolume = Integer.valueOf(request.getParameter("radioVolume"));

		 Connection c = null;
	        try
	        {
				String url = "jdbc:mysql://localhost/cs496stu02";
				String username = "cs496stu02";
				String password = "32rtalvU";

	            String sql = "update bathrooms set light_intensity = ?, room_temperature = ?, water_temperature = ?, radio_power = ?, radio_volume = ? where user_id = ?";

	            c = DriverManager.getConnection( url, username, password );
	            PreparedStatement pstmt = c.prepareStatement( sql );
	            pstmt.setInt( 1, lightIntensity );
	            pstmt.setInt( 2,  roomTemperature);
	            pstmt.setInt(3, waterTemperature);
	            pstmt.setString(4, radioPower);
	            pstmt.setInt(5, radioVolume);
	            pstmt.setInt(6, id);
	            pstmt.executeUpdate();
	        }
	        catch( SQLException e )
	        {
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
		

		response.sendRedirect("BathRoomMain?id=" + id);
	}

}
