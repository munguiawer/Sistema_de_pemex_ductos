package sesion;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;



import javax.faces.context.FacesContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import persistencia.Mysql_users;



public class Usuarios {
	private String usuario;
	private int rol;
	private Mysql_users mys_u = new Mysql_users ();
	public Usuarios() {
		FacesContext facesContext = FacesContext.getCurrentInstance();

	    HttpServletRequest request = (HttpServletRequest) facesContext.getExternalContext().getRequest();
	    Cookie cookie = null;

	    Cookie[] userCookies = request.getCookies();
	    if (userCookies != null && userCookies.length > 0 ) {
	        for (int i = 0; i < userCookies.length; i++) {
	            if (userCookies[i].getName().equals("usuario")) {
	                cookie = userCookies[i];
	                break;
	            }
	        }
	    }
    // procesar la cookie para hacer lo programado respecto al usuario y su cargo
	    if (cookie != null) {
	        usuario = (String) cookie.getValue();
	        try {
				PreparedStatement ps = mys_u.getConexion().prepareStatement("SELECT * FROM usuarios WHERE Nombre = ?; ");
				ps.setString(1, usuario);
				ps.execute();
				if(ps.getResultSet().next())
				{
					rol = ps.getResultSet().getInt("Rol");
				}else
				{
					try {
						facesContext.getExternalContext().redirect( "../PemexDuctos" );
					} catch (IOException e) {
						
						e.printStackTrace();
					}
				}
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
	    } else {
	    	try {
				facesContext.getExternalContext().redirect( "../PemexDuctos" );
			} catch (IOException e) {
				
				e.printStackTrace();
			}
	    }
		
	}
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public int getRol() {
	    return rol;
	}
	public void setRol(int rol) {
	    this.rol = rol;
	}
	
	

}
