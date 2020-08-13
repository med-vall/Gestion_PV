package model;



import org.hibernate.Session;
import org.hibernate.Transaction;

import beans.Etudiant;
import beans.Pv;
import util.HibernateUtil;
import util.SessionFactoryUtil;

public class EtudiantModel extends HibernateUtil{

	private static final EtudiantModel INSTANCE = new EtudiantModel();
	public static EtudiantModel getInstance() {
        return INSTANCE;
    }
	  public boolean saveEt(Etudiant etd){
			Session session = SessionFactoryUtil.getInstance().openSession();
	        try {

	            Transaction trans = session.beginTransaction();
	          
	            session.save(etd);
	            
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
	  public Etudiant getEtudiant(Integer code) {
	       // log.info("********** Debut getFournisseur FournisseurDAO **********");
	        Etudiant etd = null;
	        Session session = SessionFactoryUtil.getInstance().openSession();
	        try {
	            etd = (Etudiant) session.get(Etudiant.class, code);

	            return etd;
	        } catch (Exception e) {
	            e.printStackTrace();
	           // log.fatal(e.getMessage());
	            return null;
	        } finally {
	            session.close();
	           // log.info("********** Fin getFournisseur FournisseurDAO **********");
	        }
	    }
}
