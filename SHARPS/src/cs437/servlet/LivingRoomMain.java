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

import cs437.model.Livingroom;

@WebServlet("/LivingRoomMain")
public class LivingRoomMain extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LivingRoomMain() {
		super();

	}

	private Livingroom getLivingroom(Integer id) throws ServletException {
		Livingroom lr = null;
		Connection c = null;
		try {
			String url = "jdbc:mysql://localhost/cs496stu02";
			String username = "cs496stu02";
			String password = "32rtalvU";

			String sql = "select * from livingrooms where user_id = ?";

			c = DriverManager.getConnection(url, username, password);
			PreparedStatement pstmt = c.prepareStatement(sql);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next())
				lr = new Livingroom(rs.getInt("user_id"), rs.getInt("light_intensity"), rs.getInt("room_temperature"),
						rs.getString("tv_power"), rs.getInt("tv_volume"), rs.getString("radio_power"), rs.getInt("radio_volume"));
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

		return lr;
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Livingroom lr = getLivingroom(Integer.valueOf(request.getParameter("id")));
		request.getSession().setAttribute("lr", lr);
		request.getRequestDispatcher("/WEB-INF/LivingRoomMain.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
