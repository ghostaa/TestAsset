<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from paginationInitReqState.xui by Administrator, on Tue Jan 29 10:56:54 CST 2013 -->
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
<bttdojo:form id="paginationInitReqState_Form01" errorPage="pageSort/paginationInitReqState.jsp">
  <table>
    <tr>
      <td colspan="3" align="left" valign="middle">
        <bttdojo:label id="paginationInitReqState_Label02" text="Case ID: SP07NEGINITREQ" textWrap="false"/>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td colspan="3" align="left" valign="middle">
        <bttdojo:label id="paginationInitReqState_Label01" text="Table pagination & sorting test by disabling initial pagination request!" textWrap="false"/>
      </td>
      <td align="right" valign="middle">
        <bttdojo:button id="paginationInitReqState_Button02" type="submit" text="NextTest" flowEvent="next" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="paginationInitReqState_Label03" text="Sort Columns:" textWrap="false"/>
      </td>
      <td colspan="3" align="left" valign="middle">
        <bttdojo:label id="paginationInitReqState_Label04" dataName="sort" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td colspan="4" align="left" valign="middle">
        <bttdojo:table id="paginationInitReqState_Table01" dataName="item" dataNameForList="items" sortEnabled="true" columnReordering="true" textWrap="false" isPageable="false">
          <bttdojo:column align="center" dataName="index" width="60" text="Index"/>
          <bttdojo:column align="right" dataName="currencyField" width="122" text="%nls.NlsSupportTestResourse/_Table_Column1"/>
          <bttdojo:column align="left" dataName="dateField" width="122" text="%nls.NlsSupportTestResourse/_Table_Column2"/>
          <bttdojo:column align="right" dataName="numberField" width="122" text="%nls.NlsSupportTestResourse/_Table_Column3"/>
          <bttdojo:column align="left" dataName="stringField" width="122" text="%nls.NlsSupportTestResourse/_Table_Column4"/>
          <bttdojo:column align="left" dataName="plainField" width="122" text="%nls.NlsSupportTestResourse/_Table_Column5"/>
        </bttdojo:table>
      </td>
    </tr>
  </table>
</bttdojo:form>

</body>
</html>