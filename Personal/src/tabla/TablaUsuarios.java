package tabla;

import java.util.ArrayList;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.persistence.Query;

import org.apache.commons.codec.digest.DigestUtils;
import org.primefaces.event.RowEditEvent;

import consulta.GetPersistence;
import model.Role;
import model.Usuario;

public class TablaUsuarios {
     int rol;
    GetPersistence gp = new GetPersistence();
    Usuario us = new Usuario();
    List<Usuario> listUsuario = new ArrayList<Usuario>();
public TablaUsuarios() {
    gp.getEm().getTransaction().begin();
    // aqui va la clase no como se llama en la base de datos en este caso la tabla en la base de datos se llama roles pero
    // tenemos que ponerle el de la clase en este caso Role
    Query qry = gp.getEm().createQuery("SELECT X FROM Usuario X");
    listUsuario = (List<Usuario>) qry.getResultList();
    gp.getEm().getTransaction().commit();
}
 
  public void borrar(Usuario u)
  {
     
      us = u;
      
      gp.getEm().getTransaction().begin();
      gp.getEm().remove(us);
      gp.getEm().getTransaction().commit();
      
      
  }
//Obtenemos el objeto rol apartir de su id y lo regresamos
  public Role timpo_de_usuario(int tipo) {
      Role role = new Role();
	try {

	    role = gp.getEm().find(Role.class, tipo);

	} catch (Exception e) {
	    System.out.println(e.getMessage());
	}

	return role;

  }
  public void update(RowEditEvent event) {
      Usuario us = (Usuario) event.getObject();
      //pasamos el objeto rol por medio del metodo timpo_de_usuario
      us.setRole(timpo_de_usuario(rol));
      gp.getEm().getTransaction().begin();
      gp.getEm().merge(us);
      gp.getEm().getTransaction().commit();
  }

public List<Usuario> getListUsuario() {
    return listUsuario;
}
public void setListUsuario(List<Usuario> listUsuario) {
    this.listUsuario = listUsuario;
}

public int getRol() {
    return rol;
}

public void setRol(int rol) {
    this.rol = rol;
}

}
