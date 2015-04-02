package persistencia;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class GetPersistence {
    private   EntityManagerFactory emf = Persistence.createEntityManagerFactory("Grafica_de_mixtos");
    private   EntityManager em = emf.createEntityManager();
    
      public EntityManagerFactory getEmf() {
          return emf;
      }
      public void setEmf(EntityManagerFactory emf) {
          this.emf = emf;
      }
      public EntityManager getEm() {
          return em;
      }
      public void setEm(EntityManager em) {
          this.em = em;
      }

}
