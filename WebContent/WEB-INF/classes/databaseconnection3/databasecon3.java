package databaseconnection3;

import java.sql.Connection;
import java.sql.DriverManager;

public class databasecon3 {
	static Connection con;
	public static Connection getconnection()
	{
 		
 			
		try
		{
			Class.forName("com.mysql.jdbc.Driver");	
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloudserver3","root","root");
		}
		catch(Exception e)
		{
			System.out.println("cloudserver3 error:"+e);
		}
		return con;
	}
	

}
