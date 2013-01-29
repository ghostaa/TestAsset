<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from abnormalKcollSubmit.xui by Administrator, on Tue Jan 29 10:56:42 CST 2013 -->
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



@import "css/dijit/message.css";

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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/abnormalKcollSubmit.js"> </script>
<bttdojo:form id="abnormalKcollSubmit_Form01" validateOnSubmit="false" errorPage="abnormalKcollSubmit.jsp">
  <table>
    <tr>
      <td colspan="2" align="left" valign="middle">
        <bttdojo:label id="abnormalKcollSubmit_Label01" text="Abnormal KeyedCollection submit" textWrap="false"/>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="abnormalKcollSubmit_Label02" text="KeyedCollection\'s Field:" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="right" valign="middle">
        <bttdojo:label id="abnormalKcollSubmit_Label03" text="Currency:" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="abnormalKcollSubmit_dftCurrency" dataName="abnormalKColl.dftCurrencyField" type="Currency" currency="EUR" numberType="bigDecimal" readOnly="true" textWrap="false"/>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="right" valign="middle">
        <bttdojo:label id="abnormalKcollSubmit_Label04" text="Date:" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="abnormalKcollSubmit_dftDate" dataName="abnormalKColl.dftDateField" type="Date" pattern="yyyy-MM-dd" readOnly="true" textWrap="false"/>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="right" valign="middle">
        <bttdojo:label id="abnormalKcollSubmit_Label05" text="Number:" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="abnormalKcollSubmit_dftNumber" dataName="abnormalKColl.dftNumberField" type="Number" readOnly="true" textWrap="false"/>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="right" valign="middle">
        <bttdojo:label id="abnormalKcollSubmit_Label06" text="String:" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="abnormalKcollSubmit_dftString" dataName="abnormalKColl.dftStringField" type="String" readOnly="true" textWrap="false"/>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="right" valign="middle">
        <bttdojo:label id="abnormalKcollSubmit_Label07" text="Plain:" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="abnormalKcollSubmit_dftPlain" dataName="abnormalKColl.userComments" readOnly="true" textWrap="false"/>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="right" valign="middle">
<div style="display:inline-block;width:auto;height:auto;" class="warnMessage">        <bttdojo:label id="abnormalKcollSubmit_Label08" text="The KColl itself:" textWrap="false"/>
</div>      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="abnormalKcollSubmit_Text01" dataName="abnormalKCollCp" readOnly="true" textWrap="false"/>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td colspan="3" align="center" valign="middle">
<div style="display:inline-block;width:auto;height:auto;" class="warnMessage">        <bttdojo:label id="abnormalKcollSubmit_Label09" text="** Page will be forward to an error page!" textWrap="false"/>
</div>      </td>
    </tr>
    <tr>
      <td align="right" valign="middle">
        <bttdojo:button id="abnormalKcollSubmit_btnSubmit" type="submit" text="1: Submit" operationId="abnormalKcollSubmitOp" textWrap="false"/>
      </td>
      <td>
      </td>
      <td align="left" valign="middle">
        <bttdojo:button id="abnormalKcollSubmit_btnAjax" type="button" text="2: Ajax2" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="abnormalKcollSubmit_label" text="Keyboard support & ECA Enhancement" textWrap="false"/>
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