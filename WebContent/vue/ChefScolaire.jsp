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
  <script language="javascript" src="js/jsappAjax.js"></script>
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
		background:url(img/user.gif) no-repeat 10px 8px;
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
                            <li><a href="gerer.jsp">Gerer</a></li>
                            <li  class="selected-item"><a href="#">Administrer</a></li>
                            <li><a href="#">Contact</a></li>
                        </ul>

					</li>	
					
				</ul>
			</div>
			<div id="content" class="column-right">
				
					
				

				<blockquote><p>Vous pouvez consulter les listes des chefs en cliquant sur le lien de chefs scolairescomme vous pouvez consulter la liste des membres en cliquant sur le lien de liste de membres</p></blockquote><br/><br/>
				
				<table>
				<tr>
				<td><a href="#" onclick="upDom('getMembres.html','contenue')" class="butto"><span class="alert">gerer les membres</span></a></td>
				<td><a href="#" onclick="upDom('getChef.html','contenue')" class="butto"><span class="info">Gerer les chefs</span></a></td>
				</tr>
				
				</table>
				<p>&nbsp;</p>
						
						<div id="contenue">
						
						
						</div>
						
						<div id="contenue1">
						
						
						</div>	
			</div>
		</div>
		
	</div>
</body>
</html>