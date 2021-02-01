









package databaseconnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class databasecon {
	static Connection con;
	public static Connection getconnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/multicloud","root","adikash");

			
		}
		catch(Exception e)
		{
			System.out.println("multi-cloud database error:"+e);
		}
		return con;
	}
}
