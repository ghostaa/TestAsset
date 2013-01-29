<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from ECA20.xui by Administrator, on Tue Jan 29 10:56:47 CST 2013 -->
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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/eca/ECA20.js"> </script>
<bttdojo:form id="ECA20_form" errorPage="eca/ECA20.jsp">
  <table>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="ECA20_label" text="disabled" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="ECA20_text" dataName="Disabled" type="String" disabled="true" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:button id="ECA20_button" type="submit" text="submit" operationId="SubmitOp" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="ECA20_text04" dataName="Disabled" type="String" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="ECA20_label01" text="readOnly" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="ECA20_text01" dataName="ReadOnly" type="String" readOnly="true" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:button id="ECA20_button01" type="cancel" text="submit with no data" flowId="TextBoxECAFlow" flowEvent="start" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="ECA20_text05" dataName="ReadOnly" type="String" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="ECA20_label02" text="normal" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="ECA20_text02" dataName="Normal" type="String" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:button id="ECA20_button02" type="save" text="submit without validation" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="ECA20_text06" dataName="Normal" type="String" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="ECA20_label03" text="password" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="ECA20_text03" dataName="Password" type="String" minimumLength="3" maximumLength="6" password="true" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:button id="ECA20_button03" type="button" text="Input" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="ECA20_text07" dataName="Password" type="String" minimumLength="3" maximumLength="6" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="ECA20_label04" text="Mapping" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="ECA20_text08" dataName="MappingDisabled" type="String" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="ECA20_text09" dataName="MappingReadOnly" type="String" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="ECA20_text10" dataName="MappingNormal" type="String" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="ECA20_text11" dataName="MappingPassword" type="String" minimumLength="3" maximumLength="6" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
  </table>
</bttdojo:form>

</body>
</html>