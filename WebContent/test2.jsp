<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<s:form action=" st.html" method="post" enctype="multipart/form-data">
<s:textfield name="matricule" size="20" />
<s:submit value="search" />
</s:form>
<table  border="1"cellpadding="8px">
            <tr>
                <td>typePV</td>
                <td>matiere</td>
                <td>Matricule</td>
                
                <td colspan="2">Action</td>
                 
            </tr>
     <s:iterator value="listeDePv" var="qpf">
             <tr>
                 <td><s:property value="#qpf[1]"/></td>  
                  
                 <td><s:property value="#qpf[0]"/></td> 
                 <td><s:property value="#qpf[2]"/></td> 
                 
            </tr>   
            </s:iterator>
        
        </table>
   
</body>
</html>