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
<!-- Generated from X061_Text2Table_Single_Editable.xui by mashuai, on Fri Jan 17 15:17:53 CST 2014 -->
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
<script type="text/javascript" data-btt-eca="true" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/X061/X061_Text2Table_Single_Editable.js"> </script>
<%request.setAttribute("dse_sessionId", session.getId()); %>
  <div id="X061_Text2Table_Single_Editable_panel" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:form id="X061_Text2Table_Single_Editable_form" errorPage="X061/X061_Text2Table_Single_Editable.jsp">
          <div class="BTTTableStyle">
            <div class="BTTRowStyle">
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
                <bttdojo:label id="X061_Text2Table_Single_Editable_label04_copy" text="date_slash"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:textbox id="X061_Text2Table_Single_Editable_text_date_slash" dataName="X061_DataRecord.date_slash" type="Date" pattern="dd/MM/yyyy"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="X061_Text2Table_Single_Editable_label_date_slash" text="01/03/2013"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="X061_Text2Table_Single_Editable_label05_copy" text="date_bar"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:textbox id="X061_Text2Table_Single_Editable_text_date_bar" dataName="X061_DataRecord.date_bar" type="Date" pattern="dd-MM-yyyy"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="X061_Text2Table_Single_Editable_label_date_bar" text="02-03-2013"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="X061_Text2Table_Single_Editable_label07" text="calendar_slash"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:textbox id="X061_Text2Table_Single_Editable_text_calendar_slash" dataName="X061_DataRecord.calendar_slash" type="Date" pattern="dd/MM/yyyy"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="X061_Text2Table_Single_Editable_label_calendar_slash" text="03/03/2013"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="X061_Text2Table_Single_Editable_label08" text="calendar_bar"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:textbox id="X061_Text2Table_Single_Editable_text_calendar_bar" dataName="X061_DataRecord.calendar_bar" type="Date" pattern="dd-MM-yyyy"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="X061_Text2Table_Single_Editable_label_calendar_bar" text="04-03-2013"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="X061_Text2Table_Single_Editable_label" text="num_1"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:textbox id="X061_Text2Table_Single_Editable_text_num_1" dataName="X061_DataRecord.num_1" type="Number"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="X061_Text2Table_Single_Editable_label_num_1" text="Label"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="X061_Text2Table_Single_Editable_label03" text="num_2"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:textbox id="X061_Text2Table_Single_Editable_text_num_2" dataName="X061_DataRecord.num_2" type="Number"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="X061_Text2Table_Single_Editable_label_num_2" text="Label"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="X061_Text2Table_Single_Editable_label02" text="float_2"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:textbox id="X061_Text2Table_Single_Editable_text_float_2" dataName="X061_DataRecord.float_2" type="Number" numberType="float" decimalPlaces="2"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="X061_Text2Table_Single_Editable_label_float_2" text="Label"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="X061_Text2Table_Single_Editable_label01" text="float_3"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:textbox id="X061_Text2Table_Single_Editable_text_float_3" dataName="X061_DataRecord.float_3" type="Number" numberType="float" decimalPlaces="2"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="X061_Text2Table_Single_Editable_label_float_3" text="Label"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="X061_Text2Table_Single_Editable_Label03" text="currency_cny"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:textbox id="X061_Text2Table_Single_Editable_text_currency_cny" dataName="X061_DataRecord.currency_cny" type="Currency" currency="CNY" numberType="bigDecimal"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="X061_Text2Table_Single_Editable_label_currency_cny" text="Label"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="X061_Text2Table_Single_Editable_Label02" text="currency_usd"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:textbox id="X061_Text2Table_Single_Editable_text_currency_usd" dataName="X061_DataRecord.currency_usd" type="Currency" currency="USD" numberType="bigDecimal"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="X061_Text2Table_Single_Editable_label_currency_usd" text="Label"/>
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
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="X061_Text2Table_Single_Editable_label12" text="Copy to table"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="X061_Text2Table_Single_Editable_label09" text="table.setCellValueByIndex(inColumnIndex, inRowIndex,inValue )"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="X061_Text2Table_Single_Editable_label10" text="table.setValueByName(inName, inRowIndex,inValue)"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="X061_Text2Table_Single_Editable_label_copy" text="same data type, same pattern copy"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:button id="X061_Text2Table_Single_Editable_button_01" type="button" text="Button"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:button id="X061_Text2Table_Single_Editable_button_02" type="button" text="Button"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="X061_Text2Table_Single_Editable_label01_copy" text="same data type, different pattern copy"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:button id="X061_Text2Table_Single_Editable_button_04" type="button" text="Button"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:button id="X061_Text2Table_Single_Editable_button_05" type="button" text="Button"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="X061_Text2Table_Single_Editable_label02_copy" text="different data type, same pattern copy"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:button id="X061_Text2Table_Single_Editable_button_07" type="button" text="Button"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:button id="X061_Text2Table_Single_Editable_button_08" type="button" text="Button"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="X061_Text2Table_Single_Editable_label03_copy" text="different data type, different pattern copy"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:button id="X061_Text2Table_Single_Editable_button_10" type="button" text="Button"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:button id="X061_Text2Table_Single_Editable_button_11" type="button" text="Button"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="X061_Text2Table_Single_Editable_label13" text="copy label to table"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:button id="X061_Text2Table_Single_Editable_button_13" type="button" text="Button"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:button id="X061_Text2Table_Single_Editable_button_14" type="button" text="Button"/>
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
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="X061_Text2Table_Single_Editable_label04" text="single selection mode, editable"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
              </div>
            </div>
          </div>
      </bttdojo:form>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:form id="X061_Text2Table_Single_Editable_form01" errorPage="X061/X061_Text2Table_Single_Editable.jsp">
          <table style="width:725px;">
            <tr>
              <td colspan="2" align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:table id="X061_Text2Table_Single_Editable_table" dataName="X061_DataRecord" dataNameForList="X061_TableList" selectionMode="single" isPageable="false">
                  <bttdojo:column level="1" rowSpan="1" widget="TextBox" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="date_slash" pattern="dd/MM/yyyy" dataName="date_slash" noresize="false" type="Date" repeat="true" id="columnId4" headerVAlign="left"/>
                  <bttdojo:column level="1" rowSpan="1" widget="TextBox" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="date_bar" pattern="dd-MM-yyyy" dataName="date_bar" noresize="false" type="Date" repeat="true" id="columnId5" headerVAlign="left"/>
                  <bttdojo:column level="1" rowSpan="1" widget="TextBox" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="calendar_slash" pattern="dd/MM/yyyy" dataName="calendar_slash" noresize="false" type="Date" repeat="true" id="columnId6" headerVAlign="left"/>
                  <bttdojo:column level="1" rowSpan="1" widget="TextBox" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="calendar_bar" pattern="dd-MM-yyyy" dataName="calendar_bar" noresize="false" type="Date" repeat="true" id="columnId7" headerVAlign="left"/>
                  <bttdojo:column level="1" rowSpan="1" widget="TextBox" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="num_1" dataName="num_1" noresize="false" type="Number" repeat="true" id="columnId0" headerVAlign="left"/>
                  <bttdojo:column level="1" rowSpan="1" widget="TextBox" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="num_2" dataName="num_2" noresize="false" type="Number" repeat="true" id="columnId1" headerVAlign="left"/>
                  <bttdojo:column numberType="float" level="1" rowSpan="1" widget="TextBox" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="float_2" dataName="float_2" noresize="false" type="Number" repeat="true" id="columnId2" headerVAlign="left" decimalPlaces="2"/>
                  <bttdojo:column numberType="float" level="1" rowSpan="1" widget="TextBox" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="float_3" dataName="float_3" noresize="false" type="Number" repeat="true" id="columnId3" headerVAlign="left" decimalPlaces="2"/>
                  <bttdojo:column numberType="bigDecimal" level="1" rowSpan="1" widget="TextBox" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="currency_cny" currency="CNY" dataName="currency_cny" noresize="false" type="Currency" repeat="true" id="columnId8" headerVAlign="left"/>
                  <bttdojo:column numberType="bigDecimal" level="1" rowSpan="1" widget="TextBox" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="currency_usd" currency="USD" dataName="currency_usd" noresize="false" type="Currency" repeat="true" id="columnId9" headerVAlign="left"/>
                </bttdojo:table>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:button id="X061_Text2Table_Single_Editable_Button01" type="submit" text="submit to editable table" flowEvent="viewEvt"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:button id="X061_Text2Table_Single_Editable_button" type="submit" text="submit to non-editble table" flowEvent="viewEvt"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
          </table>
      </bttdojo:form>
      </div>
    </div>
    <div class="BTTRowStyle">
    </div>
  </div>

<!-- applet id="printApplet" name="printApplet" code="com.ibm.btt.print.applets.PrintrApplet" codebase="applets" archive="bttprint.jar,JSON4J.jar" style="width:0px; height:0px;"></applet-->
</body>
</html>