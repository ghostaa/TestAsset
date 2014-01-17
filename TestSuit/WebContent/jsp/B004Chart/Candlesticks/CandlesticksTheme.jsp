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
<!-- Generated from CandlesticksTheme.xui by mashuai, on Fri Jan 17 15:16:04 CST 2014 -->
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
  <bttdojo:datasource id="CandlesticksTheme_bttStoreWidget" fieldSet="StockList" operation="StockOp"></bttdojo:datasource>
  <div id="CandlesticksTheme_panel" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <div style="width:400px;height:300px;" id="CandlesticksTheme_dojox_charting_widget_Chart2D01_copy04" theme="dojox.charting.themes.PlotKit.blue" dojoType="dojox.charting.widget.Chart2D">
                <div class="plot" name="dojox_charting_widget_plot01_copy04" type="Candlesticks" labels="false" stroke="{'style':'Solid'}"></div>
              <div name="series" class="series" plot="dojox_charting_widget_plot01_copy04" store="$BTT_DOS('StockList', {mapOpt:{'value':{'high':'@high','low':'@low','close':'@close','open':'@open'}}}, 'CandlesticksTheme_bttStoreWidget')"></div>
        </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <div style="width:400px;height:300px;" id="CandlesticksTheme_dojox_charting_widget_Chart2D01_copy03" theme="dojox.charting.themes.PlotKit.cyan" dojoType="dojox.charting.widget.Chart2D">
                <div class="plot" name="dojox_charting_widget_plot01_copy03" type="Candlesticks" labels="false" stroke="{'style':'Solid'}"></div>
              <div name="series" class="series" plot="dojox_charting_widget_plot01_copy03" store="$BTT_DOS('StockList', {mapOpt:{'value':{'high':'@high','low':'@low','close':'@close','open':'@open'}}}, 'CandlesticksTheme_bttStoreWidget')"></div>
        </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <div style="width:400px;height:300px;" id="CandlesticksTheme_dojox_charting_widget_Chart2D01_copy02" theme="dojox.charting.themes.PlotKit.green" dojoType="dojox.charting.widget.Chart2D">
                <div class="plot" name="dojox_charting_widget_plot01_copy02" type="Candlesticks" labels="false" stroke="{'style':'Solid'}"></div>
              <div name="series" class="series" plot="dojox_charting_widget_plot01_copy02" store="$BTT_DOS('StockList', {mapOpt:{'value':{'high':'@high','low':'@low','close':'@close','open':'@open'}}}, 'CandlesticksTheme_bttStoreWidget')"></div>
        </div>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="CandlesticksTheme_panel05" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <div style="width:400px;height:300px;" id="CandlesticksTheme_dojox_charting_widget_Chart2D01" theme="dojox.charting.themes.PlotKit.red" dojoType="dojox.charting.widget.Chart2D">
                        <div class="plot" name="dojox_charting_widget_plot01" type="Candlesticks" labels="false" stroke="{'style':'Solid'}"></div>
                      <div name="series" class="series" plot="dojox_charting_widget_plot01" store="$BTT_DOS('StockList', {mapOpt:{'value':{'high':'@high','low':'@low','close':'@close','open':'@open'}}}, 'CandlesticksTheme_bttStoreWidget')"></div>
                </div>
              </div>
            </div>
          </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <div style="width:400px;height:300px;" id="CandlesticksTheme_dojox_charting_widget_Chart2D01_copy" theme="dojox.charting.themes.PlotKit.purple" dojoType="dojox.charting.widget.Chart2D">
                <div class="plot" name="dojox_charting_widget_plot01_copy" type="Candlesticks" labels="false" stroke="{'style':'Solid'}"></div>
              <div name="series" class="series" plot="dojox_charting_widget_plot01_copy" store="$BTT_DOS('StockList', {mapOpt:{'value':{'high':'@high','low':'@low','close':'@close','open':'@open'}}}, 'CandlesticksTheme_bttStoreWidget')"></div>
        </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <div style="width:400px;height:300px;" id="CandlesticksTheme_dojox_charting_widget_Chart2D01_copy01" theme="dojox.charting.themes.PlotKit.orange" dojoType="dojox.charting.widget.Chart2D">
                <div class="plot" name="dojox_charting_widget_plot01_copy01" type="Candlesticks" labels="false" stroke="{'style':'Solid'}"></div>
              <div name="series" class="series" plot="dojox_charting_widget_plot01_copy01" store="$BTT_DOS('StockList', {mapOpt:{'value':{'high':'@high','low':'@low','close':'@close','open':'@open'}}}, 'CandlesticksTheme_bttStoreWidget')"></div>
        </div>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="CandlesticksTheme_panel04" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <div style="width:400px;height:300px;" id="CandlesticksTheme_dojox_charting_widget_Chart2D" theme="dojox.charting.themes.Chris" dojoType="dojox.charting.widget.Chart2D">
                        <div class="plot" name="dojox_charting_widget_plot" type="Candlesticks" markers="true" labels="false" stroke="{'style':'Solid'}"></div>
                        <div class="action" type="Tooltip" plot="dojox_charting_widget_plot"></div>
                        <div class="action" type="Highlight" plot="dojox_charting_widget_plot"></div>
                        <div class="action" type="Shake" plot="dojox_charting_widget_plot"></div>
                        <div class="action" type="Magnify" plot="dojox_charting_widget_plot" scale="1.5"></div>
                        <div class="action" type="MoveSlice" plot="dojox_charting_widget_plot" scale="1.5" shift="0"></div>
                      <div name="series" class="series" plot="dojox_charting_widget_plot" store="$BTT_DOS('StockList', {mapOpt:{'value':{'high':'@high','low':'@low','close':'@close','open':'@open'}}}, 'CandlesticksTheme_bttStoreWidget')"></div>
                </div>
              </div>
            </div>
          </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <div style="width:400px;height:300px;" id="CandlesticksTheme_dojox_charting_widget_Chart2D_copy" theme="dojox.charting.themes.Tom" dojoType="dojox.charting.widget.Chart2D">
                <div class="plot" name="dojox_charting_widget_plot_copy" type="Candlesticks" markers="true" labels="false" stroke="{'style':'Solid'}"></div>
                <div class="action" type="Tooltip" plot="dojox_charting_widget_plot_copy"></div>
                <div class="action" type="Highlight" plot="dojox_charting_widget_plot_copy"></div>
                <div class="action" type="Shake" plot="dojox_charting_widget_plot_copy"></div>
                <div class="action" type="Magnify" plot="dojox_charting_widget_plot_copy" scale="1.5"></div>
                <div class="action" type="MoveSlice" plot="dojox_charting_widget_plot_copy" scale="1.5" shift="0"></div>
              <div name="series" class="series" plot="dojox_charting_widget_plot_copy" store="$BTT_DOS('StockList', {mapOpt:{'value':{'high':'@high','low':'@low','close':'@close','open':'@open'}}}, 'CandlesticksTheme_bttStoreWidget')"></div>
        </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <div style="width:400px;height:300px;" id="CandlesticksTheme_dojox_charting_widget_Chart2D_copy01" theme="dojox.charting.themes.PrimaryColors" dojoType="dojox.charting.widget.Chart2D">
                <div class="plot" name="dojox_charting_widget_plot_copy01" type="Candlesticks" markers="true" labels="false" stroke="{'style':'Solid'}"></div>
                <div class="action" type="Tooltip" plot="dojox_charting_widget_plot_copy01"></div>
                <div class="action" type="Highlight" plot="dojox_charting_widget_plot_copy01"></div>
                <div class="action" type="Shake" plot="dojox_charting_widget_plot_copy01"></div>
                <div class="action" type="Magnify" plot="dojox_charting_widget_plot_copy01" scale="1.5"></div>
                <div class="action" type="MoveSlice" plot="dojox_charting_widget_plot_copy01" scale="1.5" shift="0"></div>
              <div name="series" class="series" plot="dojox_charting_widget_plot_copy01" store="$BTT_DOS('StockList', {mapOpt:{'value':{'high':'@high','low':'@low','close':'@close','open':'@open'}}}, 'CandlesticksTheme_bttStoreWidget')"></div>
        </div>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="CandlesticksTheme_panel06" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="CandlesticksTheme_label" text="theme=dojox.charting.themes.Chris"/>
              </div>
            </div>
          </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="CandlesticksTheme_panel08" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="CandlesticksTheme_label01" text="theme=dojox.charting.themes.Tom"/>
              </div>
            </div>
          </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="CandlesticksTheme_panel09" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="CandlesticksTheme_label02" text="theme=dojox.charting.themes.PrimaryColors"/>
              </div>
            </div>
          </div>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <div style="width:400px;height:300px;" id="CandlesticksTheme_dojox_charting_widget_Chart2D_copy01_copy" theme="dojox.charting.themes.Electric" dojoType="dojox.charting.widget.Chart2D">
                <div class="plot" name="dojox_charting_widget_plot_copy01_copy" type="Candlesticks" markers="true" labels="false" stroke="{'style':'Solid'}"></div>
                <div class="action" type="Tooltip" plot="dojox_charting_widget_plot_copy01_copy"></div>
                <div class="action" type="Highlight" plot="dojox_charting_widget_plot_copy01_copy"></div>
                <div class="action" type="Shake" plot="dojox_charting_widget_plot_copy01_copy"></div>
                <div class="action" type="Magnify" plot="dojox_charting_widget_plot_copy01_copy" scale="1.5"></div>
                <div class="action" type="MoveSlice" plot="dojox_charting_widget_plot_copy01_copy" scale="1.5" shift="0"></div>
              <div name="series" class="series" plot="dojox_charting_widget_plot_copy01_copy" store="$BTT_DOS('StockList', {mapOpt:{'value':{'high':'@high','low':'@low','close':'@close','open':'@open'}}}, 'CandlesticksTheme_bttStoreWidget')"></div>
        </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <div style="width:400px;height:300px;" id="CandlesticksTheme_dojox_charting_widget_Chart2D_copy01_copy01" theme="dojox.charting.themes.Charged" dojoType="dojox.charting.widget.Chart2D">
                <div class="plot" name="dojox_charting_widget_plot_copy01_copy01" type="Candlesticks" markers="true" labels="false" stroke="{'style':'Solid'}"></div>
                <div class="action" type="Tooltip" plot="dojox_charting_widget_plot_copy01_copy01"></div>
                <div class="action" type="Highlight" plot="dojox_charting_widget_plot_copy01_copy01"></div>
                <div class="action" type="Shake" plot="dojox_charting_widget_plot_copy01_copy01"></div>
                <div class="action" type="Magnify" plot="dojox_charting_widget_plot_copy01_copy01" scale="1.5"></div>
                <div class="action" type="MoveSlice" plot="dojox_charting_widget_plot_copy01_copy01" scale="1.5" shift="0"></div>
              <div name="series" class="series" plot="dojox_charting_widget_plot_copy01_copy01" store="$BTT_DOS('StockList', {mapOpt:{'value':{'high':'@high','low':'@low','close':'@close','open':'@open'}}}, 'CandlesticksTheme_bttStoreWidget')"></div>
        </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <div style="width:400px;height:300px;" id="CandlesticksTheme_dojox_charting_widget_Chart2D_copy01_copy02" theme="dojox.charting.themes.Renkoo" dojoType="dojox.charting.widget.Chart2D">
                <div class="plot" name="dojox_charting_widget_plot_copy01_copy02" type="Candlesticks" markers="true" labels="false" stroke="{'style':'Solid'}"></div>
                <div class="action" type="Tooltip" plot="dojox_charting_widget_plot_copy01_copy02"></div>
                <div class="action" type="Highlight" plot="dojox_charting_widget_plot_copy01_copy02"></div>
                <div class="action" type="Shake" plot="dojox_charting_widget_plot_copy01_copy02"></div>
                <div class="action" type="Magnify" plot="dojox_charting_widget_plot_copy01_copy02" scale="1.5"></div>
                <div class="action" type="MoveSlice" plot="dojox_charting_widget_plot_copy01_copy02" scale="1.5" shift="0"></div>
              <div name="series" class="series" plot="dojox_charting_widget_plot_copy01_copy02" store="$BTT_DOS('StockList', {mapOpt:{'value':{'high':'@high','low':'@low','close':'@close','open':'@open'}}}, 'CandlesticksTheme_bttStoreWidget')"></div>
        </div>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="CandlesticksTheme_panel13" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="CandlesticksTheme_label03" text="theme=dojox.charting.themes.Electric"/>
              </div>
            </div>
          </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="CandlesticksTheme_panel14" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="CandlesticksTheme_label04" text="theme=dojox.charting.themes.Charged"/>
              </div>
            </div>
          </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="CandlesticksTheme_panel15" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="CandlesticksTheme_label05" text="theme=dojox.charting.themes.Renkoo"/>
              </div>
            </div>
          </div>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <div style="width:400px;height:300px;" id="CandlesticksTheme_dojox_charting_widget_Chart2D_copy01_copy02_copy" theme="dojox.charting.themes.Adobebricks" dojoType="dojox.charting.widget.Chart2D">
                <div class="plot" name="dojox_charting_widget_plot_copy01_copy02_copy" type="Candlesticks" markers="true" labels="false" stroke="{'style':'Solid'}"></div>
                <div class="action" type="Tooltip" plot="dojox_charting_widget_plot_copy01_copy02_copy"></div>
                <div class="action" type="Highlight" plot="dojox_charting_widget_plot_copy01_copy02_copy"></div>
                <div class="action" type="Shake" plot="dojox_charting_widget_plot_copy01_copy02_copy"></div>
                <div class="action" type="Magnify" plot="dojox_charting_widget_plot_copy01_copy02_copy" scale="1.5"></div>
                <div class="action" type="MoveSlice" plot="dojox_charting_widget_plot_copy01_copy02_copy" scale="1.5" shift="0"></div>
              <div name="series" class="series" plot="dojox_charting_widget_plot_copy01_copy02_copy" store="$BTT_DOS('StockList', {mapOpt:{'value':{'high':'@high','low':'@low','close':'@close','open':'@open'}}}, 'CandlesticksTheme_bttStoreWidget')"></div>
        </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <div style="width:400px;height:300px;" id="CandlesticksTheme_dojox_charting_widget_Chart2D_copy01_copy02_copy01" theme="dojox.charting.themes.Algae" dojoType="dojox.charting.widget.Chart2D">
                <div class="plot" name="dojox_charting_widget_plot_copy01_copy02_copy01" type="Candlesticks" markers="true" labels="false" stroke="{'style':'Solid'}"></div>
                <div class="action" type="Tooltip" plot="dojox_charting_widget_plot_copy01_copy02_copy01"></div>
                <div class="action" type="Highlight" plot="dojox_charting_widget_plot_copy01_copy02_copy01"></div>
                <div class="action" type="Shake" plot="dojox_charting_widget_plot_copy01_copy02_copy01"></div>
                <div class="action" type="Magnify" plot="dojox_charting_widget_plot_copy01_copy02_copy01" scale="1.5"></div>
                <div class="action" type="MoveSlice" plot="dojox_charting_widget_plot_copy01_copy02_copy01" scale="1.5" shift="0"></div>
              <div name="series" class="series" plot="dojox_charting_widget_plot_copy01_copy02_copy01" store="$BTT_DOS('StockList', {mapOpt:{'value':{'high':'@high','low':'@low','close':'@close','open':'@open'}}}, 'CandlesticksTheme_bttStoreWidget')"></div>
        </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <div style="width:400px;height:300px;" id="CandlesticksTheme_dojox_charting_widget_Chart2D_copy01_copy02_copy02" theme="dojox.charting.themes.Bahamation" dojoType="dojox.charting.widget.Chart2D">
                <div class="plot" name="dojox_charting_widget_plot_copy01_copy02_copy02" type="Candlesticks" markers="true" labels="false" stroke="{'style':'Solid'}"></div>
                <div class="action" type="Tooltip" plot="dojox_charting_widget_plot_copy01_copy02_copy02"></div>
                <div class="action" type="Highlight" plot="dojox_charting_widget_plot_copy01_copy02_copy02"></div>
                <div class="action" type="Shake" plot="dojox_charting_widget_plot_copy01_copy02_copy02"></div>
                <div class="action" type="Magnify" plot="dojox_charting_widget_plot_copy01_copy02_copy02" scale="1.5"></div>
                <div class="action" type="MoveSlice" plot="dojox_charting_widget_plot_copy01_copy02_copy02" scale="1.5" shift="0"></div>
              <div name="series" class="series" plot="dojox_charting_widget_plot_copy01_copy02_copy02" store="$BTT_DOS('StockList', {mapOpt:{'value':{'high':'@high','low':'@low','close':'@close','open':'@open'}}}, 'CandlesticksTheme_bttStoreWidget')"></div>
        </div>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="CandlesticksTheme_panel19" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="CandlesticksTheme_label06" text="theme=dojox.charting.themes.Adobebricks"/>
              </div>
            </div>
          </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="CandlesticksTheme_panel22" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="CandlesticksTheme_label07" text="theme=dojox.charting.themes.Algae"/>
              </div>
            </div>
          </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="CandlesticksTheme_panel23" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="CandlesticksTheme_label08" text="theme=dojox.charting.themes.Bahamation"/>
              </div>
            </div>
          </div>
      </div>
    </div>
  </div>

<!-- applet id="printApplet" name="printApplet" code="com.ibm.btt.print.applets.PrintrApplet" codebase="applets" archive="bttprint.jar,JSON4J.jar" style="width:0px; height:0px;"></applet-->
</body>
</html>