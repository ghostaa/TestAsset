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
<!-- Generated from G017_SelectList.xui by mashuai, on  -->
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
<script type="text/javascript" data-btt-eca="true" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/G017/G017_SelectList.js"> </script>
<%request.setAttribute("dse_sessionId", session.getId()); %>
  <table id="G017_SelectList_panel">
    <tr>
      <td colspan="3" align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="G017_SelectList_label" text="We have a configuration file for this feature named globalConfiguration.js, in this file we can set the clickModeForDropDown property. This property indicates the selection list opens when the user clicks on the button at the right or anywhere on the widget. The default value is OnlyOnButton" width="800px" textWrap="true"/>
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
    <tr>
      <td colspan="3" align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="G017_SelectList_label01" text="Here are some ECARules for the selectList Widget, act as the first column said, the label's value will change as well."/>
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
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="G017_SelectList_label02" text="action for the selectList"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="G017_SelectList_label03" text="act as the first column on selectList widget, it will call ECARules. " width="269px" textWrap="true"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="G017_SelectList_label04" text="onClick"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:select id="G017_SelectList_selectList_03" dataName="AccountInfoList.0.AccountNo" dataNameForList="AccountInfoList" labelField="AccountName" valueField="AccountNo"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="G017_SelectList_label_03" text="Label"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="G017_SelectList_label05" text="onMouseDown"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:select id="G017_SelectList_selectList_04" dataName="AccountInfoList.0.AccountNo" dataNameForList="AccountInfoList" labelField="AccountName" valueField="AccountNo"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="G017_SelectList_label_04" text="Label"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="G017_SelectList_label06" text="onMouseUp"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:select id="G017_SelectList_selectList_05" dataName="AccountInfoList.0.AccountNo" dataNameForList="AccountInfoList" labelField="AccountName" valueField="AccountNo"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="G017_SelectList_label_05" text="Label"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="G017_SelectList_label07" text="onMouseEnter"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:select id="G017_SelectList_selectList_06" dataName="AccountInfoList.0.AccountNo" dataNameForList="AccountInfoList" labelField="AccountName" valueField="AccountNo"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="G017_SelectList_label_06" text="Label"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="G017_SelectList_label08" text="onMouseLeave"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:select id="G017_SelectList_selectList_07" dataName="AccountInfoList.0.AccountNo" dataNameForList="AccountInfoList" labelField="AccountName" valueField="AccountNo"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="G017_SelectList_label_07" text="Label"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="G017_SelectList_label09" text="onMouseMove"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:select id="G017_SelectList_selectList_08" dataName="AccountInfoList.0.AccountNo" dataNameForList="AccountInfoList" labelField="AccountName" valueField="AccountNo"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="G017_SelectList_label_08" text="Label"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="G017_SelectList_label11" text="onFocus"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:select id="G017_SelectList_selectList_09" dataName="AccountInfoList.0.AccountNo" dataNameForList="AccountInfoList" labelField="AccountName" valueField="AccountNo"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="G017_SelectList_label_09" text="Label"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="G017_SelectList_label10" text="onBlur"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:select id="G017_SelectList_selectList_10" dataName="AccountInfoList.0.AccountNo" dataNameForList="AccountInfoList" labelField="AccountName" valueField="AccountNo"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="G017_SelectList_label_10" text="Label"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="G017_SelectList_label18" text="onKeyUp"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:select id="G017_SelectList_selectList_13" dataName="AccountInfoList.0.AccountNo" dataNameForList="AccountInfoList" labelField="AccountName" valueField="AccountNo"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="G017_SelectList_label_13" text="Label"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="G017_SelectList_label19" text="onChange"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:select id="G017_SelectList_selectList_14" dataName="AccountInfoList.0.AccountNo" dataNameForList="AccountInfoList" labelField="AccountName" valueField="AccountNo"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="G017_SelectList_label-_14" text="Label"/>
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
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="G017_SelectList_label15" text="click the following button to change this widget property"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:select id="G017_SelectList_selectList_15" dataName="AccountInfoList.0.AccountNo" dataNameForList="AccountInfoList" labelField="AccountName" valueField="AccountNo" hint="this is the sample widget"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:button id="G017_SelectList_button_0" type="button" text="get selected value"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="G017_SelectList_label_15" text="selected value"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:button id="G017_SelectList_button_01" type="button" text="visibility hidden"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:button id="G017_SelectList_button_02" type="button" text="visibility visible"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:button id="G017_SelectList_button" type="button" text="visibility gone"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:button id="G017_SelectList_button_03" type="button" text="disabled true"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:button id="G017_SelectList_button_04" type="button" text="disabled false"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:button id="G017_SelectList_button_05" type="button" text="readOnly true"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:button id="G017_SelectList_button_06" type="button" text="readOnly false"/>
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