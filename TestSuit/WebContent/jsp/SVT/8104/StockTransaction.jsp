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
<!-- Generated from StockTransaction.xui by mashuai, on Fri Jan 17 15:17:27 CST 2014 -->
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

@import "css/G016/G016.css";

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
  <bttdojo:datasource id="StockTransaction_localContextStore" fieldSet="stockNumber"></bttdojo:datasource>
  <bttdojo:datasource id="StockTransaction_bttStoreWidget" fieldSet="ForAreaSmall,ForAreaBig" operation="WelComeBTTOp"></bttdojo:datasource>
<div style="width:100%;height:100%;;background-color:#181818;" id="StockTransaction_borderContainer" data-dojo-type="dijit.layout.BorderContainer">
  <div id="StockTransaction_borderContainer_topPanel" data-dojo-props="region:'top',ioArgs:{content:{dse_sessionId:'${dse_sessionId}'}}" style="text-align:left;height:39px;;background-color:#181818;" data-dojo-type="dijit.layout.ContentPane">
    <div style="width:100%;height:39px;" class="BTTTableStyle">
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <bttdojo:label id="StockTransaction_label" class=" fontWhiteColor" text="%nls.svt/stockNumber?[{\"p\":\"value\",\"t\":\"w\",\"id\":\"StockTransaction_text\",\"n\":\"number\"}]"/>
        </div>
      </div>
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <bttdojo:form id="StockTransaction_form" errorPage="SVT/8104/StockTransaction.jsp">
            <div class="BTTTableStyle">
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                    <div id="StockTransaction_panel" class="BTTTableStyle">
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:textbox id="StockTransaction_text" dataName="stockID"/>
                        </div>
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:button id="StockTransaction_button" type="button" text="submit"/>
                        </div>
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:label id="StockTransaction_label01" class=" fontWhiteColor" text="test dynamic flow:002351"/>
                        </div>
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:label id="StockTransaction_label02" class=" fontWhiteColor" text="default value:600220"/>
                        </div>
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        </div>
                      </div>
                    </div>
                </div>
              </div>
            </div>
        </bttdojo:form>
        </div>
      </div>
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        </div>
      </div>
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <bttdojo:label id="StockTransaction_label03" text="%nls.svt/stockName"/>
        </div>
      </div>
    </div>
</div>
  <div id="StockTransaction_borderContainer_centerPanel" data-dojo-props="region:'center',ioMethod:dojo.xhrPost,ioArgs:{content:{dse_sessionId:'${dse_sessionId}'}}" style="text-align:left;;background-color:#181818;" data-dojo-type="dijit.layout.ContentPane">
    <div style="width:100%;height:100%;" class="BTTTableStyle">
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="height:100%;vertical-align:middle;">
          <div id="StockTransaction_contentPaneStock" data-dojo-props="ioMethod:dojo.xhrPost,ioArgs:{content:{dse_sessionId:'${dse_sessionId}'}}" style="text-align:left;height:100%;" data-dojo-type="dijit.layout.ContentPane">
            <div style="width:100%;height:100%;" class="BTTTableStyle">
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:tabbedpane id="StockTransaction_tabbedPane">
                    <bttdojo:contentpane id="StockTransaction_ContentPane01" title="Tab01" iconClass="dijitEditorIcon dijitEditorIconBold">
                      <div class="BTTTableStyle">
                        <div class="BTTRowStyle">
                          <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                            <div style="width:412px;height:300px;" id="StockTransaction_dojox_charting_widget_Chart2D_copy" theme="dojox.charting.themes.ThreeD" dojoType="dojox.charting.widget.Chart2D">
                                  <div class="axis" name="x" includeZero="false" rotation="1"></div>
                                  <div class="axis" name="y" includeZero="false" vertical="true"></div>
                                    <div class="plot" name="dojox_charting_widget_plotLines" type="Lines" labels="false" animate="true" stroke="{'style':'Solid'}"></div>
                                    <div class="action" type="Highlight" plot="dojox_charting_widget_plotLines"></div>
                                    <div class="action" type="Shake" plot="dojox_charting_widget_plotLines"></div>
                                  <div stroke="{'color':'#FF0000'}" name="series05" class="series" plot="dojox_charting_widget_plotLines" fill="'#FF0000'" store="$BTT_DOS('ForAreaBig', {mapOpt:{'value':{'x':function(s,i){return i;},'y':'@BBK'}}}, 'StockTransaction_bttStoreWidget')"></div>
                                    <div class="plot" name="dojox_charting_widget_plotSmallArea_copy" type="Areas" labels="false" stroke="{'style':'Solid'}"></div>
                                  <div name="series01" class="series" plot="dojox_charting_widget_plotSmallArea_copy" fill="'#FFFFFF'" store="$BTT_DOS('ForAreaSmall', {mapOpt:{'value':{'x':'@x','y':function(s,i){return i;}}}}, 'StockTransaction_bttStoreWidget')"></div>
                                    <div class="plot" name="dojox_charting_widget_plotBigArea_copy" type="Areas" labels="false" stroke="{'style':'Solid'}"></div>
                                  <div name="series" class="series" plot="dojox_charting_widget_plotBigArea_copy" store="$BTT_DOS('ForAreaBig', {mapOpt:{'value':{'x':'@x','y':function(s,i){return i;}}}}, 'StockTransaction_bttStoreWidget')"></div>
                                    <div class="plot" name="dojox_charting_widget_plotHiddenHead_copy" type="Bars" minBarSize="27" labels="false" stroke="{'style':'Solid','color':'#FFFFFF'}"></div>
                                  <div name="series04" class="series" plot="dojox_charting_widget_plotHiddenHead_copy" fill="'#FFFFFF'" store="$BTT_DOS('ForAreaBig', {mapOpt:{'value':{'x':function(s,i){return i;},'y':'@hiddenHead'}}}, 'StockTransaction_bttStoreWidget')"></div>
                                    <div class="plot" name="dojox_charting_widget_plotTHead_copy" type="Bars" minBarSize="25" labels="false" stroke="{'style':'Solid'}"></div>
                                  <div name="series03" class="series" plot="dojox_charting_widget_plotTHead_copy" store="$BTT_DOS('ForAreaBig', {mapOpt:{'value':{'x':function(s,i){return i;},'y':'@head'}}}, 'StockTransaction_bttStoreWidget')"></div>
                                    <div class="plot" name="dojox_charting_widget_plotT_copy" type="Columns" minBarSize="25" labels="false" stroke="{'style':'Solid'}"></div>
                                  <div name="series02" class="series" plot="dojox_charting_widget_plotT_copy" fill="'#2D76BA'" store="$BTT_DOS('ForAreaBig', {mapOpt:{'value':{'x':function(s,i){return i;},'y':'@high'}}}, 'StockTransaction_bttStoreWidget')"></div>
                            </div>
                          </div>
                        </div>
                      </div>
                  </bttdojo:contentpane>
                    <bttdojo:contentpane id="StockTransaction_ContentPane02" title="Tab02" iconClass="dijitEditorIconSubscript dijitEditorIcon">
                      <div class="BTTTableStyle">
                      </div>
                  </bttdojo:contentpane>
                    <bttdojo:contentpane id="StockTransaction_ContentPane03" title="Tab03" iconClass=" dijitEditorIcon dijitEditorIconSuperscript">
                      <div class="BTTTableStyle">
                      </div>
                  </bttdojo:contentpane>
                </bttdojo:tabbedpane>
                </div>
              </div>
            </div>
        </div>
        </div>
      </div>
    </div>
</div>
  <div id="StockTransaction_borderContainer_bottomPanel" data-dojo-props="region:'bottom',ioArgs:{content:{dse_sessionId:'${dse_sessionId}'}}" style="text-align:left;;background-color:#181818;" data-dojo-type="dijit.layout.ContentPane">
    <div style="width:100%;" class="BTTTableStyle">
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <bttdojo:form id="StockTransaction_form01" errorPage="SVT/8104/StockTransaction.jsp">
            <div class="BTTTableStyle">
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <div id="StockTransaction_horizontalSlider" data-dojo-props="value:$BTT_DF('stockNumber', 'StockTransaction_localContextStore'),name:'stockNumber',discreteValues:5,maximum:50,minimum:10,style:{width:'400px'}" data-dojo-type="dijit.form.HorizontalSlider">
                    <ol data-dojo-props="container:'topDecoration',count:5,labels:['10 days','20 days','30 days','40 days','50 days'],labelStyle:'bottom:5px;width:100px;color:#8080FF;',style:{height:'1.2em'}" data-dojo-type="dijit.form.HorizontalRuleLabels">
                    </ol>
                    <div data-dojo-props="container:'topDecoration',count:5,style:{height:'5px'}" data-dojo-type="dijit.form.HorizontalRule">
                    </div>
                  </div>
                </div>
              </div>
            </div>
        </bttdojo:form>
        </div>
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        </div>
      </div>
    </div>
</div>
</div>

<div url="jsp/SVT/8104/StockTransaction.js" prefix="" dojoType="com.ibm.btt.event.ECALoader"></div>
<!-- applet id="printApplet" name="printApplet" code="com.ibm.btt.print.applets.PrintrApplet" codebase="applets" archive="bttprint.jar,JSON4J.jar" style="width:0px; height:0px;"></applet-->
</body>
</html>