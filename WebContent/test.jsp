<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/styles.css" type="text/css" />
<title>Insert title here</title>
<script language="javascript" src="js/jsappAjax.js"></script>

</head>
<body>
<table>
            <tr>
            <th>idPv</th>
                <th>nomMatier</th>
                <th>DateExam</th>
                <th>typeSenction</th>
                 <th>Matricule</th>
                  <th>Filieur</th>
                   
                  <th>fond_dosseier</th>
                <th colspan="3">Action</th>
                 
            </tr>
     <s:iterator value="listeDePv" var="qpf">
             <tr>
              <td><s:property value="#qpf[0]"/></td> 
              <td><s:property value="#qpf[1]"/></td> 
               <td><s:property value="#qpf[2]"/></td>
             <td><s:property value="#qpf[3]"/></td> 
                  
                  <td><s:property value="#qpf[4]"/></td>
                   <td><s:property value="#qpf[5]"/></td>
                
                   
                    <td><s:form action="download.html" method="post" enctype="multipart/form-data">
                  <input name="param" type="hidden" value="<s:property value="#qpf[6]"/>" size="40">
	             <s:submit  value="view"></s:submit>
	             </s:form></td>
	             <td><a href="#" onclick="upDom('deletePv.html?param=<s:property  value="#qpf[0]"/>','contenu')"><img src="images/delete.png" style="cursor:pointer; "  title="Supprimer"   /></a></td>
                 <td><a href="updatePv.html?param=<s:property  value="#qpf[0]"/>"><img src="images/edit.png" style="cursor:pointer; "  title="Modifier le pv"   /></a></td>
             <td><a href="updateExaman.html?parame=<s:property  value="#qpf[7]"/>"><img src="images/update.jpeg" style="cursor:pointer; "  title="Modifier l'examan"   /></a></td>
            
                
            </tr>   
            </s:iterator>
        
        </table>
   
   
</body>
</html>