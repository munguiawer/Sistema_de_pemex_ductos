package implementacion;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.apache.commons.codec.digest.DigestUtils;

import model.Role;
import model.Usuario;
import consulta.GetPersistence;

public class Guardar_Personal {

    GetPersistence gp = new GetPersistence();
    Usuario usuario = new Usuario();
    Role role = new Role();
    Role lr = new Role();
    List<Role>  ListaRol = new ArrayList<Role>();
    String nombre;
    String password;
    String password2;
    String rol;
    String estado = "";

    String encriptPass;
    
    public Guardar_Personal() {
	
	    gp.getEm().getTransaction().begin();
	    // aqui va la clase no como se llama en la base de datos en este caso la tabla en la base de datos se llama roles pero
	    // tenemos que ponerle el de la clase en este caso Role
	    Query qry = gp.getEm().createQuery("SELECT X FROM Role X");
	    ListaRol = (List<Role>) qry.getResultList();
	    gp.getEm().getTransaction().commit();
	
	
    }

    // M�todo para obtener el rol
    public Role timpo_de_usuario(int tipo) {
	try {

	    role = gp.getEm().find(Role.class, tipo);

	} catch (Exception e) {
	    System.out.println(e.getMessage());
	}

	return role;

    }

    public void Guardar_usuario() {
	
	ejecutar_guardado();
    }
    public void ejecutar_guardado()
    {
	if (password.endsWith(password2)) {
	    try {
		gp.getEm().getTransaction().begin();
		/* inserto datos necesarios */
		usuario.setNombre(nombre);
		encriptPass = DigestUtils.md5Hex(password); 
		usuario.setPassword(encriptPass);
		int roL = Integer.parseInt(rol);
		usuario.setRole(timpo_de_usuario(roL));
		/* ejecuto el guardado */
		gp.getEm().persist(usuario);
		gp.getEm().getTransaction().commit();
		estado = "Guardado";
	    } catch (Exception e) {
		estado = "No guardado ";
		gp.getEm().getTransaction().rollback();
		System.out.println(e.getMessage());
		

	    } finally {

	    }
	}else{
	    estado = "Las claves no son iguales";
	}
    }

    public String getNombre() {
	return nombre;
    }

    public void setNombre(String nombre) {
	this.nombre = nombre;
    }

    public String getPassword() {
	return password;
    }

    public void setPassword(String password) {
	this.password = password;
    }

    public String getRol() {
	return rol;
    }

    public void setRol(String rol) {
	this.rol = rol;
    }

    public String getPassword2() {
	return password2;
    }

    public void setPassword2(String password2) {
	this.password2 = password2;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public List<Role> getListaRol() {
        return ListaRol;
    }

    public void setListaRol(List<Role> listaRol) {
        ListaRol = listaRol;
    }

 
    
    
    
}
