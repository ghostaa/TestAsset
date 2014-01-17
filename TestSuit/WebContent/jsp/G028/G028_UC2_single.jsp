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
<!-- Generated from G028_UC2_single.xui by mashuai, on Fri Jan 17 15:16:54 CST 2014 -->
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
<script type="text/javascript" data-btt-eca="true" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/G028/G028_UC2_single.js"> </script>
<%request.setAttribute("dse_sessionId", session.getId()); %>
  <div id="G028_UC2_single_panel" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:form id="G028_UC2_single_form" errorPage="G028/G028_UC2_single.jsp">
          <table style="width:656px;height:490px;">
            <tr>
              <td colspan="4" align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="G028_UC2_single_label" text="test column filtering for a table with single row selection"/>
              </td>
            </tr>
            <tr>
              <td colspan="4" align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:table id="G028_UC2_single_table" dataName="selectedAccount" dataNameForList="accounts" selectionMode="single" flowEvent="ok" isActionable="true" isPageable="false">
                  <bttdojo:column level="1" rowSpan="1" widget="TextBox" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="name" dataName="name" noresize="false" repeat="true" id="columnId1" headerVAlign="left"/>
                  <bttdojo:column numberType="float" level="1" rowSpan="1" widget="TextBox" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="balance" dataName="balance" noresize="false" type="Number" repeat="true" id="columnId0" headerVAlign="left" decimalPlaces="2"/>
                  <bttdojo:column unCheckedValue="false" level="1" rowSpan="1" widget="Radio" align="left" width="80" alwaysEditing="true" checkedValue="true" dataName="isOk" repeat="true" id="columnId2" headerVAlign="left" colSpan="1" hidden="false" headerHAlign="left" text="isOk" noresize="false"/>
                </bttdojo:table>
              </td>
            </tr>
            <tr>
              <td colspan="4" align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="G028_UC2_single_label09" text="other form data:"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="G028_UC2_single_label08" text="formData.field1"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:textbox id="G028_UC2_single_text" dataName="formData.field1"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="G028_UC2_single_label07" text="formData.text_double"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:textbox id="G028_UC2_single_Text01" dataName="formData.text_double" type="Number" numberType="double" decimalPlaces="3"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="G028_UC2_single_label02" text="chang flow event"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="G028_UC2_single_label05" text="launch new flow"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="G028_UC2_single_label06" text="launch new operation (check console  if it post the required data to operation)" width="140px" textWrap="true"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="G028_UC2_single_label01" text="submit"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:button id="G028_UC2_single_button_copy" type="submit" text="Button" flowEvent="ok"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:button id="G028_UC2_single_button03_copy" type="submit" text="Button" flowId="G028_SimpleFlow" flowEvent="start"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:button id="G028_UC2_single_button06" type="submit" text="Button" operationId="G028_forLaunchOperationOp"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="G028_UC2_single_label03" text="submit with no data"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:button id="G028_UC2_single_button01_copy" type="cancel" text="Button" flowEvent="ok"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:button id="G028_UC2_single_button04_copy" type="cancel" text="Button" flowId="G028_SimpleFlow" flowEvent="start"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:button id="G028_UC2_single_Button01_copy" type="cancel" text="Button" operationId="G028_forLaunchOperationOp"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="G028_UC2_single_label04" text="submit without validation"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:button id="G028_UC2_single_button02_copy" type="save" text="Button" flowEvent="ok"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:button id="G028_UC2_single_button05" type="save" text="Button" flowId="G028_SimpleFlow" flowEvent="start"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:button id="G028_UC2_single_button07" type="save" text="Button" operationId="G028_forLaunchOperationOp"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:button id="G028_UC2_single_Button01" type="submit" text="submit to pop up" flowEvent="submitPop"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
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
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:button id="G028_UC2_single_button02" type="button" text="form.callAsyncOperation"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
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