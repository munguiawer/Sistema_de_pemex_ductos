package conector;



import java.sql.DriverManager;

import java.sql.Connection;



public class mysql_conn {
	
	Connection con;
	
	public  mysql_conn()
	{
		try {
			 Class.forName("com.mysql.jdbc.Driver");
			 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sasp?useUnicode=yes&characterEncoding=UTF-8&zeroDateTimeBehavior=round", "root", "Alvar0");
		} catch (Exception e) {
			
		}
	}

	public Connection getCon() {
		return con;
	}
	
	
	

}
