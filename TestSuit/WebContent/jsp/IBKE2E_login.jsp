<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<%
	java.util.Locale locale = (java.util.Locale)utb.getValue("dse_locale");
	if(locale == null) {
		locale = request.getLocale();
	} 

	String language = locale.getLanguage();
%>

<html lang="<%=language %>">
<!-- Generated from IBKE2E_login.xui by mashuai, on Fri Jan 17 13:40:17 CST 2014 -->
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
@import "js/com/ibm/btt/dijit/templates/Ems.css";
@import "js/dojox/form/resources/CheckedMultiSelect.css";
@import "js/com/ibm/btt/dijit/templates/tableScrollbar.css";
@import "js/com/ibm/btt/dijit/templates/Keyboard.css";
@import "js/com/ibm/btt/dijit/templates/RepetitivePanel.css";

@import "css/dijit/buttonTextVerticalAlign.css";
@import "css/master.css";

.dojoxGrid table { margin: 0; }
.dj_gecko .dijitTextBoxReadOnly INPUT.dijitInputInner {
    -moz-user-input: auto;
}
.dj_gecko .dijitTextBoxReadOnlyFocused INPUT.dijitInputInner {
	-moz-user-input: none;
}
/** override the default CSS(claro) of dojo, otherwise, 
	on Chrome, the value of disabled text box can't be told from its background
**/
.dj_webkit .dijitTextBoxDisabled INPUT {
	color: #777777;
}
html, body {
	height:100%;
}
.BTTTableStyle{
	display:table;
}
.BTTRowStyle{
	display:table-row;
}
.BTTCellStyle{
	display:table-cell;
	padding:1px;
}
.dojoxGridInvisible td{
	height:0px;
	padding-top:0px;
	padding-bottom:0px;
}
.dojoxGridInvisible th{
	height:0px;
	border:0px solid black;
	padding-top:0px;
	padding-bottom:0px;
}
.claro .dojoxGridInvisible .dojoxGridCell{
	padding-top:0px;
	padding-bottom:0px;
	border:0px;
}
</style>

<!--[if lt IE 9]>
<style type="text/css">
.bttMultiSelectReadOnly > option[selected=selected]{
	color: white;
	background-color: #3399FF;
}

.bttMultiSelectDisabled > option[selected=selected]{
	color: white;
	background-color: #3399FF;
}
</style>
<![endif]-->

<script>
	var djConfig =  {
		baseUrl:"js/dojo/",
		<bttdojo:locale/>,
		isDebug: true, 
		parseOnLoad: true
	};
</script>
<script type="text/javascript" src="js/dojo/dojo_BTT.js"></script>
<script type="text/javascript" src="js/com/ibm/btt/btt.js"></script>
<script type="text/javascript" src="js/config/globalConfiguration.js"></script>
<script type="text/javascript" >
dojo.addOnLoad(function(){
	dojo.style(document.body, "visibility", "");
	var head = document.getElementsByTagName('head')[0].innerHTML;
	var titles = head.match(/<title>(.*)<\/title>/i);
	if(titles){
		var newtitle = StringUtil.escapeEnterWrap(I18nUtil.getI18nString(titles[1]));
		document.title = newtitle;
	}	
});
</script>

<script type="text/javascript">
	if(!window.engine){
		<%if(utb.ajaxNavigationEnabled()){%>
			window.engine = Engine.getInstance();
			Engine.getInstance()._sessionId = "<%=request.getSession().getId()%>";
		<%}else{%>
			window.engine = new com.ibm.btt.event.Engine();
		<%}%>
		engine.setMonitor(new com.ibm.btt.event.BaseMonitor());
		engine.registerCond("js/condition/condition.js");
		/** Uncomment this to use Global Function Key **/
		/** load definition in global project if necessary **/
		// engine.registerKeys("<url to global project>js/keymap/globalKeyMap.js");
		/** load definition in this(local) project **/
		// engine.registerKeys("js/keymap/globalKeyMap.js");
		/** please note that the local definition will override the global definition with the same name **/
		//  register back/forward/refresh/leave event handler
		//	engine.registerHandler("js/config/navigationHandler.js");
		
	}
</script>
</head>
<body class="claro" style="visibility:hidden">
<script type="text/javascript" data-btt-eca="true" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/IBKE2E_login.js"> </script>
<%request.setAttribute("dse_sessionId", session.getId()); %>
<bttdojo:form id="IBKE2E_login_form" errorPage="IBKE2E_login.jsp">
  <table>
    <tr>
      <td colspan="2" align="center" valign="middle" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="boldFont">        <bttdojo:label id="IBKE2E_login_label03" text="%nls.bttsample/IBKE2E_login"/>
</div>      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="IBKE2E_login_label" text="User Name"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:textbox id="IBKE2E_login_text" dataName="Login.UserName" type="String" required="true"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="IBKE2E_login_label01" text="Password"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:textbox id="IBKE2E_login_text01" dataName="Login.Password" type="String" required="true" password="true"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="buttonTextVerticalAlignTop roundedCornersTwo">        <bttdojo:button id="IBKE2E_login_button" type="reset" text="Reset" hint="Demo req25:  Text allignment buttom on button" width="100px" height="40px" textWrap="false"/>
</div>      </td>
      <td align="right" valign="middle" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="buttonTextVerticalAlignBottom roundedCornersTwo">        <bttdojo:button id="IBKE2E_login_button01" type="submit" text="Login" flowEvent="login" hint="Demo req25:  Text allignment top on button" width="100px" height="40px" textWrap="false"/>
</div>      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:image id="IBKE2E_login_image" location="img/Arrow.jpg" hint="click to get help, demo Image onclick function" tabIndex="-1"/>
      </td>
    </tr>
    <tr>
      <td colspan="2" align="left" valign="middle" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="dojoxGridErroressages">        <bttdojo:label id="IBKE2E_login_ErrorMsg" dataName="Login.VerifyResult"/>
</div>      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
  </table>
</bttdojo:form>

<!-- applet id="printApplet" name="printApplet" code="com.ibm.btt.print.applets.PrintrApplet" codebase="applets" archive="bttprint.jar,JSON4J.jar" style="width:0px; height:0px;"></applet-->
</body>
</html>