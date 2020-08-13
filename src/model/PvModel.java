package model;

import java.util.List;


import org.hibernate.Query;
import org.hibernate.Session;


import org.hibernate.Transaction;

import beans.Etudiant;
import beans.Examan;
import beans.Pv;
import util.SessionFactoryUtil;
import util.HibernateUtil;

public class PvModel extends HibernateUtil{

	private static final PvModel INSTANCE = new PvModel();

	public static PvModel getInstance() {
        return INSTANCE;
    }
	
	  public List<Object[]>  listePv() {
	     //   log.info("********** Debut listeCommande CommandeDAO **********");
	        Session session = SessionFactoryUtil.getInstance().openSession();
	        List<Object[]> liste = null;
	        try {
	            Query query = session.createQuery("select Pv.idPv,Examan.nomMatier,Examan.dateExaman,Pv.type,Etudiant.code,Etudiant.filieur,Pv.path,Examan.idExaman from"
	                    + "  Senction as senction "
	                    + " inner join senction.examan as Examan"
	                    + " inner join senction.pv as Pv "
	                    + " inner join Pv.etudiant as Etudiant");
	            
	            liste=query.list();
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	          //  log.fatal(e.getMessage());
	        } finally {
	            session.close();
	           // log.info("********** Fin listeCommande CommandeDAO **********");
	        }
	        
	        return liste;
	    }
	  public List<Object[]>  listePvParMatricule(int code) {
		     //   log.info("********** Debut listeCommande CommandeDAO **********");
		        Session session = SessionFactoryUtil.getInstance().openSession();
		        List<Object[]> liste = null;
		        try {
		            Query query = session.createQuery("select Pv.idPv,Examan.nomMatier,Examan.dateExaman,Pv.type,Etudiant.code,Etudiant.filieur,Pv.path from"
		                    + "  Senction as senction "
		                    + " inner join senction.examan as Examan"
		                    + " inner join senction.pv as Pv "
		                    + " inner join Pv.etudiant as Etudiant WHERE Etudiant.code="+code);
		            
		            liste=query.list();
		            
		        } catch (Exception e) {
		            e.printStackTrace();
		          //  log.fatal(e.getMessage());
		        } finally {
		            session.close();
		           // log.info("********** Fin listeCommande CommandeDAO **********");
		        }
		        
		        return liste;
		    }
	  public List<Object[]>  listePv(int idpv) {
		     //   log.info("********** Debut listeCommande CommandeDAO **********");
		        Session session = SessionFactoryUtil.getInstance().openSession();
		        List<Object[]> liste = null;
		        try {
		            Query query = session.createQuery("select Pv.idPv,Pv.description,Pv.type,Pv.date,Examan.nomMatier,Examan.dateExaman,Examan.Type from"
		                    + "  Senction as senction "
		                    + " inner join senction.examan as Examan"
		                    + " inner join senction.pv as Pv "
		                    + " inner join Pv.etudiant as Etudiant WHERE Pv.idPv="+idpv);
		            
		            liste=query.list();
		            
		        } catch (Exception e) {
		            e.printStackTrace();
		          //  log.fatal(e.getMessage());
		        } finally {
		            session.close();
		           // log.info("********** Fin listeCommande CommandeDAO **********");
		        }
		        
		        return liste;
		    }
	  public boolean savePv(Pv pv){
			Session session = SessionFactoryUtil.getInstance().openSession();
	        try {

	            Transaction trans = session.beginTransaction();
	          
	            session.save(pv);
	            
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
	  public Pv getPv(Integer idPv) {
	       // log.info("********** Debut getFournisseur FournisseurDAO **********");
	        Pv pv = null;
	        Session session = SessionFactoryUtil.getInstance().openSession();
	        try {
	            pv = (Pv) session.get(Pv.class, idPv);

	            return pv;
	        } catch (Exception e) {
	            e.printStackTrace();
	           // log.fatal(e.getMessage());
	            return null;
	        } finally {
	            session.close();
	           // log.info("********** Fin getFournisseur FournisseurDAO **********");
	        }
	    }
	  public boolean deletePv(Pv pv) {
		   //     log.info("********** Debut deleteFournisseur FournisseurDAO **********");
		        Session session = SessionFactoryUtil.getInstance().openSession();
		        try {
		            Transaction trans = session.beginTransaction();
		            session.delete(pv);
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
	  public boolean updatePv(Pv pv) {
	       // log.info("********** Debut updatefournisseur FournisseurDAO **********");
	        Session session = SessionFactoryUtil.getInstance().openSession();
	        Transaction trans = session.beginTransaction();
	        try {
	            session.update(pv);
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
