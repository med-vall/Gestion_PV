<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
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


</head>
<body>
  <p>Ajouter un logement:</p>
       <s:form action="save.html" method="post" enctype="multipart/form-data">
        <s:textfield name="matricule" placeholder="saisissez votre numero de l abonner qui est en haut de la page." size="40" />  
             <s:textfield name="nom" placeholder="le quartier du logement...." size="40" />
      <s:textfield name="prenom" placeholder="le quartier du logement...." size="40" />
     
      <s:textfield name="filiere" placeholder="le quartier du logement...." size="40" />
     <s:textfield id="datepicker" name="date" format="dd/MM/yyyy" />
      <s:textfield name="nomMatiere" placeholder="le quartier du logement...." size="40" />
     <s:textfield name="type" placeholder="le quartier du logement...." size="40" />
    
      <s:textfield name="description" placeholder="le quartier du logement...." size="40" />
       <s:textfield name="typePv" placeholder="le prix du logement...." size="40" />
        <s:textfield id="datepicker" name="date" format="dd/MM/yyyy" /> 
      
        <s:submit value="insert"></s:submit>
         </s:form>
</body>
</html>