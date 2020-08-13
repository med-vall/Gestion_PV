<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>Success: Upload User Image</title>
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
 <script language="javascript" src="js/jsappAjax.js"></script>
</head>
<body>
	<h2>Struts2 File Upload Example</h2>
	User Image: <s:property value="userImage"/>
	<br/>
	Content Type: <s:property value="userImageContentType"/>
	<br/>
	<img alt="" src="<s:property value="path"/>">
	File Name: <s:property value="path"/>
	<s:form action="download.html" method="post" enctype="multipart/form-data">
<h4>Download file - </h4>	<input name="param" type="text" value="<s:property value="path"/>" size="40">
	<s:submit  value="telecharger"></s:submit>
	</s:form>

	<div id="contenue"></div>
	<br/>
	Uploaded Image:
	<br/>
	<img src="<s:property value="userImageFileName"/>"/>
	<s:url id="fileDownload" namespace="/" action="download" ></s:url>
<s:a href="%{fileDownload}">fileABC.txt</s:a>


</body>
</html>
