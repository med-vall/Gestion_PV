<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ taglib prefix="s" uri="/struts-tags"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Datepicker - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <style type="text/css">
   #username{
        margin-top: 2px;
        height: 28px;
        border: 1px solid #5E6E66;
        font-size: 16px;
        padding: 1px;
        width: 90%;
    }
     #password{
        margin-top: 2px;
        height: 28px;
        border: 1px solid #5E6E66;
        font-size: 16px;
        padding: 1px;
        width: 90%;
    }
  #b1{
        padding: 7px;
        width: 80%;
        
    }    
        #d2{
    width: 300px;
    height: 220px;
    background-color:#F0FFF0;
    margin: 5px auto;
    margin-top: 40px;
    color: #fff;
    margin-left:  155px;
    padding-top: 20px;
    padding-left: 50px;
    border-radius: 15px;
    color: white;
    font-weight: bolder;
   
    
   }
  </style>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  </script>


<link rel="stylesheet" href="css/styles.css" type="text/css" />

</head>
<body>
<div id="wrapper">
		<div id="sitename">
			<h1><a href="#">IUP-PV</a></h1>
		</div>
		<div id="header">
			<h2>Bienvenue a la Gestion de Procés-Verbeaux de l'IUP!</h2>
			<div class="tagline"><p>L'application moderne qui facilite la gestion de PV de frole dans notre institut IUP</p></div>
			</div>
		<div id="body" class="clear">
			<div id="sidebar" class="column-left">
				<ul>
                	<li>
						<h4>Navigate</h4>
                        <ul class="blocklist">
                            <li><a href="index.jsp">Acceuil</a></li>
                            <li><a href="consulter.jsp">Consulter</a></li>
                            <li ><a href="gerer.jsp">Gerer</a></li>
                            <li class="selected-item"><a href="#">Administrer</a></li>
                            <li><a href="#">Contact</a></li>
                        </ul>

					</li>	
					
					
				</ul>
			</div>
			<div id="content" class="column-right">
				
					
				

				<blockquote><p>C 'est les chefs scolaires qui peuvent accéder a la page de l'administration,eet pour accéder a celle eux doivent s'authentifier dabord</p></blockquote>
				<p>&nbsp;</p>
				<center>
				 
				<div id="d2"> 
				<h3>Login</h3>
				<s:form action="login.html" method="post">
	   
	             <s:textfield name="username" placeholder="username...."  id="password" />
	              <s:password name="password" placeholder="password...." id="password" />
	               <s:submit id="b1" value="Login" method="execute" key="label.login" align="center" />
                     </s:form>
      </div>
				 </center>
               
				<p>&nbsp;</p>
				
				
				
							
			</div>
		</div>
		
	</div>
</body>
</html>