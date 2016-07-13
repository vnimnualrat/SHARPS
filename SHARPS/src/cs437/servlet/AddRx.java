package cs437.servlet;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

@WebServlet("/AddRx")
public class AddRx extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddRx() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Or in the DoGet");
		request.getRequestDispatcher("/WEB-INF/HealthMain.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		  insertStuff(request, response);
	}
	
	protected void insertStuff(HttpServletRequest request, HttpServletResponse response){
		Connection conn = null;
		conn = connectDB();
		try {
			
			  String name = request.getParameter("name");
			  int quantity = Integer.parseInt(request.getParameter("quantity"));
			  String expiration = request.getParameter("expiration");
			  String dosage = request.getParameter("dosage");
			  
			//  System.out.println(name + " " + quantity + " " + expiration + " " + dosage);
			
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement("INSERT INTO medicine(medName, medQuantity, medExpiration, medDosage) VALUES(?, ?, ?, ?)");
			ps.setString(1, name);
			ps.setInt(2, quantity);
			ps.setString(3, expiration);
			ps.setString(4, dosage);
			ps.execute();
			ps.close();
			
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	protected Connection connectDB() {
			Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/cs496stu02";
			String username = "cs496stu02";
			String password = "32rtalvU";
			conn = (Connection) DriverManager.getConnection(url, username, password);
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return conn;
	}

}
