<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from paginationTimeOutFT-Table.xui by Administrator, on Mon Jan 28 14:33:56 CST 2013 -->
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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/paginationRefactor/paginationTimeOutFT-Table.js"> </script>
<bttdojo:form id="paginationTimeOutFT-Table_form" errorPage="paginationRefactor/paginationTimeOutFT-Table.jsp">
  <table>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="paginationTimeOutFT-Table_label" text="Pagination table timeout value:" textWrap="false"/>
      </td>
      <td align="right" valign="middle">
        <bttdojo:label id="paginationTimeOutFT-Table_label02" text="3000" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="paginationTimeOutFT-Table_label01" text="Bisiness operation sleep time:" textWrap="false"/>
      </td>
      <td align="right" valign="middle">
        <bttdojo:label id="paginationTimeOutFT-Table_label03" dataName="bizOpSleepTime" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td colspan="2" align="left" valign="middle">
        <bttdojo:message id="paginationTimeOutFT-Table_message" dataName="dse_errorMessages" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td colspan="2" align="left" valign="middle">
        <bttdojo:table id="paginationTimeOutFT-Table_FTInfo" dataNameForList="FTInfoTableIColl" isPageable="true" textWrap="false" operationName="PAG_paginationRefactor$paginationTimeOutFT-Table_FTInfo" directPagination="false" paginationWhenLoading="true" rowsPerPage="10" timeout="3000">
          <bttdojo:column align="left" dataName="cid" width="80" text="ID"/>
          <bttdojo:column align="left" dataName="cname" width="80" text="NAME"/>
          <bttdojo:column align="right" dataName="csalary" width="80" text="SALARY"/>
          <bttdojo:column align="right" dataName="cbirthDay" width="80" text="BIRTHDAY"/>
        </bttdojo:table>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:button id="paginationTimeOutFT-Table_button" type="submit" text="back" flowEvent="BACK" textWrap="false"/>
      </td>
      <td align="right" valign="middle">
        <bttdojo:button id="paginationTimeOutFT-Table_button01" type="submit" text="next" flowEvent="NEXT" textWrap="false"/>
      </td>
    </tr>
  </table>
</bttdojo:form>

</body>
</html>