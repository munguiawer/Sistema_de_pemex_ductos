package sesion;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.faces.context.FacesContext;
import javax.persistence.Query;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import model.Usuario;
import consulta.GetPersistence;

public class SesionManager {
    private String usuario;
    private int rol;
    GetPersistence gp = new GetPersistence();
    Usuario us = new Usuario();
    String alerta = "";
    List<Usuario> listUsuario = new ArrayList<Usuario>();
   
    public void ingresar()
    {
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
	        gp.getEm().getTransaction().begin();
		Query qry = gp
			.getEm()
			.createQuery(
				"SELECT X FROM Usuario X WHERE X.nombre = ?1 ");

		qry.setParameter(1, usuario);
		listUsuario = (List<Usuario>) qry.getResultList();
		gp.getEm().getTransaction().commit();
		
				if(listUsuario.get(0).getRole().getIdRoles() == 1 || listUsuario.get(0).getRole().getIdRoles() == 3 )
				{
					
				}else
				{
					try {
						facesContext.getExternalContext().redirect( "../tblMixtas" );
					} catch (IOException e) {
						
						e.printStackTrace();
					}
				}
	    } else {
	    	try {
				facesContext.getExternalContext().redirect( "../tblMixtas" );
			} catch (IOException e) {
				
				e.printStackTrace();
			}
	    }
	
	
    }

}
