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
<!-- Generated from G017_Combobox_PopUp.xui by mashuai, on  -->
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
<script type="text/javascript" data-btt-eca="true" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/G017/G017_Combobox_PopUp.js"> </script>
<%request.setAttribute("dse_sessionId", session.getId()); %>
  <div id="G017_Combobox_PopUp_panel" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="G017_Combobox_PopUp_label" text="typeAhead: false"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:combo id="G017_Combobox_PopUp_combo02" dataNameForList="AccountInfoList" labelField="AccountName" valueField="AccountNo" typeAhead="false"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="G017_Combobox_PopUp_label01" text="typeAhead: true"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:combo id="G017_Combobox_PopUp_combo01" dataNameForList="AccountInfoList" labelField="AccountName" valueField="AccountNo"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="G017_Combobox_PopUp_label02" text="action for the selectList"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="G017_Combobox_PopUp_label03" text="combobox, the property typeAhead is set false" width="168px" textWrap="true"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="G017_Combobox_PopUp_label14" text="typeAhead: false, combobox value" width="168px" textWrap="true"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="G017_Combobox_PopUp_label16" text="combobox, the property typeAhead is set true" width="168px" textWrap="true"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="G017_Combobox_PopUp_label17" text="typeAhead: true, combobox value" width="128px" textWrap="true"/>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="G017_Combobox_PopUp_label04" text="onClick"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:combo id="G017_Combobox_PopUp_combo03" dataNameForList="AccountInfoList" labelField="AccountName" valueField="AccountNo" typeAhead="false"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="G017_Combobox_PopUp_label_03" text="Label"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:combo id="G017_Combobox_PopUp_combo03_copy" dataNameForList="AccountInfoList" labelField="AccountName" valueField="AccountNo"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="G017_Combobox_PopUp_label_03_copy" text="Label"/>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="G017_Combobox_PopUp_label06" text="onMouseUp"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:combo id="G017_Combobox_PopUp_combo05" dataNameForList="AccountInfoList" labelField="AccountName" valueField="AccountNo" typeAhead="false"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="G017_Combobox_PopUp_label_05" text="Label"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:combo id="G017_Combobox_PopUp_combo05_copy" dataNameForList="AccountInfoList" labelField="AccountName" valueField="AccountNo"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="G017_Combobox_PopUp_label_05_copy" text="Label"/>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="G017_Combobox_PopUp_label07" text="onMouseEnter"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:combo id="G017_Combobox_PopUp_combo06" dataNameForList="AccountInfoList" labelField="AccountName" valueField="AccountNo" typeAhead="false"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="G017_Combobox_PopUp_label_06" text="Label"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:combo id="G017_Combobox_PopUp_combo06_copy" dataNameForList="AccountInfoList" labelField="AccountName" valueField="AccountNo"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="G017_Combobox_PopUp_label_06_copy" text="Label"/>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="G017_Combobox_PopUp_label08" text="onMouseLeave"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:combo id="G017_Combobox_PopUp_combo07" dataNameForList="AccountInfoList" labelField="AccountName" valueField="AccountNo" typeAhead="false"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="G017_Combobox_PopUp_label_07" text="Label"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:combo id="G017_Combobox_PopUp_combo07_copy" dataNameForList="AccountInfoList" labelField="AccountName" valueField="AccountNo"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="G017_Combobox_PopUp_label_07_copy" text="Label"/>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="G017_Combobox_PopUp_label09" text="onMouseMove"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:combo id="G017_Combobox_PopUp_combo08" dataNameForList="AccountInfoList" labelField="AccountName" valueField="AccountNo" typeAhead="false"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="G017_Combobox_PopUp_label_08" text="Label"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:combo id="G017_Combobox_PopUp_combo08_copy" dataNameForList="AccountInfoList" labelField="AccountName" valueField="AccountNo"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="G017_Combobox_PopUp_label_08_copy" text="Label"/>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="G017_Combobox_PopUp_label11" text="onFocus"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:combo id="G017_Combobox_PopUp_combo09" dataNameForList="AccountInfoList" labelField="AccountName" valueField="AccountNo" typeAhead="false"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="G017_Combobox_PopUp_label_09" text="Label"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:combo id="G017_Combobox_PopUp_combo09_copy" dataNameForList="AccountInfoList" labelField="AccountName" valueField="AccountNo"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="G017_Combobox_PopUp_label_09_copy" text="Label"/>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="G017_Combobox_PopUp_label10" text="onBlur"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:combo id="G017_Combobox_PopUp_combo10" dataNameForList="AccountInfoList" labelField="AccountName" valueField="AccountNo" typeAhead="false"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="G017_Combobox_PopUp_label_10" text="Label"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:combo id="G017_Combobox_PopUp_combo10_copy" dataNameForList="AccountInfoList" labelField="AccountName" valueField="AccountNo"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="G017_Combobox_PopUp_label_10_copy" text="Label"/>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="G017_Combobox_PopUp_label18" text="onKeyUp"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:combo id="G017_Combobox_PopUp_combo13" dataNameForList="AccountInfoList" labelField="AccountName" valueField="AccountNo" typeAhead="false"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="G017_Combobox_PopUp_label_13" text="Label"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:combo id="G017_Combobox_PopUp_combo13_copy" dataNameForList="AccountInfoList" labelField="AccountName" valueField="AccountNo"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="G017_Combobox_PopUp_label_13_copy" text="Label"/>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="G017_Combobox_PopUp_label19" text="onChange"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:combo id="G017_Combobox_PopUp_combo14" dataNameForList="AccountInfoList" labelField="AccountName" valueField="AccountNo" typeAhead="false"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="G017_Combobox_PopUp_label_14" text="Label"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:combo id="G017_Combobox_PopUp_combo14_copy" dataNameForList="AccountInfoList" labelField="AccountName" valueField="AccountNo"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="G017_Combobox_PopUp_label_14_copy" text="Label"/>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="G017_Combobox_PopUp_label15" text="click the following button to change the widget property"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:combo id="G017_Combobox_PopUp_combo15" dataNameForList="AccountInfoList" labelField="AccountName" valueField="AccountNo" required="false" typeAhead="false"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:button id="G017_Combobox_PopUp_button_0" type="button" text="get selected value"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="G017_Combobox_PopUp_label_15" text="selected value"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:button id="G017_Combobox_PopUp_button_1" type="button" text="get widget isMandatory's value"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="G017_Combobox_PopUp_label_16" text="property isMandatory's value"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
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
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:button id="G017_Combobox_PopUp_button_01" type="button" text="visibility hidden"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:button id="G017_Combobox_PopUp_button_02" type="button" text="visibility visible"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:button id="G017_Combobox_PopUp_button" type="button" text="visibility gone"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:button id="G017_Combobox_PopUp_button_03" type="button" text="disabled true"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:button id="G017_Combobox_PopUp_button_04" type="button" text="disabled false"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:button id="G017_Combobox_PopUp_button_05" type="button" text="readOnly true"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:button id="G017_Combobox_PopUp_button_06" type="button" text="readOnly false"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
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
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
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