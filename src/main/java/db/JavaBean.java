package db;

import java.sql.*;

public class JavaBean {
	String error;
	Connection con;
	
	public JavaBean() {
	} /*default constructor*/

	public void connect() throws ClassNotFoundException, SQLException, Exception {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tema_pibd?useSSL=false", 
					"root",
					"C@nst@n72@");
		} catch (ClassNotFoundException cnfe) {
			cnfe.printStackTrace();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
}
	
	public void disconnect() throws SQLException {
		try {
			if(con != null) {
				con.close();
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
	}
	
	public Connection getConnection() {
		return con;
	}
}
