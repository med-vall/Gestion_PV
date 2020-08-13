package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.EtudiantModel;
import model.ExamanModel;
import model.PvModel;
import model.SenctionModel;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import beans.Etudiant;
import beans.Examan;
import beans.Pv;
import beans.Senction;

import com.opensymphony.xwork2.ActionSupport;

public class PvAction extends ActionSupport implements
                    ServletRequestAware{
	private List<Object[]> listeDePv;
	private HttpServletRequest servletRequest;
	int matricule;
	String nom;
	String nomMatiere;
	String type;
	String prenom;
	String description;
	String filiere;
	String dat;
	java.util.Date date;
	private File userImage;
	private String userImageContentType;
	private String userImageFileName;
	String path;
	Etudiant etd=new Etudiant();
	Pv pv=new Pv();
	Examan ex=new Examan();
	Senction sen=new Senction();
	
	public Pv getPv() {
		return pv;
	}
	public void setPv(Pv pv) {
		this.pv = pv;
	}
	public Examan getEx() {
		return ex;
	}
	public void setEx(Examan ex) {
		this.ex = ex;
	}
	public Senction getSen() {
		return sen;
	}
	public void setSen(Senction sen) {
		this.sen = sen;
	}
	public Etudiant getEtd() {
		return etd;
	}
	public void setEtd(Etudiant etd) {
		this.etd = etd;
	}
	public int getMatricule() {
		return matricule;
	}
	public void setMatricule(int matricule) {
		this.matricule = matricule;
	}
	public List<Object[]> getListeDePv() {
		return listeDePv;
	}
	public void setListeDePv(List<Object[]> listeDePv) {
		this.listeDePv = listeDePv;
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		servletRequest=request;
		
	}

	
	public String afficherStat() {
		PvModel commDAO = PvModel.getInstance();

		listeDePv = commDAO.listePv();
		//System.out.println(listeDePv);
		servletRequest.setAttribute("listeDePv", listeDePv);
		return SUCCESS;
	}
	public HttpServletRequest getServletRequest() {
		return servletRequest;
	}
	public String afficherParMatr() {
		PvModel commDAO = PvModel.getInstance();
		    matricule=Integer.parseInt(ServletActionContext.getRequest().getParameter("matricule"));
		listeDePv = commDAO.listePvParMatricule(matricule);
		return SUCCESS;
	}
	public String redirect(){
		return SUCCESS;
	}
	public String save() throws ParseException{
		PvModel pvM=PvModel.getInstance();
		EtudiantModel etdM=EtudiantModel.getInstance();
		ExamanModel exaM=ExamanModel.getInstance();
		SenctionModel senM=SenctionModel.getInstance();
		  matricule=Integer.parseInt(ServletActionContext.getRequest().getParameter("matricule"));
		  nom=ServletActionContext.getRequest().getParameter("nom");
		 nomMatiere= ServletActionContext.getRequest().getParameter("nomMatiere");
		 prenom= ServletActionContext.getRequest().getParameter("prenom");
		 dat= ServletActionContext.getRequest().getParameter("date");
		 DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
			 date = formatter.parse(dat);
			 java.sql.Date daat=new java.sql.Date(date.getTime());
		 filiere= ServletActionContext.getRequest().getParameter("filiere");
		type= ServletActionContext.getRequest().getParameter("type");
			etd.setMatricule(matricule);
			etd.setNom(nom);
			ex.setNomMatier(nomMatiere);
			etd.setFilieur(filiere);
etd.setPrenom(prenom);
etd.setDateNissance(daat);
			ex.setType(type);
			sen.setPv(pv);
			sen.setExaman(ex);
			pv.setEtudiant(etd);
			
		boolean res=pvM.savePv(pv);
		boolean res1=etdM.saveEt(etd);
		boolean res2=exaM.saveExaman(ex);
		boolean res3=senM.saveSe(sen);
		
		 if(res && res1 && res2 && res3){
		        return SUCCESS;    
		        }else{
		           
		        return ERROR;   
		        }
	}
	
	public void setDate(Date date) {
		this.date = date;
	}
	public String savPv() throws ParseException{
		try {
		matricule=Integer.parseInt(ServletActionContext.getRequest().getParameter("matricule"));
		 description= ServletActionContext.getRequest().getParameter("description");
		 type= ServletActionContext.getRequest().getParameter("type");
		 dat= ServletActionContext.getRequest().getParameter("date");
		 DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
			 date = formatter.parse(dat);
			 java.sql.Date daat=new java.sql.Date(date.getTime());
			 String filePath = servletRequest.getRealPath("/");
				System.out.println("Server path:" + filePath);
				File fileToCreate = new File(filePath, this.userImageFileName);
		         
				path =fileToCreate.getAbsolutePath();
				FileUtils.copyFile(this.userImage, fileToCreate);
						byte[] image = new byte[(int) fileToCreate.length()];
						 FileInputStream fileInputStream = new FileInputStream(fileToCreate);
					        fileInputStream.read(image);
					        fileInputStream.close();
					        pv.setImage(image);
					 pv.setDate(daat);
					 pv.setDescription(description);
					 pv.setType(type);
					 pv.setPath(path);
				EtudiantModel etdM=EtudiantModel.getInstance();
				Etudiant etd=etdM.getEtudiant(matricule);
				pv.setEtudiant(etd);
				
				PvModel pvM=PvModel.getInstance();
				boolean res=pvM.savePv(pv);
				HttpSession session = servletRequest.getSession();
				session.setAttribute("pv", pv.getIdPv());
				
				 if(res){
				        return SUCCESS;    
				        }else{
				           
				        return ERROR;   
				        }
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						return ERROR;   
					}
				
				
				
	}
	public File getUserImage() {
		return userImage;
	}
	public void setUserImage(File userImage) {
		this.userImage = userImage;
	}
	public String getUserImageContentType() {
		return userImageContentType;
	}
	public void setUserImageContentType(String userImageContentType) {
		this.userImageContentType = userImageContentType;
	}
	public String getUserImageFileName() {
		return userImageFileName;
	}
	public void setUserImageFileName(String userImageFileName) {
		this.userImageFileName = userImageFileName;
	}
	 public String deletePv(){
	        PvModel pvm=PvModel.getInstance();
	        Integer idPv = Integer.parseInt(ServletActionContext.getRequest().getParameter("param"));
	        Pv pv=pvm.getPv(idPv);
	        pvm.deletePv(pv);
	        return SUCCESS;
	    }
	 public String updatePv(){
	        PvModel pvm=PvModel.getInstance();
	        Integer idPv = Integer.parseInt(ServletActionContext.getRequest().getParameter("param"));
	      pv=pvm.getPv(idPv);
	      Etudiant etd= pv.getEtudiant();
	      HttpSession session = servletRequest.getSession();
			session.setAttribute("idPv", pv.getIdPv());
			session.setAttribute("description", pv.getDescription());
			session.setAttribute("date", pv.getDate());
			session.setAttribute("type", pv.getType());
			session.setAttribute("etd",etd.getMatricule());
	        
	        return SUCCESS;
	    }
	  public String saveUpdatePv() throws ParseException{
	  
	        try {
	            PvModel pvm=PvModel.getInstance();
	            Integer idPv = Integer.parseInt(ServletActionContext.getRequest().getParameter("idPv"));
	            Integer matricule = Integer.parseInt(ServletActionContext.getRequest().getParameter("matricule"));
		 	    
	            EtudiantModel etdm=EtudiantModel.getInstance();
	            etd=etdm.getEtudiant(matricule);
	            
	        description= ServletActionContext.getRequest().getParameter("description");
			 type= ServletActionContext.getRequest().getParameter("type");
			 dat= ServletActionContext.getRequest().getParameter("date");
			 DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
				 date = formatter.parse(dat);
				 java.sql.Date daat=new java.sql.Date(date.getTime());
				 String filePath = servletRequest.getRealPath("/");
					System.out.println("Server path:" + filePath);
					File fileToCreate = new File(filePath, this.userImageFileName);
			         
					path =fileToCreate.getAbsolutePath();
					FileUtils.copyFile(this.userImage, fileToCreate);
							byte[] image = new byte[(int) fileToCreate.length()];
							 FileInputStream fileInputStream = new FileInputStream(fileToCreate);
						        fileInputStream.read(image);
						        fileInputStream.close();
						        pv.setIdPv(idPv);
						        pv.setImage(image);
						 pv.setDate(daat);
						 pv.setDescription(description);
						 pv.setType(type);
						 pv.setPath(path);
						 pv.setEtudiant(etd);
	        boolean res=pvm.updatePv(pv);
	        if(res){
	        return SUCCESS;    
	        }else{
	            addActionError("echec de MAJ");
	        return ERROR;   
	        }
	        } catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return ERROR;   
			}
	        
	    }
	        
}
