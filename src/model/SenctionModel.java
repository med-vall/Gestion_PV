package model;

import org.hibernate.Session;
import org.hibernate.Transaction;

import beans.Pv;
import beans.Senction;
import util.HibernateUtil;
import util.SessionFactoryUtil;

public class SenctionModel extends HibernateUtil{

	private static final SenctionModel INSTANCE = new SenctionModel();

	public static SenctionModel getInstance() {
        return INSTANCE;
    }
	
	  public boolean saveSe(Senction sen){
			Session session = SessionFactoryUtil.getInstance().openSession();
	        try {

	            Transaction trans = session.beginTransaction();
	          
	            session.save(sen);
	            
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
}
