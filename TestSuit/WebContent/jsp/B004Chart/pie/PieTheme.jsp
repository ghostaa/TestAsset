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
<!-- Generated from PieTheme.xui by mashuai, on  -->
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
  <bttdojo:datasource id="PieTheme_bttStoreWidget" fieldSet="listFL" operation="TableListOp"></bttdojo:datasource>
  <div id="PieTheme_panel" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <div style="width:400px;height:300px;" id="PieTheme_dojox_charting_widget_Chart2D" theme="dojox.charting.themes.Dintinctive" dojoType="dojox.charting.widget.Chart2D">
                <div class="plot" name="dojox_charting_widget_plot" type="Pie" markers="true" radius="150" stroke="{'style':'Solid'}"></div>
                <div class="action" type="Tooltip" plot="dojox_charting_widget_plot"></div>
                <div class="action" type="Highlight" plot="dojox_charting_widget_plot"></div>
                <div class="action" type="Shake" plot="dojox_charting_widget_plot"></div>
                <div class="action" type="Magnify" plot="dojox_charting_widget_plot" scale="1.5"></div>
                <div class="action" type="MoveSlice" plot="dojox_charting_widget_plot" scale="1.5" shift="0"></div>
              <div name="series" class="series" plot="dojox_charting_widget_plot" store="$BTT_DOS('listFL', {mapOpt:{'value':{'size':'@size','tooltip':'@label','x':function(s,i){return i;},'y':'@amount'}}}, 'PieTheme_bttStoreWidget')"></div>
        </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <div style="width:400px;height:300px;" id="PieTheme_dojox_charting_widget_Chart2D_copy" theme="dojox.charting.themes.Dollar" dojoType="dojox.charting.widget.Chart2D">
                <div class="plot" name="dojox_charting_widget_plot_copy" type="Pie" markers="true" radius="150" stroke="{'style':'Solid'}"></div>
                <div class="action" type="Tooltip" plot="dojox_charting_widget_plot_copy"></div>
                <div class="action" type="Highlight" plot="dojox_charting_widget_plot_copy"></div>
                <div class="action" type="Shake" plot="dojox_charting_widget_plot_copy"></div>
                <div class="action" type="Magnify" plot="dojox_charting_widget_plot_copy" scale="1.5"></div>
                <div class="action" type="MoveSlice" plot="dojox_charting_widget_plot_copy" scale="1.5" shift="0"></div>
              <div name="series" class="series" plot="dojox_charting_widget_plot_copy" store="$BTT_DOS('listFL', {mapOpt:{'value':{'size':'@size','tooltip':'@label','x':function(s,i){return i;},'y':'@amount'}}}, 'PieTheme_bttStoreWidget')"></div>
        </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <div style="width:400px;height:300px;" id="PieTheme_dojox_charting_widget_Chart2D_copy_copy" theme="dojox.charting.themes.Grasshopper" dojoType="dojox.charting.widget.Chart2D">
                <div class="plot" name="dojox_charting_widget_plot_copy_copy" type="Pie" markers="true" radius="150" stroke="{'style':'Solid'}"></div>
                <div class="action" type="Tooltip" plot="dojox_charting_widget_plot_copy_copy"></div>
                <div class="action" type="Highlight" plot="dojox_charting_widget_plot_copy_copy"></div>
                <div class="action" type="Shake" plot="dojox_charting_widget_plot_copy_copy"></div>
                <div class="action" type="Magnify" plot="dojox_charting_widget_plot_copy_copy" scale="1.5"></div>
                <div class="action" type="MoveSlice" plot="dojox_charting_widget_plot_copy_copy" scale="1.5" shift="0"></div>
              <div name="series" class="series" plot="dojox_charting_widget_plot_copy_copy" store="$BTT_DOS('listFL', {mapOpt:{'value':{'size':'@size','tooltip':'@label','x':function(s,i){return i;},'y':'@amount'}}}, 'PieTheme_bttStoreWidget')"></div>
        </div>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <div style="width:400px;height:300px;" id="PieTheme_dojox_charting_widget_Chart2D_copy_copy01" theme="dojox.charting.themes.Claro" dojoType="dojox.charting.widget.Chart2D">
                <div class="plot" name="dojox_charting_widget_plot_copy_copy01" type="Pie" markers="true" radius="150" stroke="{'style':'Solid'}"></div>
                <div class="action" type="Tooltip" plot="dojox_charting_widget_plot_copy_copy01"></div>
                <div class="action" type="Highlight" plot="dojox_charting_widget_plot_copy_copy01"></div>
                <div class="action" type="Shake" plot="dojox_charting_widget_plot_copy_copy01"></div>
                <div class="action" type="Magnify" plot="dojox_charting_widget_plot_copy_copy01" scale="1.5"></div>
                <div class="action" type="MoveSlice" plot="dojox_charting_widget_plot_copy_copy01" scale="1.5" shift="0"></div>
              <div name="series" class="series" plot="dojox_charting_widget_plot_copy_copy01" store="$BTT_DOS('listFL', {mapOpt:{'value':{'size':'@size','tooltip':'@label','x':function(s,i){return i;},'y':'@amount'}}}, 'PieTheme_bttStoreWidget')"></div>
        </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <div style="width:400px;height:300px;" id="PieTheme_dojox_charting_widget_Chart2D_copy_copy02" theme="dojox.charting.themes.ThreeD" dojoType="dojox.charting.widget.Chart2D">
                <div class="plot" name="dojox_charting_widget_plot_copy_copy02" type="Pie" markers="true" radius="150" stroke="{'style':'Solid'}"></div>
                <div class="action" type="Tooltip" plot="dojox_charting_widget_plot_copy_copy02"></div>
                <div class="action" type="Highlight" plot="dojox_charting_widget_plot_copy_copy02"></div>
                <div class="action" type="Shake" plot="dojox_charting_widget_plot_copy_copy02"></div>
                <div class="action" type="Magnify" plot="dojox_charting_widget_plot_copy_copy02" scale="1.5"></div>
                <div class="action" type="MoveSlice" plot="dojox_charting_widget_plot_copy_copy02" scale="1.5" shift="0"></div>
              <div name="series" class="series" plot="dojox_charting_widget_plot_copy_copy02" store="$BTT_DOS('listFL', {mapOpt:{'value':{'size':'@size','tooltip':'@label','x':function(s,i){return i;},'y':'@amount'}}}, 'PieTheme_bttStoreWidget')"></div>
        </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <div style="width:400px;height:300px;" id="PieTheme_dojox_charting_widget_Chart2D_copy_copy03" theme="dojox.charting.themes.Julie" dojoType="dojox.charting.widget.Chart2D">
                <div class="plot" name="dojox_charting_widget_plot_copy_copy03" type="Pie" markers="true" radius="150" stroke="{'style':'Solid'}"></div>
                <div class="action" type="Tooltip" plot="dojox_charting_widget_plot_copy_copy03"></div>
                <div class="action" type="Highlight" plot="dojox_charting_widget_plot_copy_copy03"></div>
                <div class="action" type="Shake" plot="dojox_charting_widget_plot_copy_copy03"></div>
                <div class="action" type="Magnify" plot="dojox_charting_widget_plot_copy_copy03" scale="1.5"></div>
                <div class="action" type="MoveSlice" plot="dojox_charting_widget_plot_copy_copy03" scale="1.5" shift="0"></div>
              <div name="series" class="series" plot="dojox_charting_widget_plot_copy_copy03" store="$BTT_DOS('listFL', {mapOpt:{'value':{'size':'@size','tooltip':'@label','x':function(s,i){return i;},'y':'@amount'}}}, 'PieTheme_bttStoreWidget')"></div>
        </div>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <div style="width:400px;height:300px;" id="PieTheme_dojox_charting_widget_Chart2D_copy_copy04" theme="dojox.charting.themes.Chris" dojoType="dojox.charting.widget.Chart2D">
                <div class="plot" name="dojox_charting_widget_plot_copy_copy04" type="Pie" markers="true" radius="150" stroke="{'style':'Solid'}"></div>
                <div class="action" type="Tooltip" plot="dojox_charting_widget_plot_copy_copy04"></div>
                <div class="action" type="Highlight" plot="dojox_charting_widget_plot_copy_copy04"></div>
                <div class="action" type="Shake" plot="dojox_charting_widget_plot_copy_copy04"></div>
                <div class="action" type="Magnify" plot="dojox_charting_widget_plot_copy_copy04" scale="1.5"></div>
                <div class="action" type="MoveSlice" plot="dojox_charting_widget_plot_copy_copy04" scale="1.5" shift="0"></div>
              <div name="series" class="series" plot="dojox_charting_widget_plot_copy_copy04" store="$BTT_DOS('listFL', {mapOpt:{'value':{'size':'@size','tooltip':'@label','x':function(s,i){return i;},'y':'@amount'}}}, 'PieTheme_bttStoreWidget')"></div>
        </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <div style="width:400px;height:300px;" id="PieTheme_dojox_charting_widget_Chart2D_copy_copy05" theme="dojox.charting.themes.Tom" dojoType="dojox.charting.widget.Chart2D">
                <div class="plot" name="dojox_charting_widget_plot_copy_copy05" type="Pie" markers="true" radius="150" stroke="{'style':'Solid'}"></div>
                <div class="action" type="Tooltip" plot="dojox_charting_widget_plot_copy_copy05"></div>
                <div class="action" type="Highlight" plot="dojox_charting_widget_plot_copy_copy05"></div>
                <div class="action" type="Shake" plot="dojox_charting_widget_plot_copy_copy05"></div>
                <div class="action" type="Magnify" plot="dojox_charting_widget_plot_copy_copy05" scale="1.5"></div>
                <div class="action" type="MoveSlice" plot="dojox_charting_widget_plot_copy_copy05" scale="1.5" shift="0"></div>
              <div name="series" class="series" plot="dojox_charting_widget_plot_copy_copy05" store="$BTT_DOS('listFL', {mapOpt:{'value':{'size':'@size','tooltip':'@label','x':function(s,i){return i;},'y':'@amount'}}}, 'PieTheme_bttStoreWidget')"></div>
        </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <div style="width:400px;height:300px;" id="PieTheme_dojox_charting_widget_Chart2D_copy_copy06" theme="dojox.charting.themes.PrimaryColors" dojoType="dojox.charting.widget.Chart2D">
                <div class="plot" name="dojox_charting_widget_plot_copy_copy06" type="Pie" markers="true" radius="150" stroke="{'style':'Solid'}"></div>
                <div class="action" type="Tooltip" plot="dojox_charting_widget_plot_copy_copy06"></div>
                <div class="action" type="Highlight" plot="dojox_charting_widget_plot_copy_copy06"></div>
                <div class="action" type="Shake" plot="dojox_charting_widget_plot_copy_copy06"></div>
                <div class="action" type="Magnify" plot="dojox_charting_widget_plot_copy_copy06" scale="1.5"></div>
                <div class="action" type="MoveSlice" plot="dojox_charting_widget_plot_copy_copy06" scale="1.5" shift="0"></div>
              <div name="series" class="series" plot="dojox_charting_widget_plot_copy_copy06" store="$BTT_DOS('listFL', {mapOpt:{'value':{'size':'@size','tooltip':'@label','x':function(s,i){return i;},'y':'@amount'}}}, 'PieTheme_bttStoreWidget')"></div>
        </div>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <div style="width:400px;height:300px;" id="PieTheme_dojox_charting_widget_Chart2D_copy_copy07" theme="dojox.charting.themes.Electric" dojoType="dojox.charting.widget.Chart2D">
                <div class="plot" name="dojox_charting_widget_plot_copy_copy07" type="Pie" markers="true" radius="150" stroke="{'style':'Solid'}"></div>
                <div class="action" type="Tooltip" plot="dojox_charting_widget_plot_copy_copy07"></div>
                <div class="action" type="Highlight" plot="dojox_charting_widget_plot_copy_copy07"></div>
                <div class="action" type="Shake" plot="dojox_charting_widget_plot_copy_copy07"></div>
                <div class="action" type="Magnify" plot="dojox_charting_widget_plot_copy_copy07" scale="1.5"></div>
                <div class="action" type="MoveSlice" plot="dojox_charting_widget_plot_copy_copy07" scale="1.5" shift="0"></div>
              <div name="series" class="series" plot="dojox_charting_widget_plot_copy_copy07" store="$BTT_DOS('listFL', {mapOpt:{'value':{'size':'@size','tooltip':'@label','x':function(s,i){return i;},'y':'@amount'}}}, 'PieTheme_bttStoreWidget')"></div>
        </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <div style="width:400px;height:300px;" id="PieTheme_dojox_charting_widget_Chart2D_copy_copy08" theme="dojox.charting.themes.Charged" dojoType="dojox.charting.widget.Chart2D">
                <div class="plot" name="dojox_charting_widget_plot_copy_copy08" type="Pie" markers="true" radius="150" stroke="{'style':'Solid'}"></div>
                <div class="action" type="Tooltip" plot="dojox_charting_widget_plot_copy_copy08"></div>
                <div class="action" type="Highlight" plot="dojox_charting_widget_plot_copy_copy08"></div>
                <div class="action" type="Shake" plot="dojox_charting_widget_plot_copy_copy08"></div>
                <div class="action" type="Magnify" plot="dojox_charting_widget_plot_copy_copy08" scale="1.5"></div>
                <div class="action" type="MoveSlice" plot="dojox_charting_widget_plot_copy_copy08" scale="1.5" shift="0"></div>
              <div name="series" class="series" plot="dojox_charting_widget_plot_copy_copy08" store="$BTT_DOS('listFL', {mapOpt:{'value':{'size':'@size','tooltip':'@label','x':function(s,i){return i;},'y':'@amount'}}}, 'PieTheme_bttStoreWidget')"></div>
        </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <div style="width:400px;height:300px;" id="PieTheme_dojox_charting_widget_Chart2D_copy_copy09" theme="dojox.charting.themes.Renkoo" dojoType="dojox.charting.widget.Chart2D">
                <div class="plot" name="dojox_charting_widget_plot_copy_copy09" type="Pie" markers="true" radius="150" stroke="{'style':'Solid'}"></div>
                <div class="action" type="Tooltip" plot="dojox_charting_widget_plot_copy_copy09"></div>
                <div class="action" type="Highlight" plot="dojox_charting_widget_plot_copy_copy09"></div>
                <div class="action" type="Shake" plot="dojox_charting_widget_plot_copy_copy09"></div>
                <div class="action" type="Magnify" plot="dojox_charting_widget_plot_copy_copy09" scale="1.5"></div>
                <div class="action" type="MoveSlice" plot="dojox_charting_widget_plot_copy_copy09" scale="1.5" shift="0"></div>
              <div name="series" class="series" plot="dojox_charting_widget_plot_copy_copy09" store="$BTT_DOS('listFL', {mapOpt:{'value':{'size':'@size','tooltip':'@label','x':function(s,i){return i;},'y':'@amount'}}}, 'PieTheme_bttStoreWidget')"></div>
        </div>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <div style="width:400px;height:300px;" id="PieTheme_dojox_charting_widget_Chart2D_copy_copy10" theme="dojox.charting.themes.Adobebricks" dojoType="dojox.charting.widget.Chart2D">
                <div class="plot" name="dojox_charting_widget_plot_copy_copy10" type="Pie" markers="true" radius="150" stroke="{'style':'Solid'}"></div>
                <div class="action" type="Tooltip" plot="dojox_charting_widget_plot_copy_copy10"></div>
                <div class="action" type="Highlight" plot="dojox_charting_widget_plot_copy_copy10"></div>
                <div class="action" type="Shake" plot="dojox_charting_widget_plot_copy_copy10"></div>
                <div class="action" type="Magnify" plot="dojox_charting_widget_plot_copy_copy10" scale="1.5"></div>
                <div class="action" type="MoveSlice" plot="dojox_charting_widget_plot_copy_copy10" scale="1.5" shift="0"></div>
              <div name="series" class="series" plot="dojox_charting_widget_plot_copy_copy10" store="$BTT_DOS('listFL', {mapOpt:{'value':{'size':'@size','tooltip':'@label','x':function(s,i){return i;},'y':'@amount'}}}, 'PieTheme_bttStoreWidget')"></div>
        </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <div style="width:400px;height:300px;" id="PieTheme_dojox_charting_widget_Chart2D_copy_copy11" theme="dojox.charting.themes.Algae" dojoType="dojox.charting.widget.Chart2D">
                <div class="plot" name="dojox_charting_widget_plot_copy_copy11" type="Pie" markers="true" radius="150" stroke="{'style':'Solid'}"></div>
                <div class="action" type="Tooltip" plot="dojox_charting_widget_plot_copy_copy11"></div>
                <div class="action" type="Highlight" plot="dojox_charting_widget_plot_copy_copy11"></div>
                <div class="action" type="Shake" plot="dojox_charting_widget_plot_copy_copy11"></div>
                <div class="action" type="Magnify" plot="dojox_charting_widget_plot_copy_copy11" scale="1.5"></div>
                <div class="action" type="MoveSlice" plot="dojox_charting_widget_plot_copy_copy11" scale="1.5" shift="0"></div>
              <div name="series" class="series" plot="dojox_charting_widget_plot_copy_copy11" store="$BTT_DOS('listFL', {mapOpt:{'value':{'size':'@size','tooltip':'@label','x':function(s,i){return i;},'y':'@amount'}}}, 'PieTheme_bttStoreWidget')"></div>
        </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <div style="width:400px;height:300px;" id="PieTheme_dojox_charting_widget_Chart2D_copy_copy12" theme="dojox.charting.themes.Bahamation" dojoType="dojox.charting.widget.Chart2D">
                <div class="plot" name="dojox_charting_widget_plot_copy_copy12" type="Pie" markers="true" radius="150" stroke="{'style':'Solid'}"></div>
                <div class="action" type="Tooltip" plot="dojox_charting_widget_plot_copy_copy12"></div>
                <div class="action" type="Highlight" plot="dojox_charting_widget_plot_copy_copy12"></div>
                <div class="action" type="Shake" plot="dojox_charting_widget_plot_copy_copy12"></div>
                <div class="action" type="Magnify" plot="dojox_charting_widget_plot_copy_copy12" scale="1.5"></div>
                <div class="action" type="MoveSlice" plot="dojox_charting_widget_plot_copy_copy12" scale="1.5" shift="0"></div>
              <div name="series" class="series" plot="dojox_charting_widget_plot_copy_copy12" store="$BTT_DOS('listFL', {mapOpt:{'value':{'size':'@size','tooltip':'@label','x':function(s,i){return i;},'y':'@amount'}}}, 'PieTheme_bttStoreWidget')"></div>
        </div>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <div style="width:400px;height:300px;" id="PieTheme_dojox_charting_widget_Chart2D_copy_copy13" theme="dojox.charting.themes.BlueDusk" dojoType="dojox.charting.widget.Chart2D">
                <div class="plot" name="dojox_charting_widget_plot_copy_copy13" type="Pie" markers="true" radius="150" stroke="{'style':'Solid'}"></div>
                <div class="action" type="Tooltip" plot="dojox_charting_widget_plot_copy_copy13"></div>
                <div class="action" type="Highlight" plot="dojox_charting_widget_plot_copy_copy13"></div>
                <div class="action" type="Shake" plot="dojox_charting_widget_plot_copy_copy13"></div>
                <div class="action" type="Magnify" plot="dojox_charting_widget_plot_copy_copy13" scale="1.5"></div>
                <div class="action" type="MoveSlice" plot="dojox_charting_widget_plot_copy_copy13" scale="1.5" shift="0"></div>
              <div name="series" class="series" plot="dojox_charting_widget_plot_copy_copy13" store="$BTT_DOS('listFL', {mapOpt:{'value':{'size':'@size','tooltip':'@label','x':function(s,i){return i;},'y':'@amount'}}}, 'PieTheme_bttStoreWidget')"></div>
        </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <div style="width:400px;height:300px;" id="PieTheme_dojox_charting_widget_Chart2D_copy_copy14" theme="dojox.charting.themes.CubanShirts" dojoType="dojox.charting.widget.Chart2D">
                <div class="plot" name="dojox_charting_widget_plot_copy_copy14" type="Pie" markers="true" radius="150" stroke="{'style':'Solid'}"></div>
                <div class="action" type="Tooltip" plot="dojox_charting_widget_plot_copy_copy14"></div>
                <div class="action" type="Highlight" plot="dojox_charting_widget_plot_copy_copy14"></div>
                <div class="action" type="Shake" plot="dojox_charting_widget_plot_copy_copy14"></div>
                <div class="action" type="Magnify" plot="dojox_charting_widget_plot_copy_copy14" scale="1.5"></div>
                <div class="action" type="MoveSlice" plot="dojox_charting_widget_plot_copy_copy14" scale="1.5" shift="0"></div>
              <div name="series" class="series" plot="dojox_charting_widget_plot_copy_copy14" store="$BTT_DOS('listFL', {mapOpt:{'value':{'size':'@size','tooltip':'@label','x':function(s,i){return i;},'y':'@amount'}}}, 'PieTheme_bttStoreWidget')"></div>
        </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <div style="width:400px;height:300px;" id="PieTheme_dojox_charting_widget_Chart2D_copy_copy15" theme="dojox.charting.themes.Desert" dojoType="dojox.charting.widget.Chart2D">
                <div class="plot" name="dojox_charting_widget_plot_copy_copy15" type="Pie" markers="true" radius="150" stroke="{'style':'Solid'}"></div>
                <div class="action" type="Tooltip" plot="dojox_charting_widget_plot_copy_copy15"></div>
                <div class="action" type="Highlight" plot="dojox_charting_widget_plot_copy_copy15"></div>
                <div class="action" type="Shake" plot="dojox_charting_widget_plot_copy_copy15"></div>
                <div class="action" type="Magnify" plot="dojox_charting_widget_plot_copy_copy15" scale="1.5"></div>
                <div class="action" type="MoveSlice" plot="dojox_charting_widget_plot_copy_copy15" scale="1.5" shift="0"></div>
              <div name="series" class="series" plot="dojox_charting_widget_plot_copy_copy15" store="$BTT_DOS('listFL', {mapOpt:{'value':{'size':'@size','tooltip':'@label','x':function(s,i){return i;},'y':'@amount'}}}, 'PieTheme_bttStoreWidget')"></div>
        </div>
      </div>
    </div>
  </div>

<!-- applet id="printApplet" name="printApplet" code="com.ibm.btt.print.applets.PrintrApplet" codebase="applets" archive="bttprint.jar,JSON4J.jar" style="width:0px; height:0px;"></applet-->
</body>
</html>