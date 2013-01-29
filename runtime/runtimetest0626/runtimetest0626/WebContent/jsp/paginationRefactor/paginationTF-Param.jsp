<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from paginationTF-Param.xui by Administrator, on Tue Jan 29 10:56:58 CST 2013 -->
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



@import "css/dijit/main.css";

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
<bttdojo:form id="paginationTF-Param_form" errorPage="paginationRefactor/paginationTF-Param.jsp">
  <table>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="paginationTF-Param_label" text="directPagination=" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
<div style="display:inline-block;width:auto;height:auto;" class="sessionInfo2">        <bttdojo:label id="paginationTF-Param_label02" text="TRUE" textWrap="false"/>
</div>      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="paginationTF-Param_label01" text="paginationWhenLoading=" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
<div style="display:inline-block;width:auto;height:auto;" class="sessionInfo2">        <bttdojo:label id="paginationTF-Param_label02_copy" text="FALSE" textWrap="false"/>
</div>      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="paginationTF-Param_label03" text="NAME(start with)" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="paginationTF-Param_text" dataName="params.cname" type="String" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="paginationTF-Param_label04" text="Label" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:button id="paginationTF-Param_button" type="submit" text="filter" flowEvent="init" textWrap="false"/>
      </td>
    </tr>
  </table>
</bttdojo:form>

</body>
</html>