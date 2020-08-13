package controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.ExamanModel;
import model.PvModel;
import model.SenctionModel;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import beans.Examan;
import beans.Pv;
import beans.Senction;

import com.opensymphony.xwork2.ActionSupport;

public class ExamanAction extends ActionSupport implements
                         ServletRequestAware{
	private HttpServletRequest servletRequest;
	String nomMatiere;
	int idPv;
	int idExaman;
	String type;
	String dat;
	java.util.Date date;
	Examan ex=new Examan();

	public HttpServletRequest getServletRequest() {
		return servletRequest;
	}

	@Override
	public void setServletRequest(HttpServletRequest servletRequest) {
		
		this.servletRequest=servletRequest;
	}

	public String savEx() throws ParseException{
		idPv=Integer.parseInt(ServletActionContext.getRequest().getParameter("idPv"));
		nomMatiere=ServletActionContext.getRequest().getParameter("nomMatiere");
		type=ServletActionContext.getRequest().getParameter("type");
		 dat= ServletActionContext.getRequest().getParameter("date");
		 DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
			 date = formatter.parse(dat);
			 java.sql.Date daat=new java.sql.Date(date.getTime());
			 ExamanModel exaM=ExamanModel.getInstance();
			 PvModel pvM=PvModel.getInstance();
			 ex.setDateExaman(daat);
			 ex.setNomMatier(nomMatiere);
			 ex.setType(type);
			 boolean res2=exaM.saveExaman(ex);
			 
			 SenctionModel senM=SenctionModel.getInstance();
			 Examan exm=exaM.getExaman(ex.getIdExaman());
					 Pv p=pvM.getPv(idPv);
					 Senction sen=new Senction();
					 sen.setExaman(exm);
					 sen.setPv(p);
					 boolean res3=senM.saveSe(sen);
					 
			 if( res2 && res3){
			        return SUCCESS;    
			        }else{
			           
			        return ERROR;   
			        }
			 
		}
	public String updateExaman(){
        ExamanModel exm=ExamanModel.getInstance();
        Integer idExaman = Integer.parseInt(ServletActionContext.getRequest().getParameter("parame"));
      ex=exm.getExaman(idExaman);
      System.out.println(ex.getNomMatier());
      HttpSession session = servletRequest.getSession();
		session.setAttribute("idExaman", ex.getIdExaman());
		session.setAttribute("nomMatier", ex.getNomMatier());
		session.setAttribute("type", ex.getType());
		session.setAttribute("date", ex.getDateExaman());
        
        return SUCCESS;
    }

	public String getNomMatiere() {
		return nomMatiere;
	}

	public void setNomMatiere(String nomMatiere) {
		this.nomMatiere = nomMatiere;
	}

	public int getIdExaman() {
		return idExaman;
	}

	public void setIdExaman(int idExaman) {
		this.idExaman = idExaman;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public java.util.Date getDate() {
		return date;
	}

	public void setDate(java.util.Date date) {
		this.date = date;
	}

	public Examan getEx() {
		return ex;
	}

	public void setEx(Examan ex) {
		this.ex = ex;
	}
	public String saveUpdateExam() throws ParseException{
		idExaman=Integer.parseInt(ServletActionContext.getRequest().getParameter("idExaman"));
		nomMatiere=ServletActionContext.getRequest().getParameter("nomMatiere");
		type=ServletActionContext.getRequest().getParameter("type");
		 dat= ServletActionContext.getRequest().getParameter("date");
		 DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
			 date = formatter.parse(dat);
			 java.sql.Date daat=new java.sql.Date(date.getTime());
			 ExamanModel exaM=ExamanModel.getInstance();
			 PvModel pvM=PvModel.getInstance();
			 ex.setIdExaman(idExaman);
			 ex.setDateExaman(daat);
			 ex.setNomMatier(nomMatiere);
			 ex.setType(type);
			 boolean res=exaM.updateExam(ex);
		        if(res){
		        return SUCCESS;    
		        }else{
		            addActionError("echec de MAJ");
		        return ERROR;   
		        }
	}
	
}
