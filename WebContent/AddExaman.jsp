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

</head>
<body>
<p>Ajouter un Examan a l etudiant precedant:</p>
       <s:form action="savEx.html" method="post" enctype="multipart/form-data">
       <input type="hidden" name="idPv" value="<c:out value="${sessionScope.pv}"/>" size="20" maxlength="60" />
             <s:textfield name="nomMatiere" placeholder="le quartier du logement...." size="40" />
      <s:textfield name="type" placeholder="le quartier du logement...." size="40" />
     
     <s:textfield id="datepicker" name="date" format="dd/MM/yyyy" />
      <s:submit value="suivant"></s:submit>
      </s:form>
</body>
</html>