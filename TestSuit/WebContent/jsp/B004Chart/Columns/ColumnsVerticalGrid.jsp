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
<!-- Generated from ColumnsVerticalGrid.xui by mashuai, on  -->
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
  <bttdojo:datasource id="ColumnsVerticalGrid_bttStoreWidget" fieldSet="listFL" operation="TableListOp"></bttdojo:datasource>
  <div id="ColumnsVerticalGrid_panel" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="ColumnsVerticalGrid_panel01" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <div style="width:400px;height:300px;" id="ColumnsVerticalGrid_dojox_charting_widget_Chart2D" theme="dojox.charting.themes.Claro" y_titleFontColor="#00FF00" dojoType="dojox.charting.widget.Chart2D">
                      <div class="axis" name="y" includeZero="true" vertical="true" title="hMajorLines=true,hMinorLines=false" titleFontColor="#00FF00"></div>
                      <div class="plot" type="Grid" name="grid"></div>
                        <div class="plot" name="dojox_charting_widget_plot" type="Columns" labels="false" stroke="{'style':'Solid'}"></div>
                      <div name="series" class="series" plot="dojox_charting_widget_plot" store="$BTT_DOS('listFL', {mapOpt:{'value':{'x':function(s,i){return i;},'y':'@amount'}}}, 'ColumnsVerticalGrid_bttStoreWidget')"></div>
                </div>
              </div>
            </div>
          </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="ColumnsVerticalGrid_panel02" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <div style="width:400px;height:300px;" id="ColumnsVerticalGrid_dojox_charting_widget_Chart2D01" theme="dojox.charting.themes.Claro" hMajorLines="false" hMinorLines="true" vMajorLines="false" vMinorLines="true" y_titleFontColor="#FF8040" dojoType="dojox.charting.widget.Chart2D">
                      <div class="axis" name="y" includeZero="true" vertical="true" title="hMajorLines=false,hMinorLines=true" titleFontColor="#FF8040"></div>
                      <div class="plot" type="Grid" name="grid" hMajorLines="false" hMinorLines="true" vMajorLines="false" vMinorLines="true"></div>
                        <div class="plot" name="dojox_charting_widget_plot01" type="Columns" labels="false" stroke="{'style':'Solid'}"></div>
                      <div name="series" class="series" plot="dojox_charting_widget_plot01" store="$BTT_DOS('listFL', {mapOpt:{'value':{'x':function(s,i){return i;},'y':'@amount'}}}, 'ColumnsVerticalGrid_bttStoreWidget')"></div>
                </div>
              </div>
            </div>
          </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="ColumnsVerticalGrid_panel03" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <div style="width:400px;height:300px;" id="ColumnsVerticalGrid_dojox_charting_widget_Chart2D02" theme="dojox.charting.themes.Claro" hMinorLines="true" dojoType="dojox.charting.widget.Chart2D">
                      <div class="axis" name="y" includeZero="true" vertical="true" title="hMajorLines=true,hMinorLines=true"></div>
                      <div class="plot" type="Grid" name="grid" hMinorLines="true"></div>
                        <div class="plot" name="dojox_charting_widget_plot02" type="Columns" labels="false" stroke="{'style':'Solid'}"></div>
                      <div name="series" class="series" plot="dojox_charting_widget_plot02" store="$BTT_DOS('listFL', {mapOpt:{'value':{'x':function(s,i){return i;},'y':'@amount'}}}, 'ColumnsVerticalGrid_bttStoreWidget')"></div>
                </div>
              </div>
            </div>
          </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="ColumnsVerticalGrid_panel04" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <div id="ColumnsVerticalGrid_panel05" class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <div style="width:400px;height:300px;" id="ColumnsVerticalGrid_dojox_charting_widget_Chart2D03" theme="dojox.charting.themes.Claro" vMajorLines="false" dojoType="dojox.charting.widget.Chart2D">
                              <div class="axis" name="y" includeZero="true" vertical="true" title="hMajorLines=false,hMinorLines=false"></div>
                              <div class="plot" type="Grid" name="grid" vMajorLines="false"></div>
                                <div class="plot" name="dojox_charting_widget_plot03" type="Columns" labels="false" stroke="{'style':'Solid'}"></div>
                              <div name="series" class="series" plot="dojox_charting_widget_plot03" store="$BTT_DOS('listFL', {mapOpt:{'value':{'x':function(s,i){return i;},'y':'@amount'}}}, 'ColumnsVerticalGrid_bttStoreWidget')"></div>
                        </div>
                      </div>
                    </div>
                  </div>
              </div>
            </div>
          </div>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="ColumnsVerticalGrid_panel07" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <div style="width:400px;height:300px;" id="ColumnsVerticalGrid_dojox_charting_widget_Chart2D04" theme="dojox.charting.themes.Claro" hMajorLines="false" vMajorLines="false" dojoType="dojox.charting.widget.Chart2D">
                      <div class="axis" name="y" includeZero="true" vertical="true" majorTickStep="500" minorTickStep="100"></div>
                        <div class="plot" name="dojox_charting_widget_plot04" type="Columns" labels="false" stroke="{'style':'Solid'}"></div>
                      <div name="series" class="series" plot="dojox_charting_widget_plot04" store="$BTT_DOS('listFL', {mapOpt:{'value':{'x':function(s,i){return i;},'y':'@amount'}}}, 'ColumnsVerticalGrid_bttStoreWidget')"></div>
                </div>
              </div>
            </div>
          </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="ColumnsVerticalGrid_panel08" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <div style="width:400px;height:300px;" id="ColumnsVerticalGrid_dojox_charting_widget_Chart2D05" theme="dojox.charting.themes.Claro" dojoType="dojox.charting.widget.Chart2D">
                      <div class="axis" name="y" includeZero="false" vertical="true" min="3000" max="8000" minorLabels="true" microTicks="true"></div>
                        <div class="plot" name="dojox_charting_widget_plot05" type="Columns" labels="false" stroke="{'style':'Solid'}"></div>
                      <div name="series" class="series" plot="dojox_charting_widget_plot05" store="$BTT_DOS('listFL', {mapOpt:{'value':{'x':function(s,i){return i;},'y':'@amount'}}}, 'ColumnsVerticalGrid_bttStoreWidget')"></div>
                </div>
              </div>
            </div>
          </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="ColumnsVerticalGrid_panel09" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <div style="width:400px;height:300px;" id="ColumnsVerticalGrid_dojox_charting_widget_Chart2D06" theme="dojox.charting.themes.Claro" dojoType="dojox.charting.widget.Chart2D">
                      <div class="axis" name="y" includeZero="false" vertical="true" min="4000" max="5000" minorTicks="false"></div>
                        <div class="plot" name="dojox_charting_widget_plot06" type="Columns" labels="false" stroke="{'style':'Solid'}"></div>
                      <div name="series" class="series" plot="dojox_charting_widget_plot06" store="$BTT_DOS('listFL', {mapOpt:{'value':{'x':function(s,i){return i;},'y':'@amount'}}}, 'ColumnsVerticalGrid_bttStoreWidget')"></div>
                </div>
              </div>
            </div>
          </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="ColumnsVerticalGrid_panel06" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <div style="width:400px;height:300px;" id="ColumnsVerticalGrid_dojox_charting_widget_Chart2D07" theme="dojox.charting.themes.Claro" dojoType="dojox.charting.widget.Chart2D">
                      <div class="axis" name="y" includeZero="false" vertical="true" min="4000" max="5000" minorLabels="true" minorTickStep="50" microTicks="true" microTickStep="10"></div>
                        <div class="plot" name="dojox_charting_widget_plot07" type="Columns" labels="false" stroke="{'style':'Solid'}"></div>
                      <div name="series" class="series" plot="dojox_charting_widget_plot07" store="$BTT_DOS('listFL', {mapOpt:{'value':{'x':function(s,i){return i;},'y':'@amount'}}}, 'ColumnsVerticalGrid_bttStoreWidget')"></div>
                </div>
              </div>
            </div>
          </div>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="ColumnsVerticalGrid_label" text="major step=500  minor step=100"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="ColumnsVerticalGrid_label01" text="major,minor and micro ticks =true.min=3000,max=8000"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="ColumnsVerticalGrid_label02" text="Microticks ,Minorticks=false Majortocks=true"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="ColumnsVerticalGrid_label03" text="minortickstep=50 microtickstep=10"/>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="ColumnsVerticalGrid_label04" text="major and minor label=true"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="ColumnsVerticalGrid_panel10" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <div style="width:400px;height:300px;" id="ColumnsVerticalGrid_dojox_charting_widget_Chart2D08" theme="dojox.charting.themes.Claro" dojoType="dojox.charting.widget.Chart2D">
                      <div class="axis" name="y" includeZero="false" vertical="true" min="2000" max="6000" minorLabels="true" microTicks="true" maxLabelSize="15"></div>
                        <div class="plot" name="dojox_charting_widget_plot08" type="Columns" labels="false" stroke="{'style':'Solid'}"></div>
                      <div name="series" class="series" plot="dojox_charting_widget_plot08" store="$BTT_DOS('listFL', {mapOpt:{'value':{'x':function(s,i){return i;},'y':'@amount'}}}, 'ColumnsVerticalGrid_bttStoreWidget')"></div>
                </div>
              </div>
            </div>
          </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="ColumnsVerticalGrid_panel11" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <div style="width:400px;height:300px;" id="ColumnsVerticalGrid_dojox_charting_widget_Chart2D09" theme="dojox.charting.themes.Claro" dojoType="dojox.charting.widget.Chart2D">
                      <div class="axis" name="y" includeZero="true" vertical="true" trailingSymbol="'*'" maxLabelSize="5"></div>
                        <div class="plot" name="dojox_charting_widget_plot09" type="Columns" labels="false" stroke="{'style':'Solid'}"></div>
                      <div name="series" class="series" plot="dojox_charting_widget_plot09" store="$BTT_DOS('listFL', {mapOpt:{'value':{'x':function(s,i){return i;},'y':'@amount'}}}, 'ColumnsVerticalGrid_bttStoreWidget')"></div>
                </div>
              </div>
            </div>
          </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="ColumnsVerticalGrid_panel12" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <div style="width:400px;height:300px;" id="ColumnsVerticalGrid_dojox_charting_widget_Chart2D10" theme="dojox.charting.themes.Claro" dojoType="dojox.charting.widget.Chart2D">
                      <div class="axis" name="y" includeZero="false" vertical="true" maxLabelCharCount="2"></div>
                        <div class="plot" name="dojox_charting_widget_plot10" type="Columns" labels="false" stroke="{'style':'Solid'}"></div>
                      <div name="series" class="series" plot="dojox_charting_widget_plot10" store="$BTT_DOS('listFL', {mapOpt:{'value':{'x':function(s,i){return i;},'y':'@amount'}}}, 'ColumnsVerticalGrid_bttStoreWidget')"></div>
                </div>
              </div>
            </div>
          </div>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="ColumnsVerticalGrid_panel13" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <div style="width:400px;height:300px;" id="ColumnsVerticalGrid_dojox_charting_widget_Chart2D11" theme="dojox.charting.themes.Claro" dojoType="dojox.charting.widget.Chart2D">
                      <div class="axis" name="y" includeZero="false" vertical="true" title="somethingY" titleOrientation="away"></div>
                        <div class="plot" name="dojox_charting_widget_plot11" type="Columns" labels="false" stroke="{'style':'Solid'}"></div>
                      <div name="series" class="series" plot="dojox_charting_widget_plot11" store="$BTT_DOS('listFL', {mapOpt:{'value':{'x':function(s,i){return i;},'y':'@amount'}}}, 'ColumnsVerticalGrid_bttStoreWidget')"></div>
                </div>
              </div>
            </div>
          </div>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="ColumnsVerticalGrid_label05" text="maxLabelSize=15px(defect)"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="ColumnsVerticalGrid_label06" text="trailingSymbol=\"*\""/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="ColumnsVerticalGrid_label07" text="maxLabelCharCount=2"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="ColumnsVerticalGrid_label08" text="titleOriental=away"/>
      </div>
    </div>
  </div>

<!-- applet id="printApplet" name="printApplet" code="com.ibm.btt.print.applets.PrintrApplet" codebase="applets" archive="bttprint.jar,JSON4J.jar" style="width:0px; height:0px;"></applet-->
</body>
</html>