<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from sub2FlowPage2.xui by Administrator, on Tue Jan 29 10:56:44 CST 2013 -->
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



@import "css/main.css";

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
<bttdojo:form id="sub2FlowPage2_form" flowEvent="next" errorPage="ajaxChnlEnhance/sub2FlowPage2.jsp">
  <table>
    <tr>
      <td colspan="3" align="left" valign="middle">
        <bttdojo:label id="sub2FlowPage2_label" text="Current Processor Information" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="right" valign="middle">
        <bttdojo:label id="sub2FlowPage2_label01" text="Session Id:" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="sub2FlowPage2_dse_sessionId" dataName="dse_sessionId" text="dse_sessionId" textWrap="false"/>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="right" valign="middle">
        <bttdojo:label id="sub2FlowPage2_label02" text="Processor Id:" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="sub2FlowPage2_dse_processorId" dataName="dse_processorId" text="dse_processorId" textWrap="false"/>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
<div style="display:inline-block;width:auto;height:auto;" class="sessionInfo2">        <bttdojo:label id="sub2FlowPage2_label03" text="Sub2" textWrap="false"/>
</div>      </td>
      <td align="left" valign="middle">
<div style="display:inline-block;width:auto;height:auto;" class="sessionInfo2">        <bttdojo:label id="sub2FlowPage2_label04" text="Page2" textWrap="false"/>
</div>      </td>
      <td align="left" valign="middle">
        <bttdojo:button id="sub2FlowPage2_button" type="submit" text="final" flowEvent="next" textWrap="false"/>
      </td>
    </tr>
  </table>
</bttdojo:form>

</body>
</html>