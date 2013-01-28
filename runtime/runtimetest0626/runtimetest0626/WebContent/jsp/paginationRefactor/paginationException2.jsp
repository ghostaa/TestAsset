<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from paginationException2.xui by Administrator, on Mon Jan 28 14:33:53 CST 2013 -->
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
<div style="display:inline-block;" class="info"><bttdojo:form id="paginationException2_form" errorPage="paginationRefactor/paginationException2.jsp">
  <table>
    <tr>
      <td align="left" valign="middle">
<div style="display:inline-block;width:auto;height:auto;" class="warnMessage">        <bttdojo:label id="paginationException2_label" text="2: Exception occurs while mapping data element from processor to biz operation" textWrap="false"/>
</div>      </td>
      <td align="left" valign="middle">
        <bttdojo:button id="paginationException2_button" type="submit" text="next" flowEvent="NEXT" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td colspan="2" align="left" valign="middle">
        <bttdojo:table id="paginationException2_FTInfo" dataNameForList="FTInfoTableIColl" isPageable="true" textWrap="false" operationName="PAG_paginationRefactor$paginationException2_FTInfo" directPagination="false" paginationWhenLoading="true" rowsPerPage="15" timeout="6000">
          <bttdojo:column align="center" dataName="cid" width="80" text="ID"/>
          <bttdojo:column align="center" dataName="cgender" width="80" text="GENDER"/>
          <bttdojo:column align="right" dataName="cfloatField" width="80" text="CFF"/>
          <bttdojo:column align="right" dataName="ctotalStayTime" width="80" text="CTSTF"/>
          <bttdojo:column align="right" dataName="cbigIntegerField" width="80" text="CBIF"/>
        </bttdojo:table>
      </td>
    </tr>
  </table>
</bttdojo:form>
</div>
</body>
</html>