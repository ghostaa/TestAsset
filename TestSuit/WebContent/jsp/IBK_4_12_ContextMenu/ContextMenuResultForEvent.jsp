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
<!-- Generated from ContextMenuResultForEvent.xui by mashuai, on Fri Jan 17 13:40:20 CST 2014 -->
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
<%request.setAttribute("dse_sessionId", session.getId()); %>
  <table id="ContextMenuResultForEvent_panel">
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:a id="ContextMenuResultForEvent_link" text="back" flowEvent="back"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="ContextMenuResultForEvent_label01" text="Link Name"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="ContextMenuResultForEvent_label" dataName="SingleSelectData.linkName" text="Label"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="ContextMenuResultForEvent_label02" text="Link_NoAction"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="ContextMenuResultForEvent_label03" dataName="SingleSelectData.ContentMenu_Link_NoAction" text="Label"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="ContextMenuResultForEvent_label04" text="Link_URLAndSubmit"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="ContextMenuResultForEvent_label05" dataName="SingleSelectData.ContentMenu_Link_URLAndSubmit" text="Label"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="ContextMenuResultForEvent_label06" text="Link_CancelAndSave"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="ContextMenuResultForEvent_label07" dataName="SingleSelectData.ContentMenu_Link_CancelAndSave" text="Label"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="ContextMenuResultForEvent_label08" text="Button_NoAction"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="ContextMenuResultForEvent_label09" dataName="SingleSelectData.ContentMenu_Button_NoAction" text="Label"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="ContextMenuResultForEvent_label11" text="Button_URLAndSubmit"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="ContextMenuResultForEvent_Label01" dataName="SingleSelectData.ContentMenu_Button_URLAndSubmit" text="Label"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="ContextMenuResultForEvent_label10" text="Button_CancelAndSave"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="ContextMenuResultForEvent_label12" dataName="SingleSelectData.ContentMenu_Button_CancelAndSave" text="Label"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="ContextMenuResultForEvent_label13" text="DataOutOfTable1"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="ContextMenuResultForEvent_label14" dataName="DataOutOfTable1" text="Label"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="ContextMenuResultForEvent_label15" text="Do you feel Happy?"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="ContextMenuResultForEvent_label16" dataName="DataOutOfTable2" text="Label"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="ContextMenuResultForEvent_label18" text="Combo"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="ContextMenuResultForEvent_label17" dataName="DataOutOfTable3" text="Label"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="ContextMenuResultForEvent_label19" text="Mutil-Selection Result"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td colspan="2" align="left" valign="middle" style="vertical-align:middle;">
          <div id="ContextMenuResultForEvent_Panel01" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:table id="ContextMenuResultForEvent_table" dataNameForList="MutipleSelectData" isPageable="false">
                  <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="%nls.testtable/Rate" dataName="linkName" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
                  <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="LinkECA" dataName="ContentMenu_Link_NoAction" noresize="false" repeat="true" id="columnId1" headerVAlign="left"/>
                  <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="LinkURL" dataName="ContentMenu_Link_URLAndSubmit" noresize="false" repeat="true" id="columnId2" headerVAlign="left"/>
                  <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="LinkSubmit" dataName="ContentMenu_Link_CancelAndSave" noresize="false" repeat="true" id="columnId3" headerVAlign="left"/>
                  <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="ButtonECA" dataName="ContentMenu_Button_NoAction" noresize="false" repeat="true" id="columnId4" headerVAlign="left"/>
                  <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="ButtonURL" dataName="ContentMenu_Button_URLAndSubmit" noresize="false" repeat="true" id="columnId5" headerVAlign="left"/>
                  <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="ButtonSubmit" dataName="ContentMenu_Button_CancelAndSave" noresize="false" repeat="true" id="columnId6" headerVAlign="left"/>
                </bttdojo:table>
              </div>
            </div>
          </div>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
  </table>

<!-- applet id="printApplet" name="printApplet" code="com.ibm.btt.print.applets.PrintrApplet" codebase="applets" archive="bttprint.jar,JSON4J.jar" style="width:0px; height:0px;"></applet-->
</body>
</html>