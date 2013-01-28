<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from SelectListExistBlack.xui by Administrator, on Mon Jan 28 14:33:34 CST 2013 -->
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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/SelectListExistBlack.js"> </script>
<bttdojo:form id="SelectListExistBlack_form" errorPage="SelectListExistBlack.jsp">
  <table>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="SelectListExistBlack_label" text="Select" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="SelectListExistBlack_label01" text="Reveal" textWrap="false"/>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:select id="SelectListExistBlack_selectList" dataName="SelectListRecord.SelectOne" dataNameForList="SelectListExistBlackList" labelField="LableForList" valueField="ValueForList" disabled="true" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="SelectListExistBlack_text" dataName="Reveal" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:button id="SelectListExistBlack_button01" type="button" text="Reveal" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:select id="SelectListExistBlack_selectList02" dataName="SelectListRecord.SelectOne" dataNameForList="SelectListExistBlackList" labelField="LableForList" valueField="ValueForList" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="SelectListExistBlack_text02" dataName="SelectListRecord.SelectTwo" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:button id="SelectListExistBlack_button05" type="button" text="Reveal Again" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:a id="SelectListExistBlack_link" text="Return the Index page" operationId="DisplayPageOp" extraParams="pageName=index.jsp" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="SelectListExistBlack_label02" text="reveal select value is :" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="SelectListExistBlack_label03" dataName="SelectListRecord.SelectOne" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="SelectListExistBlack_label04" text="..." textWrap="false"/>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:button id="SelectListExistBlack_button" type="submit" text="Normal change flow event By button" flowEvent="DisplayPageOp" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:button id="SelectListExistBlack_button04" type="button" text="Use callAsyncOperation" textWrap="false"/>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:select id="SelectListExistBlack_selectList01" dataName="SelectListExistBlackList.0.LableForList" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:button id="SelectListExistBlack_button02" type="button" text="First" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="SelectListExistBlack_text01" dataName="SelectListRecord.SelectTwo" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="SelectListExistBlack_label05" text="loadStoreFromURL---->" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:button id="SelectListExistBlack_button03" type="button" text="Second" textWrap="false"/>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:a id="SelectListExistBlack_link01" text="Normal change flow event By link" flowEvent="DisplayPageOp" textWrap="false"/>
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