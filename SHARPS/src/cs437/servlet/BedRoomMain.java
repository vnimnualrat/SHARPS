package cs437.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs437.model.Bedroom;

@WebServlet("/BedRoomMain")
public class BedRoomMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BedRoomMain() {
        super();

    }
    
	private Bedroom getBedroom(Integer id) throws ServletException {
		Bedroom br = null;
		Connection c = null;
		try {
			String url = "jdbc:mysql://localhost/cs496stu02";
			String username = "cs496stu02";
			String password = "32rtalvU";

			String sql = "select * from bedrooms where user_id = ?";

			c = DriverManager.getConnection(url, username, password);
			PreparedStatement pstmt = c.prepareStatement(sql);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next())
				br = new Bedroom(rs.getInt("user_id"), rs.getInt("light_intensity"), rs.getInt("room_temperature"),
						rs.getString("tv_power"), rs.getInt("tv_volume"),rs.getString("radio_power"), rs.getInt("radio_volume"));
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

		return br;
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Bedroom br = getBedroom(Integer.valueOf(request.getParameter("id")));
		request.getSession().setAttribute("br", br);
		request.getRequestDispatcher("/WEB-INF/BedRoomMain.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
