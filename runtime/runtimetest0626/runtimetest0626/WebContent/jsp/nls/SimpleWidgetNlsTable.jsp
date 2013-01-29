<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from SimpleWidgetNlsTable.xui by Administrator, on Tue Jan 29 10:56:53 CST 2013 -->
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
<bttdojo:form id="SimpleWidgetNlsTable_Form01" operationId="simpleWidgetNlsTableOp" errorPage="nls/SimpleWidgetNlsTable.jsp">
  <table>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:table id="SimpleWidgetNlsTable_tableBindTypedDataNlsAll" dataName="TableKColl.TypedTable" dataNameForList="TableDataKColl.TypedTableDataList" readOnly="true" hint="%nls.NlsSupportTestResourse/_2Tip_Message2" width="667px" height="339px" textWrap="false" isPageable="false">
          <bttdojo:column align="center" dataName="index" width="30" text="Index"/>
          <bttdojo:column currency="USD" numberType="bigDecimal" widget="TextBox" align="left" dataName="currencyField" width="160" type="Currency" text="%nls.NlsSupportTestResourse/_Table_Column1"/>
          <bttdojo:column widget="TextBox" align="left" dataName="dateField" width="160" text="%nls.NlsSupportTestResourse/_Table_Column2"/>
          <bttdojo:column widget="TextBox" align="left" dataName="numberField" width="160" text="%nls.NlsSupportTestResourse/_Table_Column3"/>
          <bttdojo:column widget="TextBox" align="left" dataName="stringField" width="160" text="%nls.NlsSupportTestResourse/_Table_Column4"/>
        </bttdojo:table>
      </td>
      <td align="left" valign="middle">
        <bttdojo:button id="SimpleWidgetNlsTable_Button01" type="submit" text="%nls.htmlsample/submit" operationId="simpleWidgetNlsTableOp" hint="%nls.NlsSupportTestResourse/_0Button_Button" textWrap="false"/>
      </td>
    </tr>
  </table>
</bttdojo:form>

</body>
</html>