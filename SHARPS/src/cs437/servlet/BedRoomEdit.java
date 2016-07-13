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

@WebServlet("/BedRoomEdit")
public class BedRoomEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BedRoomEdit() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/BedRoomEdit.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Integer id = Integer.valueOf(request.getParameter("id"));
		Integer lightIntensity = Integer.valueOf(request.getParameter("lightIntensity"));
		Integer roomTemperature = Integer.valueOf(request.getParameter("roomTemperature"));
		String tvPower = request.getParameter("tvPower");
		Integer tvVolume = Integer.valueOf(request.getParameter("tvVolume"));
		String radioPower = request.getParameter("radioPower");
		Integer radioVolume = Integer.valueOf(request.getParameter("radioVolume"));


		
		 Connection c = null;
	        try
	        {
				String url = "jdbc:mysql://localhost/cs496stu02";
				String username = "cs496stu02";
				String password = "32rtalvU";

	            String sql = "update bedrooms set light_intensity = ?, room_temperature = ?, tv_power = ?, tv_volume = ?, radio_power = ?, radio_volume = ? where user_id = ?";

	            c = DriverManager.getConnection( url, username, password );
	            PreparedStatement pstmt = c.prepareStatement( sql );
	            pstmt.setInt( 1, lightIntensity );
	            pstmt.setInt( 2,  roomTemperature);
	            pstmt.setString(3, tvPower);
	            pstmt.setInt(4, tvVolume);
	            pstmt.setString(5, radioPower);
	            pstmt.setInt(6, radioVolume);
	            pstmt.setInt(7, id);
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
		

		response.sendRedirect("BedRoomMain?id=" + id);
	}

}
