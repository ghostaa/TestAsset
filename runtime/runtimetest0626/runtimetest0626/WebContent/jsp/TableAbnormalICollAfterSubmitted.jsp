<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from TableAbnormalICollAfterSubmitted.xui by Administrator, on Tue Jan 29 10:56:37 CST 2013 -->
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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/TableAbnormalICollAfterSubmitted.js"> </script>
<bttdojo:form id="TableAbnormalICollAfterSubmitted_Form01" operationId="TableAbnormalIColl" errorPage="TableAbnormalICollAfterSubmitted.jsp">
  <table>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="TableAbnormalICollAfterSubmitted_Label03" text="Test when the real row size < icoll size" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:table id="TableAbnormalICollAfterSubmitted_Table01" dataName="tableRow" dataNameForList="tableData" selectionMode="single" textWrap="false" isPageable="false">
          <bttdojo:column widget="TextBox" align="left" dataName="tString" width="80" text="tString"/>
          <bttdojo:column widget="TextBox" align="left" dataName="tNumber" width="80" text="tNumber"/>
          <bttdojo:column widget="TextBox" align="left" dataName="tCurrency" width="80" text="tCurrency"/>
          <bttdojo:column widget="TextBox" align="left" dataName="dateField" width="80" text="tDate"/>
          <bttdojo:column widget="TextBox" align="left" dataName="tev" width="80" text="tField"/>
          <bttdojo:column dataNameForList="comboList" widget="ComboBox" align="left" dataName="comId" width="80" text="tCombo"/>
          <bttdojo:column dataNameForList="depList" widget="Select" align="left" dataName="depId" width="80" text="tSelect"/>
        </bttdojo:table>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:radio id="TableAbnormalICollAfterSubmitted_Radio01" dataName="rad" value="2" text="init 2 elements" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:radio id="TableAbnormalICollAfterSubmitted_Radio02" dataName="rad" value="2.5" text="init 2 elements but incomplete" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="TableAbnormalICollAfterSubmitted_Label01" text="onselected test" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="TableAbnormalICollAfterSubmitted_Label02" dataName="default" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:button id="TableAbnormalICollAfterSubmitted_Button01" type="submit" text="submit" textWrap="false"/>
      </td>
    </tr>
  </table>
</bttdojo:form>

</body>
</html>