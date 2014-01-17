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
<!-- Generated from ClusteredBars.xui by mashuai, on Fri Jan 17 15:16:05 CST 2014 -->
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
  <bttdojo:datasource id="ClusteredBars_bttStoreWidget" fieldSet="listFL" operation="TableListOp"></bttdojo:datasource>
  <div id="ClusteredBars_panel" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="ClusteredBars_panel01" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <div style="width:400px;height:300px;" id="ClusteredBars_dojox_charting_widget_Chart2D" theme="dojox.charting.themes.Claro" vMajorLines="false" vMinorLines="true" y_titleFontColor="#408080" dojoType="dojox.charting.widget.Chart2D">
                      <div class="axis" name="x" includeZero="false" min="2000" max="8000" rotation="90" title="somethingX" titleGap="0" titleOrientation="axis" minorLabels="true" minorTickStep="500" trailingSymbol="')'" maxLabelCharCount="2"></div>
                      <div class="axis" name="y" includeZero="true" vertical="true" min="10" max="30" title="somethingY" titleGap="10" titleFontColor="#408080" minorLabels="true" minorTickStep="5" microTicks="true" microTickStep="1"></div>
                      <div class="plot" type="Grid" name="grid" vMajorLines="false" vMinorLines="true"></div>
                        <div class="plot" name="dojox_charting_widget_plot" type="ClusteredBars" labels="false" stroke="{'style':'Solid'}"></div>
                      <div name="series" class="series" plot="dojox_charting_widget_plot" store="$BTT_DOS('listFL', {mapOpt:{'value':{'x':function(s,i){return i;},'y':'@amount'}}}, 'ClusteredBars_bttStoreWidget')"></div>
                      <div name="series01" class="series" plot="dojox_charting_widget_plot" store="$BTT_DOS('listFL', {mapOpt:{'value':{'x':function(s,i){return i;},'y':'@amount'}}}, 'ClusteredBars_bttStoreWidget')"></div>
                </div>
              </div>
            </div>
          </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="ClusteredBars_panel02" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <div style="width:400px;height:300px;" id="ClusteredBars_dojox_charting_widget_Chart2D01" theme="dojox.charting.themes.Claro" dojoType="dojox.charting.widget.Chart2D">
                        <div class="plot" name="dojox_charting_widget_plot03" type="ClusteredBars" labels="false" stroke="{'style':'Solid'}"></div>
                        <div class="action" type="Highlight" plot="dojox_charting_widget_plot03"></div>
                      <div name="series" class="series" plot="dojox_charting_widget_plot03" store="$BTT_DOS('listFL', {mapOpt:{'value':{'x':function(s,i){return i;},'y':'@amount'}}}, 'ClusteredBars_bttStoreWidget')"></div>
                      <div name="series01" class="series" plot="dojox_charting_widget_plot03" store="$BTT_DOS('listFL', {mapOpt:{'value':{'x':function(s,i){return i;},'y':'@amount'}}}, 'ClusteredBars_bttStoreWidget')"></div>
                </div>
              </div>
            </div>
          </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="ClusteredBars_panel03" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <div style="width:400px;height:300px;" id="ClusteredBars_dojox_charting_widget_Chart2D03" theme="dojox.charting.themes.Claro" dojoType="dojox.charting.widget.Chart2D">
                        <div class="plot" name="dojox_charting_widget_plot07" type="ClusteredBars" labels="false" fill="'#80FF00'" stroke="{'style':'Solid'}"></div>
                        <div class="action" type="Highlight" plot="dojox_charting_widget_plot07" highlight="#FF8080"></div>
                      <div name="series" class="series" plot="dojox_charting_widget_plot07" store="$BTT_DOS('listFL', {mapOpt:{'value':{'x':function(s,i){return i;},'y':'@amount'}}}, 'ClusteredBars_bttStoreWidget')"></div>
                      <div name="series01" class="series" plot="dojox_charting_widget_plot07" store="$BTT_DOS('listFL', {mapOpt:{'value':{'x':function(s,i){return i;},'y':'@amount'}}}, 'ClusteredBars_bttStoreWidget')"></div>
                </div>
              </div>
            </div>
          </div>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="ClusteredBars_label" text="All properties in grid"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="ClusteredBars_label01" text="fill=black highlight=true"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="ClusteredBars_label05" text="fill=green highlight=true"/>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="ClusteredBars_panel04" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <div style="width:400px;height:300px;" id="ClusteredBars_dojox_charting_widget_Chart2D02" theme="dojox.charting.themes.Claro" dojoType="dojox.charting.widget.Chart2D">
                      <div class="axis" name="y" includeZero="false" vertical="true" min="10" max="20"></div>
                        <div class="plot" name="dojox_charting_widget_plot05" type="ClusteredBars" gap="5" labels="false" stroke="{'style':'Solid'}"></div>
                        <div class="action" type="Tooltip" plot="dojox_charting_widget_plot05"></div>
                        <div class="action" type="Highlight" plot="dojox_charting_widget_plot05" highlight="#000000"></div>
                      <div name="series" class="series" plot="dojox_charting_widget_plot05" store="$BTT_DOS('listFL', {mapOpt:{'value':{'x':function(s,i){return i;},'y':'@amount'}}}, 'ClusteredBars_bttStoreWidget')"></div>
                      <div name="series01" class="series" plot="dojox_charting_widget_plot05" store="$BTT_DOS('listFL', {mapOpt:{'value':{'x':function(s,i){return i;},'y':'@amount'}}}, 'ClusteredBars_bttStoreWidget')"></div>
                </div>
              </div>
            </div>
          </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="ClusteredBars_panel05" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <div style="width:400px;height:300px;" id="ClusteredBars_dojox_charting_widget_Chart2D04" theme="dojox.charting.themes.Claro" dojoType="dojox.charting.widget.Chart2D">
                        <div class="plot" name="dojox_charting_widget_plot09" type="ClusteredBars" gap="5" minBarSize="10" labels="false" stroke="{'style':'Solid'}"></div>
                        <div class="action" type="Tooltip" plot="dojox_charting_widget_plot09"></div>
                      <div name="series" class="series" plot="dojox_charting_widget_plot09" store="$BTT_DOS('listFL', {mapOpt:{'value':{'x':function(s,i){return i;},'y':'@amount'}}}, 'ClusteredBars_bttStoreWidget')"></div>
                      <div name="series01" class="series" plot="dojox_charting_widget_plot09" store="$BTT_DOS('listFL', {mapOpt:{'value':{'x':function(s,i){return i;},'y':'@amount'}}}, 'ClusteredBars_bttStoreWidget')"></div>
                </div>
              </div>
            </div>
          </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="ClusteredBars_panel06" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <div style="width:400px;height:300px;" id="ClusteredBars_dojox_charting_widget_Chart2D05" theme="dojox.charting.themes.Claro" dojoType="dojox.charting.widget.Chart2D">
                      <div class="axis" name="y" includeZero="false" vertical="true" min="10" max="20"></div>
                        <div class="plot" name="dojox_charting_widget_plot11" type="ClusteredBars" maxBarSize="50" labels="false" stroke="{'style':'Solid'}"></div>
                      <div name="series" class="series" plot="dojox_charting_widget_plot11" store="$BTT_DOS('listFL', {mapOpt:{'value':{'x':function(s,i){return i;},'y':'@amount'}}}, 'ClusteredBars_bttStoreWidget')"></div>
                      <div name="series01" class="series" plot="dojox_charting_widget_plot11" store="$BTT_DOS('listFL', {mapOpt:{'value':{'x':function(s,i){return i;},'y':'@amount'}}}, 'ClusteredBars_bttStoreWidget')"></div>
                </div>
              </div>
            </div>
          </div>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="ClusteredBars_label02" text="gap=5 minbarSize=0 higelight=true"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="ClusteredBars_label03" text="gap=5 minbarSize=10 tooltips=true"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="ClusteredBars_label04" text="gap=0 maxbarSize=50"/>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="ClusteredBars_panel07" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <div style="width:400px;height:300px;" id="ClusteredBars_dojox_charting_widget_Chart2D06" theme="dojox.charting.themes.Claro" dojoType="dojox.charting.widget.Chart2D">
                        <div class="plot" name="dojox_charting_widget_plot13" type="ClusteredBars" labels="false" animate="true" stroke="{'style':'Solid','color':'#80FF00','width':2}"></div>
                        <div class="action" type="Shake" plot="dojox_charting_widget_plot13"></div>
                      <div name="series" class="series" plot="dojox_charting_widget_plot13" store="$BTT_DOS('listFL', {mapOpt:{'value':{'x':function(s,i){return i;},'y':'@amount'}}}, 'ClusteredBars_bttStoreWidget')"></div>
                      <div name="series01" class="series" plot="dojox_charting_widget_plot13" store="$BTT_DOS('listFL', {mapOpt:{'value':{'x':function(s,i){return i;},'y':'@amount'}}}, 'ClusteredBars_bttStoreWidget')"></div>
                </div>
              </div>
            </div>
          </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="ClusteredBars_panel08" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <div style="width:400px;height:300px;" id="ClusteredBars_dojox_charting_widget_Chart2D07" theme="dojox.charting.themes.Claro" dojoType="dojox.charting.widget.Chart2D">
                        <div class="plot" name="dojox_charting_widget_plot15" type="ClusteredBars" labels="false" shadow="{dx:2,dy:2,width:2}" stroke="{'style':'Solid'}"></div>
                        <div class="action" type="Magnify" plot="dojox_charting_widget_plot15" scale="20"></div>
                      <div stroke="{'style':'ShortDash','color':'#FFFF80','width':1}" name="series" class="series" plot="dojox_charting_widget_plot15" store="$BTT_DOS('listFL', {mapOpt:{'value':{'x':function(s,i){return i;},'y':'@amount'}}}, 'ClusteredBars_bttStoreWidget')"></div>
                      <div name="series01" class="series" plot="dojox_charting_widget_plot15" store="$BTT_DOS('listFL', {mapOpt:{'value':{'x':function(s,i){return i;},'y':'@amount'}}}, 'ClusteredBars_bttStoreWidget')"></div>
                </div>
              </div>
            </div>
          </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="ClusteredBars_panel09" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <div style="width:400px;height:300px;" id="ClusteredBars_dojox_charting_widget_Chart2D08" theme="dojox.charting.themes.Claro" dojoType="dojox.charting.widget.Chart2D">
                        <div class="plot" name="dojox_charting_widget_plot01" type="ClusteredBars" labels="false" stroke="{'style':'Solid'}"></div>
                        <div class="action" type="MoveSlice" plot="dojox_charting_widget_plot01" scale="5" shift="5"></div>
                      <div name="series" class="series" plot="dojox_charting_widget_plot01" store="$BTT_DOS('listFL', {mapOpt:{'value':{'x':function(s,i){return i;},'y':'@amount'}}}, 'ClusteredBars_bttStoreWidget')"></div>
                      <div name="series01" class="series" plot="dojox_charting_widget_plot01" store="$BTT_DOS('listFL', {mapOpt:{'value':{'x':function(s,i){return i;},'y':'@amount'}}}, 'ClusteredBars_bttStoreWidget')"></div>
                </div>
              </div>
            </div>
          </div>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="ClusteredBars_label06" text="shake=true animate=true"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="ClusteredBars_label07" text="Magnify scale=20"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="ClusteredBars_label08" text="Move slice=true shift=5 scale=5"/>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="ClusteredBars_panel10" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <div style="width:400px;height:300px;" id="ClusteredBars_dojox_charting_widget_Chart2D09" theme="dojox.charting.themes.Claro" dojoType="dojox.charting.widget.Chart2D">
                      <div class="axis" name="y" includeZero="false" vertical="true" min="10" max="20"></div>
                        <div class="plot" name="dojox_charting_widget_plot02" type="ClusteredBars" labels="false" stroke="{'style':'Solid'}"></div>
                        <div class="action" type="Tooltip" plot="dojox_charting_widget_plot02"></div>
                      <div name="series" class="series" plot="dojox_charting_widget_plot02" store="$BTT_DOS('listFL', {mapOpt:{'value':{'tooltip':'@amount','x':function(s,i){return i;},'y':'@amount'}}}, 'ClusteredBars_bttStoreWidget')"></div>
                      <div name="series01" class="series" plot="dojox_charting_widget_plot02" store="$BTT_DOS('listFL', {mapOpt:{'value':{'x':function(s,i){return i;},'y':'@amount'}}}, 'ClusteredBars_bttStoreWidget')"></div>
                </div>
              </div>
            </div>
          </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="ClusteredBars_panel11" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <div style="width:400px;height:300px;" id="ClusteredBars_dojox_charting_widget_Chart2D10" theme="dojox.charting.themes.Claro" dojoType="dojox.charting.widget.Chart2D">
                        <div class="plot" name="dojox_charting_widget_plot04" type="ClusteredBars" labels="false" stroke="{'style':'Solid'}"></div>
                      <div stroke="{'color':'#80FF80','width':1}" name="series" class="series" plot="dojox_charting_widget_plot04" store="$BTT_DOS('listFL', {mapOpt:{'value':{'x':function(s,i){return i;},'y':'@amount'}}}, 'ClusteredBars_bttStoreWidget')"></div>
                      <div stroke="{'style':'ShortDash','color':'#FF0080','width':3}" name="series01" class="series" plot="dojox_charting_widget_plot04" store="$BTT_DOS('listFL', {mapOpt:{'value':{'x':function(s,i){return i;},'y':'@amount'}}}, 'ClusteredBars_bttStoreWidget')"></div>
                </div>
              </div>
            </div>
          </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="ClusteredBars_label09" text="mapping tooltips=null&amount"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="ClusteredBars_label10" text="stroke properties of two series"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
    </div>
  </div>

<!-- applet id="printApplet" name="printApplet" code="com.ibm.btt.print.applets.PrintrApplet" codebase="applets" archive="bttprint.jar,JSON4J.jar" style="width:0px; height:0px;"></applet-->
</body>
</html>