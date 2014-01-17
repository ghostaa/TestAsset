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
<!-- Generated from B004_index.xui by mashuai, on  -->
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
<div style="width:100%;height:100%;" id="B004_index_dijit_layout_BorderContainer" data-dojo-type="dijit.layout.BorderContainer">
  <div id="B004_index_dijit_layout_BorderContainer_leftPanel" data-dojo-props="region:'left',ioArgs:{content:{dse_sessionId:'${dse_sessionId}'}},splitter:true" style="text-align:left;overflow-y:auto;" data-dojo-type="dijit.layout.ContentPane">
    <div style="height:100%;" class="BTTTableStyle">
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="width:187px;vertical-align:top;">
            <div style="width:100%;" id="B004_index_panel" class="BTTTableStyle">
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:label id="B004_index_label17" text="Welcome"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:a id="B004_index_link34" text="BTT" action="#"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:a id="B004_index_link35" text="Stock" action="#"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:a id="B004_index_link37" text="Test context" action="#"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:label id="B004_index_label" text="Areas"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="right" style="vertical-align:middle;">
                  <bttdojo:a id="B004_index_link" text="AreasPlot " action="#"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:label id="B004_index_label01" text="Candlesticks"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="right" style="vertical-align:middle;">
                  <bttdojo:a id="B004_index_link01" text="CandlesticksPlot " action="#"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="right" style="vertical-align:middle;">
                  <bttdojo:a id="B004_index_link02" text="CandlesticksGrid " action="#"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="right" style="vertical-align:middle;">
                  <bttdojo:a id="B004_index_link03" text="CandlesticksTheme " action="#"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:label id="B004_index_label02" text="Columns"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="right" style="vertical-align:middle;">
                  <bttdojo:a id="B004_index_link04" text="Columns " action="#"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="right" style="vertical-align:middle;">
                  <bttdojo:a id="B004_index_link05" text="ColumnsHorizontalGrid " action="#"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="right" style="vertical-align:middle;">
                  <bttdojo:a id="B004_index_link06" text="ColumnsVerticalGrid " action="#"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="right" style="vertical-align:middle;">
                  <bttdojo:a id="B004_index_link07" text="ColumnsPlot " action="#"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="right" style="vertical-align:middle;">
                  <bttdojo:a id="B004_index_link08" text="ColumnSeries " action="#"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:label id="B004_index_label03" text="ClusteredColunms"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="right" style="vertical-align:middle;">
                  <bttdojo:a id="B004_index_link09" text="ClusteredColunmsPlot" action="#"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="right" style="vertical-align:middle;">
                  <bttdojo:a id="B004_index_link10" text="ClusteredColunmsGrid" action="#"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:label id="B004_index_label04" text="StakedColunms"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="right" style="vertical-align:middle;">
                  <bttdojo:a id="B004_index_link11" text="StackedColunmsPlot" action="#"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="right" style="vertical-align:middle;">
                  <bttdojo:a id="B004_index_link12" text="StackedColunmsGrid" action="#"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:label id="B004_index_label05" text="Lines"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="right" style="vertical-align:middle;">
                  <bttdojo:a id="B004_index_link13" text="Lines" action="#"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="right" style="vertical-align:middle;">
                  <bttdojo:a id="B004_index_link14" text="LinesSeries" action="#"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:label id="B004_index_label06" text="Pie"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="right" style="vertical-align:middle;">
                  <bttdojo:a id="B004_index_link15" text="Pie " action="#"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="right" style="vertical-align:middle;">
                  <bttdojo:a id="B004_index_link16" text="PiePlot " action="#"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="right" style="vertical-align:middle;">
                  <bttdojo:a id="B004_index_link36" text="PieTheme" action="#"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:label id="B004_index_label07" text="DHLC"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="right" style="vertical-align:middle;">
                  <bttdojo:a id="B004_index_link17" text="OHLCPlot " action="#"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="right" style="vertical-align:middle;">
                  <bttdojo:a id="B004_index_link18" text="OHLCGrid " action="#"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="right" style="vertical-align:middle;">
                  <bttdojo:a id="B004_index_link19" text="OHLCSeries " action="#"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="right" style="vertical-align:middle;">
                  <bttdojo:a id="B004_index_link20" text="OHLCStroke " action="#"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:label id="B004_index_label08" text="StackedLines"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="right" style="vertical-align:middle;">
                  <bttdojo:a id="B004_index_link21" text="StackedLinesGrid " action="#"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="right" style="vertical-align:middle;">
                  <bttdojo:a id="B004_index_link22" text="StackedLinesPlot " action="#"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:label id="B004_index_label09" text="StackedAreas"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="right" style="vertical-align:middle;">
                  <bttdojo:a id="B004_index_link23" text="StackedAreasPlot " action="#"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:label id="B004_index_label10" text="Bubble"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="right" style="vertical-align:middle;">
                  <bttdojo:a id="B004_index_link24" text="BubbleGrid " action="#"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="right" style="vertical-align:middle;">
                  <bttdojo:a id="B004_index_link25" text="BubblePlot " action="#"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:label id="B004_index_label11" text="Markers"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="right" style="vertical-align:middle;">
                  <bttdojo:a id="B004_index_link26" text="MarkersPlot " action="#"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="right" style="vertical-align:middle;">
                  <bttdojo:a id="B004_index_link27" text="MarkersGrid " action="#"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:label id="B004_index_label12" text="MarkersOnly"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="right" style="vertical-align:middle;">
                  <bttdojo:a id="B004_index_link28" text="MarkersOnlyPlot " action="#"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="right" style="vertical-align:middle;">
                  <bttdojo:a id="B004_index_link29" text="MarkersOnlyGrid " action="#"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:label id="B004_index_label13" text="Mix"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="right" style="vertical-align:middle;">
                  <bttdojo:a id="B004_index_link30" text="Mix " action="#"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:label id="B004_index_label14" text="Bars"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="right" style="vertical-align:middle;">
                  <bttdojo:a id="B004_index_link31" text="Bars" action="#"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:label id="B004_index_label15" text="ClusteredBars"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="right" style="vertical-align:middle;">
                  <bttdojo:a id="B004_index_link32" text="ClusteredBars" action="#"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:label id="B004_index_label16" text="StackedBars"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="right" style="vertical-align:middle;">
                  <bttdojo:a id="B004_index_link33" text="StackedBars" action="#"/>
                </div>
              </div>
            </div>
        </div>
      </div>
    </div>
</div>
  <div id="B004_index_dijit_layout_BorderContainer_centerPanel" data-dojo-props="region:'center',ioArgs:{content:{dse_sessionId:'${dse_sessionId}'}}" style="text-align:left;" data-dojo-type="dijit.layout.ContentPane">
  </div>
</div>

<div url="jsp/B004Chart/B004_index.js" prefix="" dojoType="com.ibm.btt.event.ECALoader"></div>
<!-- applet id="printApplet" name="printApplet" code="com.ibm.btt.print.applets.PrintrApplet" codebase="applets" archive="bttprint.jar,JSON4J.jar" style="width:0px; height:0px;"></applet-->
</body>
</html>