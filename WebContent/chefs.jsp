<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
 a.butto{
	background:url(images/button.gif);
	display:block;
	color:#555555;
	font-weight:bold;
	height:30px;
	line-height:29px;
	margin-bottom:14px;
	text-decoration:none;
	width:191px;
}
a:hover.button{
	color:#0066CC;
}
.download{
	background:url(img/button.gif);
	display:block;
	color:#555555;
	font-weight:bold;
	height:30px;
	line-height:29px;
	margin-bottom:14px;
	text-decoration:none;
	width:191px;
}
input:hover.download{
	color:#0066CC;
}

/* -------------------- */
/* CLASSES				*/
/* -------------------- */
	.add{
		background:url(img/add.gif) no-repeat 10px 8px;
		text-indent:30px;
		display:block;
	}
	.delete{
		background:url(img/delete.gif) no-repeat 10px 8px;
		text-indent:30px;
		display:block;
	}
	.user{
		background:url(images/user.gif) no-repeat 10px 8px;
		text-indent:30px;
		display:block;
	}
	.alert{
		background:url(images/alert.png) no-repeat 10px 8px;
		text-indent:30px;
		display:block;
	}
	.msg{
		background:url(img/msg.gif) no-repeat 10px 8px;
		text-indent:30px;
		display:block;
	}
	.download{
		background:url(img/download.gif) no-repeat 10px 8px;
		text-indent:30px;
		display:block;
	}

	.lens{
		background:url(img/lens.gif) no-repeat 10px 8px;
		text-indent:30px;
		display:block;
	}
	.info{
		background:url(images/info.png) no-repeat 10px 8px;
		text-indent:30px;
		display:block;
	}
 </style>
<link rel="stylesheet" href="css/styles.css" type="text/css" />
</head>
<body>
<h3>La liste de chefs scolaire</h3>
 <table  border="1">
            <tr>
                <th>id</th>
                <th>Nom</th>
                <th>Login</th>
                <th>Telephone</th>
                <th>Travaille</th>
                <th colspan="2">Action</th>
            </tr>

 <s:iterator value="users" var="f">
             <tr>
                 <td><s:property value="#f.idUser"/></td>  
                 <td><s:property value="#f.nom"/></td>  
                 <td><s:property value="#f.login"/></td>  
                 <td><s:property value="#f.telephone"/></td> 
                 <td><s:property value="#f.travaille"/></td> 
                 <td><a href="#" onclick="upDom('deleteUser.html?param=<s:property  value="#f.idUser"/>','contenu')"><img src="images/delete.png" style="cursor:pointer; "  title="Supprimer"   /></a></td>
                 <td><a href="updatefournisseur?param=<s:property  value="#f.fno"/>"><img src="images/edit.png" style="cursor:pointer; "  title="Modifier"   /></a></td>
            </tr>   </s:iterator>
            </table>
            <p>&nbsp;</p>
           <table>
				<tr>
				<td></td>
				<td><a href="AjoutChef.jsp" class="butto"><span class="user">Ajouter un chef</span></a></td>
				</tr>
            </table>
            
</body>
</html>