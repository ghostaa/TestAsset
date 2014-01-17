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
<!-- Generated from TestMultiSelectECA.xui by mashuai, on Fri Jan 17 13:40:55 CST 2014 -->
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
<script type="text/javascript" data-btt-eca="true" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/WidgetTest/TestMultiSelectECA.js"> </script>
<%request.setAttribute("dse_sessionId", session.getId()); %>
  <div id="TestMultiSelectECA_panel" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="TestMultiSelectECA_label" text="Label"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="TestMultiSelectECA_label29" text="ECA Name : "/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="TestMultiSelectECA_label30" text="The results of triggering events : "/>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="TestMultiSelectECA_label01" text="onClick"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:multiSelect id="TestMultiSelectECA_multiSelect01" dataName="TestMultiSelectResultList" labelFieldForSubmit="ResultLabel" valueFieldForSubmit="ResultValue" dataNameForList="TestMultiSelectList" labelField="FieldForLabel" valueField="FieldForValue" selectedField="FieldForSelect" disabledField="FieldForDisable"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="TestMultiSelectECA_label02" text="Label"/>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="TestMultiSelectECA_label03" text="onFocus"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:multiSelect id="TestMultiSelectECA_multiSelect02" dataName="TestMultiSelectResultList" labelFieldForSubmit="ResultLabel" valueFieldForSubmit="ResultValue" dataNameForList="TestMultiSelectList" labelField="FieldForLabel" valueField="FieldForValue" selectedField="FieldForSelect" disabledField="FieldForDisable"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="TestMultiSelectECA_label04" text="Label"/>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="TestMultiSelectECA_label05" text="onBlur"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:multiSelect id="TestMultiSelectECA_multiSelect03" dataName="TestMultiSelectResultList" labelFieldForSubmit="ResultLabel" valueFieldForSubmit="ResultValue" dataNameForList="TestMultiSelectList" labelField="FieldForLabel" valueField="FieldForValue" selectedField="FieldForSelect" disabledField="FieldForDisable"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="TestMultiSelectECA_label11" text="Label"/>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="TestMultiSelectECA_label06" text="onkeyDown"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:multiSelect id="TestMultiSelectECA_multiSelect04" dataName="TestMultiSelectResultList" labelFieldForSubmit="ResultLabel" valueFieldForSubmit="ResultValue" dataNameForList="TestMultiSelectList" labelField="FieldForLabel" valueField="FieldForValue" selectedField="FieldForSelect" disabledField="FieldForDisable"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="TestMultiSelectECA_label12" text="Label"/>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="TestMultiSelectECA_label07" text="onKeyPress"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:multiSelect id="TestMultiSelectECA_multiSelect05" dataName="TestMultiSelectResultList" labelFieldForSubmit="ResultLabel" valueFieldForSubmit="ResultValue" dataNameForList="TestMultiSelectList" labelField="FieldForLabel" valueField="FieldForValue" selectedField="FieldForSelect" disabledField="FieldForDisable"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="TestMultiSelectECA_label13" text="Label"/>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="TestMultiSelectECA_label08" text="onKeyUp"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:multiSelect id="TestMultiSelectECA_multiSelect06" dataName="TestMultiSelectResultList" labelFieldForSubmit="ResultLabel" valueFieldForSubmit="ResultValue" dataNameForList="TestMultiSelectList" labelField="FieldForLabel" valueField="FieldForValue" selectedField="FieldForSelect" disabledField="FieldForDisable"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="TestMultiSelectECA_label14" text="Label"/>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="TestMultiSelectECA_label09" text="onMouseDown"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:multiSelect id="TestMultiSelectECA_multiSelect07" dataName="TestMultiSelectResultList" labelFieldForSubmit="ResultLabel" valueFieldForSubmit="ResultValue" dataNameForList="TestMultiSelectList" labelField="FieldForLabel" valueField="FieldForValue" selectedField="FieldForSelect" disabledField="FieldForDisable"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="TestMultiSelectECA_label15" text="Label"/>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="TestMultiSelectECA_label10" text="onMouseUp"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:multiSelect id="TestMultiSelectECA_multiSelect08" dataName="TestMultiSelectResultList" labelFieldForSubmit="ResultLabel" valueFieldForSubmit="ResultValue" dataNameForList="TestMultiSelectList" labelField="FieldForLabel" valueField="FieldForValue" selectedField="FieldForSelect" disabledField="FieldForDisable"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="TestMultiSelectECA_label16" text="Label"/>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="TestMultiSelectECA_label19" text="onMouseEnter"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:multiSelect id="TestMultiSelectECA_multiSelect09" dataName="TestMultiSelectResultList" labelFieldForSubmit="ResultLabel" valueFieldForSubmit="ResultValue" dataNameForList="TestMultiSelectList" labelField="FieldForLabel" valueField="FieldForValue" selectedField="FieldForSelect" disabledField="FieldForDisable"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="TestMultiSelectECA_label17" text="Label"/>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="TestMultiSelectECA_label24" text="onMouseLeave"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:multiSelect id="TestMultiSelectECA_multiSelect10" dataName="TestMultiSelectResultList" labelFieldForSubmit="ResultLabel" valueFieldForSubmit="ResultValue" dataNameForList="TestMultiSelectList" labelField="FieldForLabel" valueField="FieldForValue" selectedField="FieldForSelect" disabledField="FieldForDisable"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="TestMultiSelectECA_label18" text="Label"/>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="TestMultiSelectECA_label25" text="onMouseMove"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:multiSelect id="TestMultiSelectECA_multiSelect11" dataName="TestMultiSelectResultList" labelFieldForSubmit="ResultLabel" valueFieldForSubmit="ResultValue" dataNameForList="TestMultiSelectList" labelField="FieldForLabel" valueField="FieldForValue" selectedField="FieldForSelect" disabledField="FieldForDisable"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="TestMultiSelectECA_label20" text="Label"/>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="TestMultiSelectECA_label26" text="onChange"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:multiSelect id="TestMultiSelectECA_multiSelect12" dataName="TestMultiSelectResultList" labelFieldForSubmit="ResultLabel" valueFieldForSubmit="ResultValue" dataNameForList="TestMultiSelectList" labelField="FieldForLabel" valueField="FieldForValue" selectedField="FieldForSelect" disabledField="FieldForDisable"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="TestMultiSelectECA_label21" text="Label"/>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="TestMultiSelectECA_label27" text="onAsyncOK" visibility="gone"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:multiSelect id="TestMultiSelectECA_multiSelect13" dataName="TestMultiSelectResultList" labelFieldForSubmit="ResultLabel" valueFieldForSubmit="ResultValue" dataNameForList="TestMultiSelectList" labelField="FieldForLabel" valueField="FieldForValue" selectedField="FieldForSelect" disabledField="FieldForDisable" visibility="gone"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="TestMultiSelectECA_label22" text="Label" visibility="gone"/>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="TestMultiSelectECA_label28" text="onAsyncError" visibility="gone"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:multiSelect id="TestMultiSelectECA_multiSelect14" dataName="TestMultiSelectResultList" labelFieldForSubmit="ResultLabel" valueFieldForSubmit="ResultValue" dataNameForList="TestMultiSelectList" labelField="FieldForLabel" valueField="FieldForValue" selectedField="FieldForSelect" disabledField="FieldForDisable" visibility="gone"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="TestMultiSelectECA_label23" text="Label" visibility="gone"/>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:a id="TestMultiSelectECA_link" text="Back" flowEvent="viewEvt"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
    </div>
  </div>

<!-- applet id="printApplet" name="printApplet" code="com.ibm.btt.print.applets.PrintrApplet" codebase="applets" archive="bttprint.jar,JSON4J.jar" style="width:0px; height:0px;"></applet-->
</body>
</html>