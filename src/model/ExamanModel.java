package model;

import org.hibernate.Session;
import org.hibernate.Transaction;

import beans.Etudiant;
import beans.Examan;
import beans.Pv;
import util.HibernateUtil;
import util.SessionFactoryUtil;

public class ExamanModel extends HibernateUtil{

	private static final ExamanModel INSTANCE = new ExamanModel();


	public static ExamanModel getInstance() {
        return INSTANCE;
    }
	
	
	  public boolean saveExaman(Examan ex){
			Session session = SessionFactoryUtil.getInstance().openSession();
	        try {

	            Transaction trans = session.beginTransaction();
	          
	            session.save(ex);
	            
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
	  public Examan getExaman(Integer idExaman) {
	       // log.info("********** Debut getFournisseur FournisseurDAO **********");
	        Examan exm = null;
	        Session session = SessionFactoryUtil.getInstance().openSession();
	        try {
	            exm = (Examan) session.get(Examan.class, idExaman);

	            return exm;
	        } catch (Exception e) {
	            e.printStackTrace();
	           // log.fatal(e.getMessage());
	            return null;
	        } finally {
	            session.close();
	           // log.info("********** Fin getFournisseur FournisseurDAO **********");
	        }
	    }
	  public boolean updateExam(Examan ex) {
	       // log.info("********** Debut updatefournisseur FournisseurDAO **********");
	        Session session = SessionFactoryUtil.getInstance().openSession();
	        Transaction trans = session.beginTransaction();
	        try {
	            session.update(ex);
	            trans.commit();
	            return true;
	        } catch (Exception e) {
	            e.printStackTrace();
	            //log.fatal(e.getMessage());
	            return false;
	        } finally {
	            session.close();
	           // log.info("********** Fin updatefournisseur FournisseurDAO **********");

	        }
}
}
