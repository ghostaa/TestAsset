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
<!-- Generated from X061_UC1_date_noneditable.xui by mashuai, on  -->
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
<script type="text/javascript" data-btt-eca="true" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/X061/X061_UC1_date_noneditable.js"> </script>
<%request.setAttribute("dse_sessionId", session.getId()); %>
  <div id="X061_UC1_date_noneditable_panel" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:top;">
        <bttdojo:form id="X061_UC1_date_noneditable_form" errorPage="X061/X061_UC1_date_noneditable.jsp">
          <table style="width:855px;height:629px;">
            <tr>
              <td colspan="2" align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="X061_UC1_date_noneditable_label" text="test different pattern data can be copied correctly to a different widget" width="436px" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td colspan="2" align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="X061_UC1_date_noneditable_label03" text=" column1, data type: Date, pattern dd/MM/yyyy"/>
              </td>
            </tr>
            <tr>
              <td colspan="2" align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="X061_UC1_date_noneditable_label04" text=" column2, data type: XMLGregorianCalendar, pattern dd/MM/yyyy"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="X061_UC1_date_noneditable_label09" text="onRowDbClick"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="X061_UC1_date_noneditable_label05" text="execute the ECARules, copy from table to textbox. Date to Date, XMLGC to XMLGC. getValueInSelectedItem()"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:button id="X061_UC1_date_noneditable_button_vifsi_d2d" type="button" text="D2D_gVIFSI"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="X061_UC1_date_noneditable_label08" text="Date to Date, XMLGC to XMLGC, uses getValueInFirstSelectedItem()"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:button id="X061_UC1_date_noneditable_button_vifsi_d2x" type="button" text="D2X_gVIFSI"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="X061_UC1_date_noneditable_label07_copy01" text="Date to XMLGC, XMLGC to Date, getValueInFirstSelectedItem()" height="13px"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:button id="X061_UC1_date_noneditable_button_oifsi_d2d" type="button" text="D2D_gOIFSI"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="X061_UC1_date_noneditable_label08_copy" text="Date to Date, XMLGC to XMLGC, uses getObjectInFirstSelectedItem()"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:button id="X061_UC1_date_noneditable_button_oifsi_d2x" type="button" text="D2X_gOIFSI"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="X061_UC1_date_noneditable_label07_copy01_copy" text="Date to XMLGC, XMLGC to Date, getObjectInFirstSelectedItem()" height="13px"/>
              </td>
            </tr>
            <tr>
              <td colspan="2" align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:table id="X061_UC1_date_noneditable_table" dataName="TableList.0" dataNameForList="TableList" selectionMode="single" isPageable="false">
                  <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Date_slash" dataName="Date_slash" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
                  <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Calendar_slash" dataName="Calendar_slash" noresize="false" repeat="true" id="columnId2" headerVAlign="left"/>
                </bttdojo:table>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:textbox id="X061_UC1_date_noneditable_text01" dataName="DateTextbox" type="Date" pattern="dd-MM-yyyy"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="X061_UC1_date_noneditable_label02" text="Date, pattern dd-MM-yyyy"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:textbox id="X061_UC1_date_noneditable_text02" dataName="CalendarTextbox" type="Date" pattern="dd-MM-yyyy"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="X061_UC1_date_noneditable_label01" text="XMLGregorianCalendar, pattern dd-MM-yyyy"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="X061_UC1_date_noneditable_label_date" text="Label"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="X061_UC1_date_noneditable_label11" text="display Date"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="X061_UC1_date_noneditable_label_XMLGC" text="Label"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="X061_UC1_date_noneditable_label12" text="display XMLGregorianCalendar"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:button id="X061_UC1_date_noneditable_button01" type="button" text="Copy to table1" flowEvent="viewEvt"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="X061_UC1_date_noneditable_Label01" text="Date to Date, XMLGregorianCalendar to XMLGregorianCalendar"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:button id="X061_UC1_date_noneditable_button02" type="button" text="Copy to table1" flowEvent="viewEvt"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="X061_UC1_date_noneditable_label06" text="Date copy to XMLGregorianCalendar,XMLGregorianCalendar copy to Date"/>
              </td>
            </tr>
            <tr>
              <td colspan="2" align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:table id="X061_UC1_date_noneditable_table01" dataNameForList="TableList01" isPageable="false">
                  <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Date01" dataName="Date01" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
                  <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Calendar_slash" dataName="Calendar_slash" noresize="false" repeat="true" id="columnId1" headerVAlign="left"/>
                </bttdojo:table>
              </td>
            </tr>
          </table>
      </bttdojo:form>
      </div>
    </div>
  </div>

<!-- applet id="printApplet" name="printApplet" code="com.ibm.btt.print.applets.PrintrApplet" codebase="applets" archive="bttprint.jar,JSON4J.jar" style="width:0px; height:0px;"></applet-->
</body>
</html>