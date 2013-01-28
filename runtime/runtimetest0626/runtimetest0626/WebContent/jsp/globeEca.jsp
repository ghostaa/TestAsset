<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from globeEca.xui by Administrator, on Mon Jan 28 14:33:46 CST 2013 -->
<head>
<%@ taglib uri="/WEB-INF/bttdojo.tld" prefix="bttdojo"%>
<%@ page import="com.ibm.btt.cs.html.JSPUtil" %> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style type="text/css">
@import "js/dojo/resources/dojo.css";
@import "js/dijit/themes/claro/claro.css";	
@import "js/dojox/grid/enhanced/resources/claro/EnhancedGrid.css";
@import "css/dijit/message.css";
@import "js/com/ibm/btt/dijit/templates/FileUpload.css";
@import "js/dijit/themes/claro/document.css";
@import "js/com/ibm/btt/dijit/templates/Grid.css";
@import "js/com/ibm/btt/dijit/templates/ScreenCover.css";
@import "js/com/ibm/btt/dijit/templates/Group.css";
@import "js/com/ibm/btt/dijit/templates/Label.css";
@import "js/com/ibm/btt/dijit/templates/message.css";
@import "css/dijit/main.css";
@import "css/dijit/dijit.css";
@import "css/dijit/FileUpload.css";
@import "css/dijit/Grid.css";
@import "css/dijit/Group.css";
@import "css/dijit/Label.css";
@import "css/dijit/ScreenCover.css";
@import "css/dijit/show.css";




.dojoxGrid table { margin: 0; }
.dj_gecko .dijitTextBoxReadOnly INPUT.dijitInputInner {
    -moz-user-input: auto;
}
.dj_gecko .dijitTextBoxReadOnlyFocused INPUT.dijitInputInner {
	-moz-user-input: none;
}
</style>
<script>
	var djConfig =  {
		baseUrl:"js/dojo/",
		<bttdojo:locale/>,
		isDebug: false, 
		parseOnLoad: true
	};
</script>

<script type="text/javascript" src="js/dojo/dojo_BTT.js" ></script>
<script type="text/javascript" src="js/com/ibm/btt/btt.js"></script>

<script type="text/javascript" >
dojo.addOnLoad(function(){
	dojo.style(document.body, "visibility", "");
});
</script>

<script type="text/javascript">
	
	if(!window.engine){
		<%if(utb.ajaxNavigationEnabled()){%>
			window.engine = new com.ibm.btt.event.NavigationEngine();
		<%}else{%>
			window.engine = new com.ibm.btt.event.Engine();
		<%}%>
		engine.setMonitor(new com.ibm.btt.event.BaseMonitor());
		engine.registerCond("js/condition/condition.js");
		engine.registerKeys("http://9.181.87.190:9082/runtimetest0626/js/attendGlobalKey.js");
		
		
	}
	<%if(utb.ajaxNavigationEnabled()){%>
		dojo.require("dojo.back");
		var state = {
		    back: function() { /* window.engine.onBack(); */},
		    forward: function() { /* window.engine.onForward(); */ }
		};
		dojo.back.setInitialState(state);
	<%}%>

</script>
</head>
<body class="claro" style="visibility:hidden">
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/globeEca.js"> </script>
<bttdojo:form id="globeEca_Form01" operationId="globeEcaOp" errorPage="globeEca.jsp">
  <table>
    <tr>
      <td>
        <bttdojo:group id="globeEca_Group01" text="Eca Single" textWrap="false">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="globeEca_Label01" text="Amount" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:textbox id="globeEca_Text01" dataName="text1" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="globeEca_Label02" text="Language" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:combo id="globeEca_Combo01" dataName="combo1" storeURL="listFiles/select/language.js" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="globeEca_Label03" text="Money" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:select id="globeEca_SelectList01" dataName="select1" storeURL="listFiles/select/money.js" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="globeEca_Button01" type="button" text="Page Validate" textWrap="false"/>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="globeEca_Group04" text="Server Validate" textWrap="false">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="globeEca_Label10" text="Amount" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:textbox id="globeEca_Text04" dataName="text2" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="globeEca_Label11" text="Language" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:combo id="globeEca_Combo04" dataName="combo2" storeURL="listFiles/select/language.js" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="globeEca_Label12" text="Money" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:select id="globeEca_SelectList04" dataName="select2" storeURL="listFiles/select/money.js" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="globeEca_Button03" type="button" text="Submit" textWrap="false"/>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="globeEca_Group02" text="Form Load" textWrap="false">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="globeEca_Label04" text="Amount" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:textbox id="globeEca_Text02" dataName="text3" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="globeEca_Label05" text="Language" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:combo id="globeEca_Combo02" dataName="combo3" storeURL="listFiles/select/language.js" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="globeEca_Label06" text="Money" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:select id="globeEca_SelectList02" dataName="select3" storeURL="listFiles/select/money.js" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td>
              </td>
              <td>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="globeEca_Group03" text="Combine" textWrap="false">
          <table>
            <tr>
              <td>
              </td>
              <td align="left" valign="middle">
                <bttdojo:radio id="globeEca_Radio01" dataName="business" value="China" text="China" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:radio id="globeEca_Radio02" dataName="business" value="Spain" text="Spain" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="globeEca_Label07" text="Language" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:combo id="globeEca_Combo03" dataName="combo4" storeURL="listFiles/select/language.js" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="globeEca_Label08" text="Money" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:select id="globeEca_SelectList03" dataName="select4" storeURL="listFiles/select/money.js" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="globeEca_Label09" text="Amount" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:textbox id="globeEca_Text03" dataName="text4" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td>
              </td>
              <td>
              </td>
              <td>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="globeEca_Group05" text="NLS Support(wenti)" textWrap="false">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="globeEca_Label13" text="1 paramText" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:textbox id="globeEca_Text05" dataName="nlsText" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="globeEca_Label14" text="1 paramCombo" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:combo id="globeEca_Combo05" dataName="nlsCombo" storeURL="listFiles/select/language.js" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="globeEca_Label15" text="1 paramSelect" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:select id="globeEca_SelectList05" dataName="nlsSelect" storeURL="listFiles/select/language.js" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="globeEca_Label16" text="2 paramText" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:textbox id="globeEca_Text06" dataName="nls2Text" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="globeEca_Label17" text="2 paramCombo" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:combo id="globeEca_Combo06" dataName="nls2Combo" storeURL="listFiles/select/language.js" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="globeEca_Label18" text="2 paramSelect" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:select id="globeEca_SelectList06" dataName="nls2Select" storeURL="listFiles/select/language.js" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="globeEca_Label19" text="0 paramText" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:textbox id="globeEca_Text07" dataName="nls0Text" hint="%nls.NLSErrorMessage/NONE" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="globeEca_Label20" text="0 paramCombo" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:combo id="globeEca_Combo07" dataName="nls0Combo" storeURL="listFiles/select/language.js" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="globeEca_Label21" text="0 paramSelect" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:select id="globeEca_SelectList07" dataName="nls0Select" storeURL="listFiles/select/language.js" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="globeEca_Button02" type="button" text="validate" textWrap="false"/>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
  </table>
</bttdojo:form>

</body>
</html>