package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class MyConnection {
	
	private static Connection con;
	
	public static Connection getConnection(){
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection("jdbc:mysql://localhost/rupp","rupp","12345");
		}catch(Exception e){
			System.out.println(e.getMessage());
		}		
		return con;
	}
}
