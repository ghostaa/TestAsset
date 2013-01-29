<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from radioButtonByAjax.xui by Administrator, on Tue Jan 29 10:56:59 CST 2013 -->
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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/radioButtonByAjax.js"> </script>
  <table id="radioButtonByAjax_panel">
    <tr>
      <td>
        <bttdojo:form id="radioButtonByAjax_form2" operationId="radiobuttonOp" errorPage="radioButtonByAjax.jsp">
          <table>
            <tr>
              <td>
                <bttdojo:group id="radioButtonByAjax_Group01" text="Test set properties" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:radio id="radioButtonByAjax_animalRadio1" dataName="animal" value="animal001" text="pig" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:radio id="radioButtonByAjax_animalRadio2" dataName="animal" value="animal002" text="dog" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:radio id="radioButtonByAjax_animalRadio3" dataName="animal" value="animal003" text="duck" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:button id="radioButtonByAjax_toggleDisable" type="button" text="toggle all radionButton disable" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="radioButtonByAjax_toggleReadonly" type="button" text="toggle all radionButton readonly" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="radioButtonByAjax_toogleIsChecked" type="button" text="toggle the animalRadio1 isChecked" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="radioButtonByAjax_radioText" dataName="textFieldValue" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="radioButtonByAjax_setValueAt" type="button" text="set the text in animalRadio1:" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="radioButtonByAjax_btnSetFocus" type="button" text="set the animalRadio1 focusable" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:button id="radioButtonByAjax_btnVisible" type="button" text="visibility=visible" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="radioButtonByAjax_btnHidden" type="button" text="visibility=hidden" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="radioButtonByAjax_btnGone" type="button" text="visibility=gone" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="3" align="left" valign="middle">
                        <bttdojo:label id="radioButtonByAjax_Label02" text="(toggle disable or readonly and press submit)" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:button id="radioButtonByAjax_Button03" type="submit" text="submit" operationId="RadionButtonOp" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="radioButtonByAjax_Label08" text="Submit value:" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="radioButtonByAjax_Label09" dataName="submitAnimal" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:button id="radioButtonByAjax_btnIsFocusable" type="button" text="Can the Radio_animalRadio3 set focus? " textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="radioButtonByAjax_label" text="IsFocuable" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="3" align="left" valign="middle">
                        <bttdojo:label id="radioButtonByAjax_lblIsFocusable" text="display true if isFocusable, otherwise it will display false" textWrap="false"/>
                      </td>
                    </tr>
                  </table>
                </bttdojo:group>
              </td>
            </tr>
          </table>
        </bttdojo:form>
      </td>
    </tr>
    <tr>
      <td>
      </td>
    </tr>
  </table>

</body>
</html>