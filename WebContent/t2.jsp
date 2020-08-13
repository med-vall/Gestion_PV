<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script language="javascript" src="js/jsappAjax.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/styles.css" type="text/css" />
<style type="text/css">
table {
	width:100%;
	font-family:Arial, Helvetica, sans-serif;
	text-align:left;
}
th, td {
	padding:5px 10px;
}
th {
	color:#fff;
	border-top:3px solid #082659;
	background-color:#0C3A87;
}
td {
	border-bottom:1px solid #f4f4f4;
}
</style>
</head>
<body>
<s:form action=" st.html" method="post" enctype="multipart/form-data">
<s:textfield name="matricule" size="20" />
<s:submit  value="search" />
</s:form>
<table  border="1"cellpadding="8px">
            <tr>
            <td>idPv</td>
                <td>nomMatier</td>
                <td>DateExam</td>
                <td>typeSenction</td>
                 <td>Matricule</td>
                  <td>Filieur</td>
                <td colspan="2">Action</td>
                 
            </tr>
     <s:iterator value="listeDePv" var="qpf">
             <tr>
              <td><s:property value="#qpf[0]"/></td> 
              <td><s:property value="#qpf[1]"/></td> 
               <td><s:property value="#qpf[2]"/></td>
             <td><s:property value="#qpf[3]"/></td> 
                  
                  <td><s:property value="#qpf[4]"/></td>
                   <td><s:property value="#qpf[5]"/></td>
                
            </tr>   
            </s:iterator>
        
        </table>
   
</body>
</html>