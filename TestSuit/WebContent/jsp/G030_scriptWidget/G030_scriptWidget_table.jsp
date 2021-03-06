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
<!-- Generated from G030_scriptWidget_table.xui by mashuai, on  -->
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
<script type="text/javascript" data-btt-eca="true" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/G030_scriptWidget/G030_scriptWidget_table.js"> </script>
<%request.setAttribute("dse_sessionId", session.getId()); %>
  <div id="G030_scriptWidget_table_cpnl" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;" class="tableStyle tableStyle1">        <bttdojo:table id="G030_scriptWidget_table_wtbl" dataNameForList="tableList" isPageable="false">
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="A" dataName="A" noresize="false" repeat="true" id="A" headerVAlign="left"/>
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="B" dataName="B" noresize="false" repeat="true" id="B" headerVAlign="left"/>
          <bttdojo:column level="1" rowSpan="1" align="left" width="200" colSpan="1" hidden="false" headerHAlign="left" text="C" dataName="C" noresize="false" repeat="true" id="C" headerVAlign="left"/>
        </bttdojo:table>
</div>      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:button id="G030_scriptWidget_table_button" type="button" text="Button"/>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:a id="G030_scriptWidget_table_link" text="back" flowEvent="back"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
    </div>
  </div>
  <bttdojo:script id="G030_scriptWidget_table_Script01" content="var num0=dijit.byId(\"G030_scriptWidget_table_wtbl\").getCellValueByIndex(\"0\",\"0\");
var num1=dijit.byId(\"G030_scriptWidget_table_wtbl\").getCellValueByIndex(\"0\",\"1\");
var num2=dijit.byId(\"G030_scriptWidget_table_wtbl\").getCellValueByIndex(\"0\",\"2\");
var num3=dijit.byId(\"G030_scriptWidget_table_wtbl\").getCellValueByIndex(\"0\",\"3\");

var num5=dijit.byId(\"G030_scriptWidget_table_wtbl\").getCellValueByIndex(\"0\",\"5\");
var num6=dijit.byId(\"G030_scriptWidget_table_wtbl\").getCellValueByIndex(\"0\",\"6\");
var num7=dijit.byId(\"G030_scriptWidget_table_wtbl\").getCellValueByIndex(\"0\",\"7\");
var num8=dijit.byId(\"G030_scriptWidget_table_wtbl\").getCellValueByIndex(\"0\",\"8\");

var num4=num0+num1+num2+num3;
var num9=num5+num6+num7+num8;

dijit.byId(\"G030_scriptWidget_table_wtbl\").setCellValueByIndex(\"0\",\"4\",num4);

dijit.byId(\"G030_scriptWidget_table_wtbl\").setCellValueByIndex(\"0\",\"9\",num9);

"/>

<!-- applet id="printApplet" name="printApplet" code="com.ibm.btt.print.applets.PrintrApplet" codebase="applets" archive="bttprint.jar,JSON4J.jar" style="width:0px; height:0px;"></applet-->
</body>
</html>