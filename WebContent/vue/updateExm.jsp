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
        <s:form action="saveUpdateExam" method="POST">
            <input type="text"  value="<c:out value="${sessionScope.idExaman}"/>" name="idExaman"/><br/>
            <input type="text" name="type"  value="<c:out value="${sessionScope.type}"/>" /><br/>
            <input type="text" name="date"  value="<c:out value="${sessionScope.date}"/>" /><br/>
            <input type="text" name="nomMatiere"  value="<c:out value="${sessionScope.nomMatier}"/>" />
            <s:submit value="save" />
        </s:form>
        <s:actionerror />
</body>
</html>