package factory;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn {
	static Connection con;
	public static Connection getConn() {
		try {
			if(con==null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				con =DriverManager.getConnection("jdbc:mysql://localhost:3306/User","root","root");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	}
}
