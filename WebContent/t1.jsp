<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language="javascript" src="js/jsappAjax.js"></script>
<link rel="stylesheet" href="css/styles.css" type="text/css" />
<script type="text/javascript">
function upDom(hlink, divId) {
    var xhr = getXhr();
    xhr.onreadystatechange = function() {
        if ((xhr.readyState == 4 && xhr.status == 200)) {
            var divObj = document.getElementById(divId);
            var strResVect = xhr.responseText.split(separator);
            divObj.innerHTML = strResVect[0];
            if (strResVect.length == 2) {
                eval(strResVect[1]);
            }
        }
        else if (xhr.readyState == 4 && xhr.status != 200) {
            alert('Fichier non trouvable ou erreur \r\n. Status :' + xhr.status);
        }
        else {
            document.getElementById(divId).innerHTML = '<div align=center id="wait">Loading<img src="images/loader.GIF" ></div>';
        }
    }//function
    xhr.open("GET", hlink, true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.send(null);
}//function
$(function(){
  $('#profiletabs ul li a').on('click', function(e){
    e.preventDefault();
    var newcontent = $(this).attr('href');
    
    $('#profiletabs ul li a').removeClass('sel');
    $(this).addClass('sel');
    
    $('#content section').each(function(){
      if(!$(this).hasClass('hidden')) { $(this).addClass('hidden'); }
    });
    
    $(newcontent).removeClass('hidden');
  });
});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

 <a href="#" onclick="upDom('stat.html','contenue')">LES PV DES FROLS</a>
        <div id="contenue">
            Bonjour
        </div>
</body>
</html>