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
  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  </script>


<link rel="stylesheet" href="css/styles.css" type="text/css" />
<style type="text/css">

.container {
  max-width: 400px;
  width: 100%;
  margin: 0 auto;
  position: relative;
}

#contact input[type="text"],
#contact input[type="email"],
#contact input[type="tel"],
#contact input[type="url"],
#contact textarea,
#contact button[type="submit"] {
  font: 400 12px/16px "Roboto", Helvetica, Arial, sans-serif;
}

#contact {
  background: #F9F9F9;
  padding: 25px;
  margin: 150px 0;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}

#contact h3 {
  display: block;
  font-size: 30px;
  font-weight: 300;
  margin-bottom: 10px;
}

#contact h4 {
  margin: 5px 0 15px;
  display: block;
  font-size: 13px;
  font-weight: 400;
}

fieldset {
  border: medium none !important;
  margin: 0 0 10px;
  min-width: 100%;
  padding: 0;
  width: 100%;
}

#contact input[type="text"],
#contact input[type="email"],
#contact input[type="tel"],
#contact input[type="url"],
#contact textarea {
  width: 100%;
  border: 1px solid #ccc;
  background: #FFF;
  margin: 0 0 5px;
  padding: 10px;
}
#inpu{
  width: 100%;
  border: 1px solid #ccc;
  background: #FFF;
  margin: 0 0 5px;
  padding: 10px;
  -webkit-transition: border-color 0.3s ease-in-out;
  -moz-transition: border-color 0.3s ease-in-out;
  transition: border-color 0.3s ease-in-out;
  border: 1px solid #aaa;
}

#contact input[type="text"]:hover,
#contact input[type="email"]:hover,
#contact input[type="tel"]:hover,
#contact input[type="url"]:hover,
#contact textarea:hover {
  -webkit-transition: border-color 0.3s ease-in-out;
  -moz-transition: border-color 0.3s ease-in-out;
  transition: border-color 0.3s ease-in-out;
  border: 1px solid #aaa;
}

#contact textarea {
  height: 100px;
  max-width: 100%;
  resize: none;
}

#sub {
  cursor: pointer;
  width: 90%;
  border: none;
  background: #4CAF50;
  color: #FFF;
  margin: 0 0 5px;
  padding: 10px;
  font-size: 15px;
}

#sub:hover {
  background: #43A047;
  -webkit-transition: background 0.3s ease-in-out;
  -moz-transition: background 0.3s ease-in-out;
  transition: background-color 0.3s ease-in-out;
}

#sub:active {
  box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.5);
}

.copyright {
  text-align: center;
}

#contact input:focus,
#contact textarea:focus {
  outline: 0;
  border: 1px solid #aaa;
}

::-webkit-input-placeholder {
  color: #888;
}

:-moz-placeholder {
  color: #888;
}

::-moz-placeholder {
  color: #888;
}

:-ms-input-placeholder {
  color: #888;
}</style>
 <script language="javascript" src="js/jsappAjax.js"></script>

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
                            <li class="selected-item"><a href="#">Gerer</a></li>
                            <li><a href="Administrer.jsp">Administrer</a></li>
                            <li><a href="#">Contact</a></li>
                        </ul>

					</li>	
					
				</ul>
			</div>
			<div id="content" class="column-right">
				
					
				

				<blockquote><p>Pour Ajouter les PVs vous avez des formulaires,pour letudiant,le PV et l examan.l'operation de l ajout contituer de 3 etapes a chaque fois vous remplie le formulaire aores vous cliquer sur suivant jusqu au la dernier etape vous cliquez sur terminer pour enregistre le PV sur l etudiant tu devra les terminers si non l 'operation vas s echouer</p></blockquote>
				
				<center>
				 <sup>&darr;</sup>
				
				 <div id="container">
				   <s:form id="contact" name="xy" method="post" enctype="multipart/form-data">
     <h3> Ajouter un etudiant </h3>
       <s:textfield id="inpu" placeholder="le matrucule de l etudiant..." name="matricule"  size="40" />  
            <div id="e1" style="color: red;"></div>
             <s:textfield id="inpu"  placeholder="le nom de l'etudiant...." name="nom"  size="40" />
                <div id="e2" style="color: red;"></div>
                 <s:textfield id="inpu" placeholder="le prenom de l'etudiant...." name="prenom"  size="40" />
     <div id="e3" style="color: red;"></div>
          <s:textfield id="inpu"  placeholder="le filieur de l'etudiant..." name="filiere"  size="40" />
        <div id="e4" style="color: red;"></div>
        <s:textfield  placeholder="le d'ate d'annaissance" id="datepicker" name="date" format="dd/MM/yyyy" size="40" />
    <div id="e5" style="color: red;"></div>
     &nbsp;&nbsp;&nbsp;&nbsp; <s:submit id="sub"  onclick="upDomFrmValidate('saveEtd.html','container','xy','matricule;;1;;^[0-9]+$::nom;;1;;.*::prenom;;1;;.*::filiere;;1;;.*');return false;"  value="suivant"></s:submit>
      </s:form>
				</div> 
				 </center>
               
				<p>&nbsp;</p>
				
				
				
							
			</div>
		</div>
		
	</div>
</body>
</html>