package model;

import java.util.List;








import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import util.HibernateUtil;
import beans.Etudiant;
import beans.Pv;
import beans.User;
import util.SessionFactoryUtil;
public class UserModel {

	
	private static final UserModel INSTANCE = new UserModel();
	public static UserModel getInstance() {
        return INSTANCE;
    }
	
	public List<User> getUsers(){
		// log.info("********** Debut listeProduit ProduitDAO **********");
	        Session session = SessionFactoryUtil.getInstance().openSession();
	        List<User> listeProduit=null;
	        try {
	            Query query=session.createQuery("from User");
	            listeProduit=query.list();
	            return listeProduit;
	        } catch (Exception e) {
	            e.printStackTrace();
	            //log.fatal(e.getMessage());
	        } finally {
	            session.close();
	           // log.info("********** Fin listeProduit ProduitDAO **********");

	        }
	        return listeProduit;
}
	public User getUser(Integer idUser) {
	       
	        User usr;
	        Session session = SessionFactoryUtil.getInstance().openSession();
	        try {
	            usr = (User) session.get(User.class, idUser);

	            return usr;
	        } catch (Exception e) {
	            e.printStackTrace();
	           // log.fatal(e.getMessage());
	            return null;
	        } finally {
	            session.close();
	           // log.info("********** Fin getFournisseur FournisseurDAO **********");
	        }
	    }
	
	public List<User> getChefs(){
		// log.info("********** Debut listeProduit ProduitDAO **********");
	        Session session = SessionFactoryUtil.getInstance().openSession();
	        List<User> listeChef=null;
	        try {
	            Query query=session.createQuery("from User WHERE type='chef'");
	            listeChef=query.list();
	            return listeChef;
	        } catch (Exception e) {
	            e.printStackTrace();
	            //log.fatal(e.getMessage());
	        } finally {
	            session.close();
	           // log.info("********** Fin listeProduit ProduitDAO **********");

	        }
	        return listeChef;
}
	public List<User> getMembres(){
		// log.info("********** Debut listeProduit ProduitDAO **********");
	        Session session = SessionFactoryUtil.getInstance().openSession();
	        List<User> listeChef=null;
	        try {
	            Query query=session.createQuery("from User WHERE type='membre'");
	            listeChef=query.list();
	            return listeChef;
	        } catch (Exception e) {
	            e.printStackTrace();
	            //log.fatal(e.getMessage());
	        } finally {
	            session.close();
	           // log.info("********** Fin listeProduit ProduitDAO **********");

	        }
	        return listeChef;
}
	
	public boolean saveUser(User us){
		Session session = SessionFactoryUtil.getInstance().openSession();
        try {

            Transaction trans = session.beginTransaction();
            session.save(us);
            trans.commit();
           
            return true;
        } catch (Exception e) {
            e.printStackTrace();
           // log.fatal(e.getMessage());
            return false;
        } finally {
            session.close();
           // log.info("********** Fin saveFournisseur FournisseurDAO **********");
        }
        }
	public User add(User contact) {
		Session session =SessionFactoryUtil.getInstance().getCurrentSession();
		session.beginTransaction();
		session.save(contact);
		session.getTransaction().commit();
		
		return contact;
	}
	 public boolean deleteUser(User usr) {
		   //     log.info("********** Debut deleteFournisseur FournisseurDAO **********");
		        Session session = SessionFactoryUtil.getInstance().openSession();
		        try {
		            Transaction trans = session.beginTransaction();
		            session.delete(usr);
		            trans.commit();
		            return true;
		        } catch (Exception e) {
		            e.printStackTrace();
		       //     log.fatal(e.getMessage());
		            return false;
		        } finally {
		            session.close();
		           // log.info("********** Fin deleteFournisseur FournisseurDAO **********");
		        }
		 }
}
