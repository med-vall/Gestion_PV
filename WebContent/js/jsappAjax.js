/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
separator = '*_*_*';
function getXhr() {
    var xhr = null;
    if (window.XMLHttpRequest) // Firefox et autres
        xhr = new XMLHttpRequest();
    else if (window.ActiveXObject) { // Internet Explorer
        try {
            xhr = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (e) {
            xhr = new ActiveXObject("Microsoft.XMLHTTP");
        }
    }
    else { // XMLHttpRequest non support par le navigateur
        alert("Votre navigateur ne supporte pas les objets XMLHTTPRequest...");
        xhr = false;
    }
    return xhr;
}//function
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
function getFormElemsAsString(nomFormulaire) {
    resultat = "";
    formElements = document.forms[nomFormulaire].elements;
    for (var i = 0; i < formElements.length; i++) {
        if (formElements[i].name == '')
            continue;
        resultat += "&";
        val = encodeURIComponent(formElements[i].value);
        resultat += escape(formElements[i].name) + "=" + val;
    }
    return resultat;
}

function upDomFrm(hlink, divId, nomFrm) {
    sendVal = getFormElemsAsString(nomFrm);
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
            document.getElementById(divId).innerHTML = '<div align=center id="wait">Loading<img src="images/loader.GIF"></div>';
        }
    }//function
    xhr.open("POST", hlink, true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
    xhr.send(sendVal);
}//function
function validateFrm(strIds) {
    if (strIds !== "") {
        var j = 0;
        var frmOk = true;
        //-------------------------------------------
        //Form validation
        //alert(strIds);
        var bgOblColor = 'pink';
        var bgInvalidColor = 'orange';
        var bgInvalidDate = 'yellow';
        var bgDefaultColor = '';
        var errMsgFldOblig = "Les champs mis en rose sont obligatoirs\n\r";
        var errMsgFldNonValide = "Les champs mis en orange ont un contenu non valide";
        var errMsgDateNonValide = "Les dates mises en jaunes ne peuvent PAS dépasser la date système\n\r";
        var strVect = strIds.split('::');
        var errMsgDate = "";
        var errMsgOblig = "";
        var errMsgNonValide = "";
        for (j = 0; j < strVect.length; j++) {
            subVect = strVect[j].split(';;');
            inputId = subVect[0];
            isOblig = subVect[1];
            regExp = subVect[2];
            if (document.getElementsByName(inputId)[0].style.display == "") {
                if (document.getElementsByName(inputId)[0]) {
                    curFldValue = document.getElementsByName(inputId)[0].value;
                    curFldValue = curFldValue.replace(/^\s+/g, '').replace(/\s+$/g, '');
                    if (isOblig == 1) {
                        if (curFldValue == "") {
                            errMsgOblig = errMsgFldOblig;
                            document.getElementsByName(inputId)[0].style.backgroundColor = bgOblColor;
                            frmOk = false;
                        }
                        else if (regExp == "dateF") {	//dtaeF=les dates qui ne peuvenet pas etre des dates futurs
                            if (checkDateNonFutur(curFldValue) == true)
                                document.getElementsByName(inputId)[0].style.backgroundColor = bgDefaultColor;
                            else {
                                errMsgDate = errMsgDateNonValide;
                                document.getElementsByName(inputId)[0].style.backgroundColor = bgInvalidDate;
                                frmOk = false;
                            }
                        }
                        else if (!curFldValue.match(regExp)) {
                            errMsgNonValide = errMsgFldNonValide;
                            document.getElementsByName(inputId)[0].style.backgroundColor = bgInvalidColor;
                            frmOk = false;
                        }
                        else {
                            document.getElementsByName(inputId)[0].style.backgroundColor = bgDefaultColor;
                        }
                    }//--if
                    else if (curFldValue != "") {
                        if (regExp == "dateF") {	//dtaeF=les dates qui ne peuvenet pas etre des dates futurs
                            if (checkDateNonFutur(curFldValue) == true)
                                document.getElementsByName(inputId)[0].style.backgroundColor = bgDefaultColor;
                            else {
                                errMsgDate = errMsgDateNonValide;
                                document.getElementsByName(inputId)[0].style.backgroundColor = bgInvalidDate;
                                frmOk = false;
                            }
                        }
                        else if (!curFldValue.match(regExp)) {
                            errMsgNonValide = errMsgFldNonValide;
                            document.getElementsByName(inputId)[0].style.backgroundColor = bgInvalidColor;
                            frmOk = false;
                        }
                        else {
                            document.getElementsByName(inputId)[0].style.backgroundColor = bgDefaultColor;
                        }
                    }
                    else {
                        document.getElementsByName(inputId)[0].style.backgroundColor = bgDefaultColor;
                    }
                }//if
            }//if
            else
                document.getElementsByName(inputId)[0].style.backgroundColor = bgDefaultColor;
        }//for				
        // END of Form validation
        //--------------------------------------------
        if (frmOk == false) {
            alert(errMsgDate + errMsgOblig + errMsgNonValide);
            return false;
        }
        return true;
    }//if strIds!=""
    else
        return true;
}//function
function upDomFrmValidate(hlink, divId, nomFrm, strIds) {
    if (validateFrm(strIds) == false)
        return false;
    upDomFrm(hlink, divId, nomFrm);

}//function
function upDomCnf(hlink, divId, cnf) {
    if (!confirm(cnf))
        return;
    upDom(hlink, divId);
}//function
function upDomfrmCnf(hlink, divId,nomFrm,cnf) {
    if (!confirm(cnf))
        return;
    upDomFrm(hlink, divId, nomFrm);
}//function
