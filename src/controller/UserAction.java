package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import model.PvModel;
import model.UserModel;
import beans.Pv;
import beans.User;







import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport implements ServletRequestAware {
	private String username;
	private String password;
	User u=new User();
	private HttpServletRequest request;
    UserModel usm=new UserModel();
    List<User> users;
	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
	}
	
	public String auth(){
		this.users=usm.getUsers();
		int i=0;
		while(i<users.size()){
			User usr=users.get(i);HttpSession session = request.getSession();
			session.setAttribute("user", usr.getIdUser());
			session.setAttribute("mdp", usr.getLogin());
			if(usr.getLogin().equals(username) && usr.getMdp().equals(password) && usr.getType().equals("chef")){
				return SUCCESS;
				
			}
				else i++;
		}
		return ERROR;
		
	}

	public String addUs() {
		
		 String nom= ServletActionContext.getRequest().getParameter("nom");
		 String login= ServletActionContext.getRequest().getParameter("login");
		 String mdp= ServletActionContext.getRequest().getParameter("mdp");
		 int telephone=Integer.parseInt(ServletActionContext.getRequest().getParameter("telephone")) ;
	UserModel usm=UserModel.getInstance();
		 
	u.setNom(nom);u.setLogin(login);u.setMdp(mdp);u.setTelephone(telephone);
	u.setTravaille("Administrateur");u.setType("chef");
	
		 boolean res=usm.saveUser(u);
	 if(res){
	        return SUCCESS;    
	        }else{
	           
	        return ERROR;   
	        }
	}
	public String addMembr() {
		String travaille= ServletActionContext.getRequest().getParameter("travaille");
		 String nom= ServletActionContext.getRequest().getParameter("nom");
		 String login= ServletActionContext.getRequest().getParameter("login");
		 String mdp= ServletActionContext.getRequest().getParameter("mdp");
		 int telephone=Integer.parseInt(ServletActionContext.getRequest().getParameter("telephone")) ;
	UserModel usm=UserModel.getInstance();
		 
	u.setNom(nom);u.setLogin(login);u.setMdp(mdp);u.setTelephone(telephone);
	u.setTravaille(travaille);u.setType("membre");
	
		 boolean res=usm.saveUser(u);
	 if(res){
	        return SUCCESS;    
	        }else{
	           
	        return ERROR;   
	        }
	}
	
	public String getChef(){
		 UserModel usrm=UserModel.getInstance();
	        
		 users=usrm.getChefs();
	        
		 return SUCCESS;
	}
	public String getMembres(){
		 UserModel usrm=UserModel.getInstance();
	        
		 users=usrm.getMembres();
	        
		 return SUCCESS;
	}
	 public String deleteUser(){
	        UserModel usrm=UserModel.getInstance();
	        Integer idUser = Integer.parseInt(ServletActionContext.getRequest().getParameter("param"));
	        User usr=usrm.getUser(idUser);
	      boolean res=  usrm.deleteUser(usr);
	      if(res){
	        return SUCCESS;
	      }else
	      {
	    	  return ERROR;
	      }
	    }
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
