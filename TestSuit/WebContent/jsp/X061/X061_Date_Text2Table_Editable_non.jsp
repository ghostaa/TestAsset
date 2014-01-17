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
<!-- Generated from X061_Date_Text2Table_Editable_non.xui by mashuai, on  -->
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
<script type="text/javascript" data-btt-eca="true" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/X061/X061_Date_Text2Table_Editable_non.js"> </script>
<%request.setAttribute("dse_sessionId", session.getId()); %>
  <table id="X061_Date_Text2Table_Editable_non_panel">
    <tr>
      <td align="left" valign="middle" style="width:268px;vertical-align:middle;">
        <bttdojo:label id="X061_Date_Text2Table_Editable_non_label04" text="date_slash"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:textbox id="X061_Date_Text2Table_Editable_non_text_date_slash" dataName="X061_DateCalendarRecord.date_slash" type="Date" pattern="dd/MM/yyyy"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="X061_Date_Text2Table_Editable_non_label_date_slash" text="Label"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="width:268px;vertical-align:middle;">
        <bttdojo:label id="X061_Date_Text2Table_Editable_non_label05" text="date_bar"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:textbox id="X061_Date_Text2Table_Editable_non_text_date_bar" dataName="X061_DateCalendarRecord.date_bar" type="Date" pattern="dd-MM-yyyy"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="X061_Date_Text2Table_Editable_non_label_date_bar" text="Label"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="width:268px;vertical-align:middle;">
        <bttdojo:label id="X061_Date_Text2Table_Editable_non_label07" text="calendar_slash"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:textbox id="X061_Date_Text2Table_Editable_non_text_calendar_slash" dataName="X061_DateCalendarRecord.calendar_slash" type="Date" pattern="dd/MM/yyyy"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="X061_Date_Text2Table_Editable_non_label_calendar_slash" text="Label"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="width:268px;vertical-align:middle;">
        <bttdojo:label id="X061_Date_Text2Table_Editable_non_label08" text="calendar_bar"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:textbox id="X061_Date_Text2Table_Editable_non_text_calendar_bar" dataName="X061_DateCalendarRecord.calendar_bar" type="Date" pattern="dd-MM-yyyy"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="X061_Date_Text2Table_Editable_non_label_calendar_bar" text="Label"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="width:268px;vertical-align:middle;">
        <bttdojo:label id="X061_Date_Text2Table_Editable_non_label12" text="Copy to table"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="X061_Date_Text2Table_Editable_non_label09" text="table.setCellValueByIndex(inColumnIndex, inRowIndex,inValue )"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="X061_Date_Text2Table_Editable_non_label10" text="table.setValueByName(inName, inRowIndex,inValue)"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="width:268px;vertical-align:middle;">
        <bttdojo:label id="X061_Date_Text2Table_Editable_non_label" text="same data type, same pattern copy"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:button id="X061_Date_Text2Table_Editable_non_button_01" type="button" text="Button"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:button id="X061_Date_Text2Table_Editable_non_button_02" type="button" text="Button"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="width:268px;vertical-align:middle;">
        <bttdojo:label id="X061_Date_Text2Table_Editable_non_label01" text="same data type, different pattern copy"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:button id="X061_Date_Text2Table_Editable_non_button_04" type="button" text="Button"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:button id="X061_Date_Text2Table_Editable_non_button_05" type="button" text="Button"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="width:268px;vertical-align:middle;">
        <bttdojo:label id="X061_Date_Text2Table_Editable_non_label02" text="different data type, same pattern copy"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:button id="X061_Date_Text2Table_Editable_non_button_07" type="button" text="Button"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:button id="X061_Date_Text2Table_Editable_non_button_08" type="button" text="Button"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="width:268px;vertical-align:middle;">
        <bttdojo:label id="X061_Date_Text2Table_Editable_non_label03" text="different data type, different pattern copy"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:button id="X061_Date_Text2Table_Editable_non_button_10" type="button" text="Button"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:button id="X061_Date_Text2Table_Editable_non_button_11" type="button" text="Button"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="width:268px;vertical-align:middle;">
        <bttdojo:label id="X061_Date_Text2Table_Editable_non_label13" text="copy label in the right of the textbox to table"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:button id="X061_Date_Text2Table_Editable_non_button_13" type="button" text="Button"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:button id="X061_Date_Text2Table_Editable_non_button_14" type="button" text="Button"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="width:268px;vertical-align:middle;">
        <bttdojo:label id="X061_Date_Text2Table_Editable_non_label11" text="copy following label to table"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:button id="X061_Date_Text2Table_Editable_non_button_16" type="button" text="Button"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:button id="X061_Date_Text2Table_Editable_non_button_17" type="button" text="Button"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="width:268px;vertical-align:middle;">
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="X061_Date_Text2Table_Editable_non_label_slash" text="03/12/2013"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="X061_Date_Text2Table_Editable_non_label_bar" text="03-11-2013"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="width:268px;vertical-align:middle;">
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="width:268px;vertical-align:middle;">
        <bttdojo:label id="X061_Date_Text2Table_Editable_non_label06" text="editable"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td colspan="4" align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:table id="X061_Date_Text2Table_Editable_non_table" dataName="X061_TableList" dataNameForList="X061_TableList" selectionMode="multiple" isPageable="false">
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="date_slash" dataName="date_slash" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="date_bar" dataName="date_bar" noresize="false" repeat="true" id="columnId1" headerVAlign="left"/>
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="calendar_slash" dataName="calendar_slash" noresize="false" repeat="true" id="columnId2" headerVAlign="left"/>
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="calendar_bar" dataName="calendar_bar" noresize="false" repeat="true" id="columnId3" headerVAlign="left"/>
        </bttdojo:table>
      </td>
    </tr>
  </table>

<!-- applet id="printApplet" name="printApplet" code="com.ibm.btt.print.applets.PrintrApplet" codebase="applets" archive="bttprint.jar,JSON4J.jar" style="width:0px; height:0px;"></applet-->
</body>
</html>