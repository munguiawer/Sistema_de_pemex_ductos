package ChinaUp;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import model.Chinapdf;
import persistencia.mysql_conector;

public class Upload {
   
    mysql_conector msc = new mysql_conector();
    Chinapdf cpdf = new Chinapdf();
    public Upload(String mes,String nombre,String ruta,String usuario,Date fecha,InputStream in,String rutaMod) {
	
	copyFile(nombre,mes,nombre,usuario,fecha,in,ruta,rutaMod);
    }
    public void copyFile(String fileName,String mes,String nombre,String usuario,Date year, InputStream in,String destination,String rutaMod) {
	
	try {
	    OutputStream out = new FileOutputStream(new File(destination + fileName));
	    
	    int read = 0;
            byte[] bytes = new byte[1024];
          
            while ((read = in.read(bytes)) != -1) {
                out.write(bytes, 0, read);
            }
            
            

           
            
            SimpleDateFormat dt = new SimpleDateFormat("yyyyy"); 
            
        
        	 PreparedStatement st = msc.getConexion().prepareStatement("INSERT INTO chinapdf VALUES(null,?,?,?,?,?,?);");
		st.setString(1, mes);
		st.setString(2, fileName);
		st.setString(3,rutaMod+fileName);
		st.setString(4, usuario);
		st.setString(5, dt.format(year.getTime()));
		st.setInt(6, 0);
		st.executeUpdate();
		st.close();
		msc.getConexion().close();
		
            in.close();
            out.flush();
            out.close();
	    
	} catch (IOException | SQLException e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	    System.out.println(year.toGMTString());
	}
    }
    

}
