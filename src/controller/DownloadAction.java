package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class DownloadAction extends ActionSupport{

	private InputStream fileInputStream;
	String path;
	  
	public InputStream getFileInputStream() {
	 
		return fileInputStream;
	   
	}

	public String down() throws Exception {
		
		path= ServletActionContext.getRequest().getParameter("param");
		
		fileInputStream = new FileInputStream(new File(path));

	    return SUCCESS;
	  
	}

	
}