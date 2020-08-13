package controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.EtudiantModel;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import beans.Etudiant;

import com.opensymphony.xwork2.ActionSupport;

public class EtudiantAction extends ActionSupport implements
                     ServletRequestAware{
	private HttpServletRequest servletRequest;
	int matricule;
	String nom;
	
	String prenom;
	String filiere;
	String dat;
	java.util.Date date;
	Etudiant etd=new Etudiant();
	
	@Override
	public void setServletRequest(HttpServletRequest servletRequest) {
		this.servletRequest=servletRequest;
		
	}
	public String saveEtd() throws ParseException{
		EtudiantModel etdM=EtudiantModel.getInstance();
		 matricule=Integer.parseInt(ServletActionContext.getRequest().getParameter("matricule"));
		  nom=ServletActionContext.getRequest().getParameter("nom");
		  prenom= ServletActionContext.getRequest().getParameter("prenom");
			 dat= ServletActionContext.getRequest().getParameter("date");
			 DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
				 date = formatter.parse(dat);
				 java.sql.Date daat=new java.sql.Date(date.getTime());
			 filiere= ServletActionContext.getRequest().getParameter("filiere");
			 
			 etd.setCode(matricule);
				etd.setNom(nom);
				etd.setDateNissance(daat);
				etd.setPrenom(prenom);
				etd.setFilieur(filiere);
				boolean res1=etdM.saveEt(etd);
				HttpSession session = servletRequest.getSession();
				session.setAttribute("etd", etd.getMatricule());
				 if( res1 ){
				        return SUCCESS;    
				        }else{
				           
				        return ERROR;   
				        }
		
	}
	public HttpServletRequest getServletRequest() {
		return servletRequest;
	}
	

}
