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
<!-- Generated from IBK_18_Test_Table_Scrollbar.xui by mashuai, on Fri Jan 17 13:40:17 CST 2014 -->
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

@import "css/dijit/tableScrollbar.css";

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
<%request.setAttribute("dse_sessionId", session.getId()); %>
  <div id="IBK_18_Test_Table_Scrollbar_panel" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="center" style="vertical-align:middle;">
        <bttdojo:label id="IBK_18_Test_Table_Scrollbar_label" text="Horizontal Scrollbar" width="65px" textWrap="true"/>
      </div>
      <div class="BTTCellStyle" align="center" style="vertical-align:middle;">
        <bttdojo:label id="IBK_18_Test_Table_Scrollbar_label02" text="Vertical Scrollbar" width="65px" textWrap="true"/>
      </div>
      <div class="BTTCellStyle" style="vertical-align:">
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="IBK_18_Test_Table_Scrollbar_label01" text="Scroll"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="IBK_18_Test_Table_Scrollbar_label03" text="Scroll"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="hScrollbarScroll vScrollbarScroll">        <bttdojo:table id="IBK_18_Test_Table_Scrollbar_table" dataNameForList="accounts" width="320px" height="105px" isPageable="false">
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Account ID" dataName="accountId" noresize="false" repeat="true" id="AccountId" headerVAlign="left"/>
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Type" dataName="type" noresize="false" repeat="true" id="Type" headerVAlign="left"/>
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Open Date" dataName="openDate" noresize="false" repeat="true" id="OpenDate" headerVAlign="left"/>
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Balance" dataName="balance" noresize="false" repeat="true" id="Balance" headerVAlign="left"/>
        </bttdojo:table>
</div>      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="IBK_18_Test_Table_Scrollbar_label04" text="Auto"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="IBK_18_Test_Table_Scrollbar_label05" text="Scroll"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="hScrollbarAuto vScrollbarScroll">        <bttdojo:table id="IBK_18_Test_Table_Scrollbar_table01" dataNameForList="accounts" width="320px" height="105px" isPageable="false">
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Account ID" dataName="accountId" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Type" dataName="type" noresize="false" repeat="true" id="columnId1" headerVAlign="left"/>
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Open Date" dataName="openDate" noresize="false" repeat="true" id="columnId2" headerVAlign="left"/>
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Balance" dataName="balance" noresize="false" repeat="true" id="columnId3" headerVAlign="left"/>
        </bttdojo:table>
</div>      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="IBK_18_Test_Table_Scrollbar_label06" text="Hidden"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="IBK_18_Test_Table_Scrollbar_label07" text="Scroll"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="hScrollbarHidden vScrollbarScroll">        <bttdojo:table id="IBK_18_Test_Table_Scrollbar_table02" dataNameForList="accounts" width="320px" height="80px" isPageable="false">
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Account ID" dataName="accountId" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Type" dataName="type" noresize="false" repeat="true" id="columnId1" headerVAlign="left"/>
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Open Date" dataName="openDate" noresize="false" repeat="true" id="columnId2" headerVAlign="left"/>
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Balance" dataName="balance" noresize="false" repeat="true" id="columnId3" headerVAlign="left"/>
        </bttdojo:table>
</div>      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="IBK_18_Test_Table_Scrollbar_label08" text="Scroll"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="IBK_18_Test_Table_Scrollbar_label09" text="Auto"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="hScrollbarScroll vScrollbarAuto">        <bttdojo:table id="IBK_18_Test_Table_Scrollbar_table03" dataNameForList="accounts" width="320px" height="105px" isPageable="false">
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Account ID" dataName="accountId" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Type" dataName="type" noresize="false" repeat="true" id="columnId1" headerVAlign="left"/>
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Open Date" dataName="openDate" noresize="false" repeat="true" id="columnId2" headerVAlign="left"/>
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Balance" dataName="balance" noresize="false" repeat="true" id="columnId3" headerVAlign="left"/>
        </bttdojo:table>
</div>      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="IBK_18_Test_Table_Scrollbar_label10" text="Auto"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="IBK_18_Test_Table_Scrollbar_label11" text="Auto"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="hScrollbarAuto vScrollbarAuto">        <bttdojo:table id="IBK_18_Test_Table_Scrollbar_table04" dataNameForList="accounts" width="320px" height="105px" isPageable="false">
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Account ID" dataName="accountId" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Type" dataName="type" noresize="false" repeat="true" id="columnId1" headerVAlign="left"/>
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Open Date" dataName="openDate" noresize="false" repeat="true" id="columnId2" headerVAlign="left"/>
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Balance" dataName="balance" noresize="false" repeat="true" id="columnId3" headerVAlign="left"/>
        </bttdojo:table>
</div>      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="IBK_18_Test_Table_Scrollbar_label12" text="Hidden"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="IBK_18_Test_Table_Scrollbar_label13" text="Auto"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="hScrollbarHidden vScrollbarAuto">        <bttdojo:table id="IBK_18_Test_Table_Scrollbar_table07" dataNameForList="accounts" width="320px" height="80px" isPageable="false">
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Account ID" dataName="accountId" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Type" dataName="type" noresize="false" repeat="true" id="columnId1" headerVAlign="left"/>
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Open Date" dataName="openDate" noresize="false" repeat="true" id="columnId2" headerVAlign="left"/>
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Balance" dataName="balance" noresize="false" repeat="true" id="columnId3" headerVAlign="left"/>
        </bttdojo:table>
</div>      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="IBK_18_Test_Table_Scrollbar_label14" text="Scroll"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="IBK_18_Test_Table_Scrollbar_label15" text="Hidden"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="hScrollbarScroll vScrollbarHidden">        <bttdojo:table id="IBK_18_Test_Table_Scrollbar_table06" dataNameForList="accounts" width="320px" height="105px" isPageable="false">
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Account ID" dataName="accountId" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Type" dataName="type" noresize="false" repeat="true" id="columnId1" headerVAlign="left"/>
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Open Date" dataName="openDate" noresize="false" repeat="true" id="columnId2" headerVAlign="left"/>
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Balance" dataName="balance" noresize="false" repeat="true" id="columnId3" headerVAlign="left"/>
        </bttdojo:table>
</div>      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="IBK_18_Test_Table_Scrollbar_label17" text="Auto"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="IBK_18_Test_Table_Scrollbar_label16" text="Hidden"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="hScrollbarAuto vScrollbarHidden">        <bttdojo:table id="IBK_18_Test_Table_Scrollbar_table05" dataNameForList="accounts" width="320px" height="105px" isPageable="false">
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Account ID" dataName="accountId" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Type" dataName="type" noresize="false" repeat="true" id="columnId1" headerVAlign="left"/>
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Open Date" dataName="openDate" noresize="false" repeat="true" id="columnId2" headerVAlign="left"/>
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Balance" dataName="balance" noresize="false" repeat="true" id="columnId3" headerVAlign="left"/>
        </bttdojo:table>
</div>      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="IBK_18_Test_Table_Scrollbar_label18" text="Hidden"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="IBK_18_Test_Table_Scrollbar_label19" text="Hidden"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="hScrollbarHidden vScrollbarHidden">        <bttdojo:table id="IBK_18_Test_Table_Scrollbar_table08" dataNameForList="accounts" width="320px" height="105px" isPageable="false">
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Account ID" dataName="accountId" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Type" dataName="type" noresize="false" repeat="true" id="columnId1" headerVAlign="left"/>
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Open Date" dataName="openDate" noresize="false" repeat="true" id="columnId2" headerVAlign="left"/>
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Balance" dataName="balance" noresize="false" repeat="true" id="columnId3" headerVAlign="left"/>
        </bttdojo:table>
</div>      </div>
    </div>
  </div>

<!-- applet id="printApplet" name="printApplet" code="com.ibm.btt.print.applets.PrintrApplet" codebase="applets" archive="bttprint.jar,JSON4J.jar" style="width:0px; height:0px;"></applet-->
</body>
</html>