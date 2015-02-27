package persistencia;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Mysql_users {
    private Connection conexion = null;

    public Mysql_users() {
	try {
	    Class.forName("com.mysql.jdbc.Driver");
	    try {
		conexion = DriverManager
			.getConnection(
				"jdbc:mysql://localhost:3306/administrador?useUnicode=yes&characterEncoding=UTF-8&zeroDateTimeBehavior=round",
				"root", "Alvar0");
	    } catch (SQLException ex) {
		Logger.getLogger(Mysql_users.class.getName()).log(
			Level.SEVERE, null, ex);
	    }
	} catch (ClassNotFoundException ex) {
	    Logger.getLogger(Mysql_users.class.getName()).log(Level.SEVERE,
		    null, ex);
	}
    }

    public Connection getConexion() {

	return conexion;
    }
}
