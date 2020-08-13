<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <h2>La modification d'un fournisseur</h2>
      <s:form id="contact" action="saveUpdate" method="post" enctype="multipart/form-data">
            <input type="text" name="idPv" value="<c:out value="${sessionScope.idPv}"/>"/><br/>
             <input type="text" name="matricule" value="<c:out value="${sessionScope.etd}"/>"/><br/>
            <input type="text" name="description" value="<c:out value="${sessionScope.description}"/>"/><br/>
            <input type="text" name="type" value="<c:out value="${sessionScope.type}"/>" /><br/>
            <input type="text" name="date" value="<c:out value="${sessionScope.date}"/>" /><br/>
            <s:file name="userImage" />
            <s:submit value="save" />
        </s:form>
        <s:actionerror />
</body>
</html>