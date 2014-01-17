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
<!-- Generated from TestTable.xui by mashuai, on Fri Jan 17 15:17:34 CST 2014 -->
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
<script type="text/javascript" data-btt-eca="true" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/TestTable.js"> </script>
<%request.setAttribute("dse_sessionId", session.getId()); %>
<bttdojo:tabbedpane id="TestTable_tabbedPane">
  <bttdojo:contentpane id="TestTable_ContentPane01" title="The_First">
    <div class="BTTTableStyle">
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <bttdojo:label id="TestTable_label" text="The Size is Fixed:200*100-->hidden_vScroll&&hScroll"/>
        </div>
      </div>
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="hScrollbarHidden vScrollbarHidden">          <bttdojo:table id="TestTable_table" dataName="DataName" dataNameForList="aList" width="200px" height="100px" isPageable="false">
            <bttdojo:column level="1" rowSpan="1" align="left" width="25%" colSpan="1" hidden="false" headerHAlign="left" text="25%" dataName="index" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
            <bttdojo:column level="1" rowSpan="1" align="left" width="25%" colSpan="1" hidden="false" headerHAlign="left" text="25%" dataName="cardNo" noresize="false" repeat="true" id="columnId1" headerVAlign="left"/>
            <bttdojo:column level="1" rowSpan="1" align="left" width="25%" colSpan="1" hidden="false" headerHAlign="left" text="25%" dataName="amount" noresize="false" repeat="true" id="columnId2" headerVAlign="left"/>
            <bttdojo:column level="1" rowSpan="1" widget="Image" align="left" width="25%" colSpan="1" hidden="false" headerHAlign="left" text="25%" dataName="ImageField" noresize="false" repeat="true" id="columnId3" headerVAlign="left"/>
          </bttdojo:table>
</div>        </div>
      </div>
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <bttdojo:label id="TestTable_label02" text="The Size is Fixed:400*100 First set 100px befroe 60%-->Auto_vScroll&&hScroll"/>
        </div>
      </div>
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="hScrollbarAuto vScrollbarAuto">          <bttdojo:table id="TestTable_table04" dataNameForList="aList" width="400px" height="200px" isPageable="false">
            <bttdojo:column level="1" rowSpan="1" align="left" width="60%" colSpan="1" hidden="false" headerHAlign="left" text="60%" dataName="index" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
            <bttdojo:column level="1" rowSpan="1" align="left" width="60%" colSpan="1" hidden="false" headerHAlign="left" text="60%" dataName="cardNo" noresize="false" repeat="true" id="columnId1" headerVAlign="left"/>
            <bttdojo:column level="1" rowSpan="1" align="left" width="100" colSpan="1" hidden="false" headerHAlign="left" text="100px" dataName="amount" noresize="false" repeat="true" id="columnId2" headerVAlign="left"/>
            <bttdojo:column level="1" rowSpan="1" widget="Image" align="left" width="100" colSpan="1" hidden="false" headerHAlign="left" text="100px" dataName="ImageField" noresize="false" repeat="true" id="columnId3" headerVAlign="left"/>
          </bttdojo:table>
</div>        </div>
      </div>
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <bttdojo:label id="TestTable_label11" text="The Size is Fixed:400*100 column is 100px,the rest is 60%-->Auto_vScroll&&hScroll"/>
        </div>
      </div>
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="hScrollbarAuto vScrollbarAuto">          <bttdojo:table id="TestTable_table09" dataNameForList="aList" width="400px" height="200px" isPageable="false">
            <bttdojo:column level="1" rowSpan="1" align="left" width="60%" colSpan="1" hidden="false" headerHAlign="left" text="60%" dataName="index" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
            <bttdojo:column level="1" rowSpan="1" align="left" width="60%" colSpan="1" hidden="false" headerHAlign="left" text="60%" dataName="cardNo" noresize="false" repeat="true" id="columnId1" headerVAlign="left"/>
            <bttdojo:column level="1" rowSpan="1" widget="Image" align="left" width="100" colSpan="1" hidden="false" headerHAlign="left" text="100px" dataName="ImageField" noresize="false" repeat="true" id="columnId2" headerVAlign="left"/>
            <bttdojo:column level="1" rowSpan="1" align="left" width="0" colSpan="1" hidden="false" headerHAlign="left" text="0" dataName="Size" noresize="false" repeat="true" id="columnId3" headerVAlign="left"/>
          </bttdojo:table>
</div>        </div>
      </div>
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        </div>
      </div>
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        </div>
      </div>
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <bttdojo:label id="TestTable_label04" text="The Size is Fixed:400*100 First set 60% befroe 0px-->Scroll_vScroll&&hScroll"/>
        </div>
      </div>
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="hScrollbarScroll vScrollbarScroll">          <bttdojo:table id="TestTable_table06" dataNameForList="aList" width="400px" height="100px" isPageable="false">
            <bttdojo:column level="1" rowSpan="1" align="left" width="60%" colSpan="1" hidden="false" headerHAlign="left" text="60% The Size is Fixed:400*100 First set 100px befroe 60%-->Auto_vScroll&&hScroll" dataName="index" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
            <bttdojo:column level="1" rowSpan="1" align="left" width="60%" colSpan="1" hidden="false" headerHAlign="left" text="60%" dataName="cardNo" noresize="false" repeat="true" id="columnId1" headerVAlign="left"/>
            <bttdojo:column level="1" rowSpan="1" align="left" width="0" colSpan="1" hidden="false" headerHAlign="left" text="0px" dataName="amount" noresize="false" repeat="true" id="columnId2" headerVAlign="left"/>
            <bttdojo:column level="1" rowSpan="1" widget="Image" align="left" width="0" colSpan="1" hidden="false" headerHAlign="left" text="0px" dataName="ImageField" noresize="false" repeat="true" id="columnId3" headerVAlign="left"/>
          </bttdojo:table>
</div>        </div>
      </div>
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <bttdojo:label id="TestTable_label03" text="The Size is Fixed:400*100 All column is 60percent size in table-->Scroll_vScroll&&hScroll"/>
        </div>
      </div>
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="hScrollbarScroll vScrollbarScroll">          <bttdojo:table id="TestTable_table05" dataNameForList="aList" frozenColumnNum="2" width="400px" height="100px" isPageable="false">
            <bttdojo:column level="1" rowSpan="1" align="left" width="60%" colSpan="1" hidden="false" headerHAlign="left" text="60%" dataName="index" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
            <bttdojo:column level="1" rowSpan="1" align="left" width="60%" colSpan="1" hidden="false" headerHAlign="left" text="60%" dataName="cardNo" noresize="false" repeat="true" id="columnId1" headerVAlign="left"/>
            <bttdojo:column level="1" rowSpan="1" align="left" width="60%" colSpan="1" hidden="false" headerHAlign="left" text="60%" dataName="amount" noresize="false" repeat="true" id="columnId2" headerVAlign="left"/>
            <bttdojo:column level="1" rowSpan="1" widget="Image" align="left" width="60%" colSpan="1" hidden="false" headerHAlign="left" text="60%" dataName="ImageField" noresize="false" repeat="true" id="columnId3" headerVAlign="left"/>
          </bttdojo:table>
</div>        </div>
      </div>
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <bttdojo:label id="TestTable_label01" text="The Size is Fixed_Size 240*100.Hidden_Column"/>
        </div>
      </div>
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="hScrollbarHidden vScrollbarHidden">          <bttdojo:table id="TestTable_table03" dataNameForList="aList" width="240px" height="100px" isPageable="false">
            <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="column0" dataName="index" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
            <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="column1" dataName="cardNo" noresize="false" repeat="true" id="columnId1" headerVAlign="left"/>
            <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="column2" dataName="amount" noresize="false" repeat="true" id="columnId2" headerVAlign="left"/>
            <bttdojo:column level="1" rowSpan="1" widget="Image" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="column3" dataName="ImageField" noresize="false" repeat="true" id="columnId3" headerVAlign="left"/>
          </bttdojo:table>
</div>        </div>
      </div>
    </div>
</bttdojo:contentpane>
  <bttdojo:contentpane id="TestTable_ContentPane02" title="The_Second">
    <div class="BTTTableStyle">
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <bttdojo:label id="TestTable_label06" text="All column is 0px except the last column is 50% and the table Width is Fill and Height"/>
        </div>
      </div>
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:100%;height:auto;" class="hScrollbarScroll vScrollbarScroll">          <bttdojo:table id="TestTable_table01" dataNameForList="aList" width="100%" height="100px" isPageable="false">
            <bttdojo:column level="1" rowSpan="1" align="left" width="0" colSpan="1" hidden="false" headerHAlign="left" text="0" dataName="index" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
            <bttdojo:column level="1" rowSpan="1" align="left" width="0" colSpan="1" hidden="false" headerHAlign="left" text="0" dataName="cardNo" noresize="false" repeat="true" id="columnId1" headerVAlign="left"/>
            <bttdojo:column level="1" rowSpan="1" align="left" width="0" colSpan="1" hidden="false" headerHAlign="left" text="0" dataName="amount" noresize="false" repeat="true" id="columnId2" headerVAlign="left"/>
            <bttdojo:column level="1" rowSpan="1" widget="Image" align="left" width="50%" colSpan="1" hidden="false" headerHAlign="left" text="50%" dataName="ImageField" noresize="false" repeat="true" id="columnId3" headerVAlign="left"/>
          </bttdojo:table>
</div>        </div>
      </div>
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <bttdojo:label id="TestTable_label07" text="All column is 0px except the last column is 100px and the table Width is 61 percent and Height"/>
        </div>
      </div>
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:61%;" class="hScrollbarScroll vScrollbarScroll">          <bttdojo:table id="TestTable_table02" dataNameForList="aList" width="100%" isPageable="false">
            <bttdojo:column level="1" rowSpan="1" align="left" width="0" colSpan="1" hidden="false" headerHAlign="left" text="0" dataName="index" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
            <bttdojo:column level="1" rowSpan="1" align="left" width="0" colSpan="1" hidden="false" headerHAlign="left" text="0" dataName="cardNo" noresize="false" repeat="true" id="columnId1" headerVAlign="left"/>
            <bttdojo:column level="1" rowSpan="1" align="left" width="0" colSpan="1" hidden="false" headerHAlign="left" text="0" dataName="amount" noresize="false" repeat="true" id="columnId2" headerVAlign="left"/>
            <bttdojo:column level="1" rowSpan="1" widget="Image" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="100" dataName="ImageField" noresize="false" repeat="true" id="columnId3" headerVAlign="left"/>
          </bttdojo:table>
</div>        </div>
      </div>
    </div>
</bttdojo:contentpane>
  <bttdojo:contentpane id="TestTable_ContentPane03" title="The_Third">
    <div class="BTTTableStyle">
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <bttdojo:label id="TestTable_label08" text="The Table Relative is 75%,First is 50px, Second is 50%,Third is 300px and Forth is 80%"/>
        </div>
      </div>
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:75%;" class="hScrollbarHidden vScrollbarHidden">          <bttdojo:table id="TestTable_table07" dataNameForList="aList" width="100%" isPageable="false">
            <bttdojo:column level="1" rowSpan="1" align="left" width="50" colSpan="1" hidden="false" headerHAlign="left" text="column0" dataName="index" noresize="false" repeat="true" id="0" headerVAlign="left"/>
            <bttdojo:column level="1" rowSpan="1" align="left" width="50%" colSpan="1" hidden="false" headerHAlign="left" text="column1" dataName="cardNo" noresize="false" repeat="true" id="columnId1" headerVAlign="left"/>
            <bttdojo:column level="1" rowSpan="1" align="left" width="300" colSpan="1" hidden="false" headerHAlign="left" text="column2" dataName="amount" noresize="false" repeat="true" id="2" headerVAlign="left"/>
            <bttdojo:column level="1" rowSpan="1" widget="Image" align="left" width="80%" colSpan="1" hidden="false" headerHAlign="left" text="column3" dataName="ImageField" noresize="false" repeat="true" id="columnId3" headerVAlign="left"/>
          </bttdojo:table>
</div>        </div>
      </div>
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <bttdojo:label id="TestTable_Label01" text="The Table is 400px,First is 50%,Second is 450px,Third is 120% and Forth is 200px"/>
        </div>
      </div>
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <bttdojo:table id="TestTable_table08" dataNameForList="aList" width="400px" height="200px" isPageable="false">
            <bttdojo:column level="1" rowSpan="1" align="left" width="50%" colSpan="1" hidden="false" headerHAlign="left" text="50%" dataName="index" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
            <bttdojo:column level="1" rowSpan="1" align="left" width="450" colSpan="1" hidden="false" headerHAlign="left" text="the Column is 450px" dataName="cardNo" noresize="false" repeat="true" id="columnId1" headerVAlign="left"/>
            <bttdojo:column level="1" rowSpan="1" widget="Image" align="left" width="200" colSpan="1" hidden="false" headerHAlign="left" text="200px" dataName="ImageField" noresize="false" repeat="true" id="columnId3" headerVAlign="left"/>
            <bttdojo:column level="1" rowSpan="1" align="left" width="120%" colSpan="1" hidden="false" headerHAlign="left" text="120%" dataName="amount" noresize="false" repeat="true" id="columnId2" headerVAlign="left"/>
          </bttdojo:table>
        </div>
      </div>
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        </div>
      </div>
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        </div>
      </div>
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <bttdojo:label id="TestTable_label09" text="The First Table"/>
        </div>
      </div>
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <bttdojo:button id="TestTable_button" type="button" text="Hidden the First Column.This ID set is 0"/>
        </div>
      </div>
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <bttdojo:button id="TestTable_button01" type="button" text="Hidden the Third Column,This ID set is 2"/>
        </div>
      </div>
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <bttdojo:label id="TestTable_label10" text="The Second Table"/>
        </div>
      </div>
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <bttdojo:button id="TestTable_button02" type="button" text="Hidden the Second Column,The ID is columnId1."/>
        </div>
      </div>
    </div>
</bttdojo:contentpane>
  <bttdojo:contentpane id="TestTable_ContentPane04" title="Test_Noresize_And_FrozenColumn">
    <div class="BTTTableStyle">
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <bttdojo:label id="TestTable_label17" text="This table only one column.FrozenColumn is 1.The table size is autoSize"/>
        </div>
      </div>
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <bttdojo:table id="TestTable_table14" dataNameForList="aList" frozenColumnNum="1" isPageable="false">
            <bttdojo:column level="1" rowSpan="1" align="left" width="100" colSpan="1" hidden="false" headerHAlign="left" text="100px" dataName="index" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
          </bttdojo:table>
        </div>
      </div>
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <bttdojo:label id="TestTable_label15" text="This table only one column.FrozenColumn is 1."/>
        </div>
      </div>
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <bttdojo:table id="TestTable_table12" dataNameForList="aList" frozenColumnNum="1" width="100%" isPageable="false">
            <bttdojo:column level="1" rowSpan="1" align="left" width="80%" colSpan="1" hidden="false" headerHAlign="left" text="Select" dataName="index" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
          </bttdojo:table>
        </div>
      </div>
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <bttdojo:label id="TestTable_label16" text="This table have two columns.FrozenColumn is 3!"/>
        </div>
      </div>
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <bttdojo:table id="TestTable_table13" dataNameForList="aList" frozenColumnNum="3" width="100%" isPageable="false">
            <bttdojo:column level="1" rowSpan="1" align="left" width="50%" colSpan="1" hidden="false" headerHAlign="left" text="50%_Width" dataName="index" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
            <bttdojo:column level="1" rowSpan="1" widget="Image" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="80px_Width" dataName="ImageField" noresize="false" repeat="true" id="columnId1" headerVAlign="left"/>
          </bttdojo:table>
        </div>
      </div>
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <bttdojo:label id="TestTable_label12" text="frozenColumnNum=2 Appreance is 400*200.But Column is 100px,100px,200px and 100px>400px"/>
        </div>
      </div>
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <bttdojo:form id="TestTable_form" errorPage="TestTable.jsp">
            <div class="BTTTableStyle">
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="hScrollbarScroll">                  <bttdojo:table id="TestTable_table10" dataNameForList="aList" sortEnabled="true" columnReordering="true" frozenColumnNum="2" width="400px" height="200px" isPageable="false">
                    <bttdojo:column level="1" rowSpan="1" align="left" width="100" colSpan="1" hidden="false" headerHAlign="left" text="100px" dataName="index" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
                    <bttdojo:column level="1" rowSpan="1" widget="Image" align="left" width="100" colSpan="1" hidden="false" headerHAlign="left" text="100px" dataName="ImageField" noresize="false" repeat="true" id="columnId1" headerVAlign="left"/>
                    <bttdojo:column level="1" rowSpan="1" align="left" width="200" colSpan="1" hidden="false" headerHAlign="left" text="200px" dataName="amount" noresize="false" repeat="true" id="columnId2" headerVAlign="left"/>
                    <bttdojo:column level="1" rowSpan="1" align="left" width="100" colSpan="1" hidden="false" headerHAlign="left" text="100px" dataName="cardNo" noresize="false" repeat="true" id="columnId3" headerVAlign="left"/>
                  </bttdojo:table>
</div>                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                </div>
              </div>
            </div>
        </bttdojo:form>
        </div>
      </div>
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <bttdojo:form id="TestTable_form01" errorPage="TestTable.jsp">
            <div class="BTTTableStyle">
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:label id="TestTable_label13" text="The Table is editableTable.Appearance is 400*200 "/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:table id="TestTable_table11" dataNameForList="aList" sortEnabled="true" columnReordering="true" frozenColumnNum="4" width="400px" height="200px" isPageable="false">
                    <bttdojo:column level="1" rowSpan="1" align="left" width="50" colSpan="1" hidden="false" headerHAlign="left" text="50px" dataName="index" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
                    <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="80px" dataName="cardNo" noresize="false" repeat="true" id="columnId1" headerVAlign="left"/>
                    <bttdojo:column level="1" rowSpan="1" align="left" width="50" colSpan="1" hidden="false" headerHAlign="left" text="50px" dataName="amount" noresize="false" repeat="true" id="columnId2" headerVAlign="left"/>
                    <bttdojo:column level="1" rowSpan="1" widget="Image" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="80px" dataName="ImageField" noresize="false" repeat="true" id="columnId3" headerVAlign="left"/>
                    <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="column4" dataName="Size" noresize="false" repeat="true" id="columnId4" headerVAlign="left"/>
                    <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="column5" dataName="Name" noresize="false" repeat="true" id="columnId5" headerVAlign="left"/>
                    <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="column6" dataName="Age" noresize="false" repeat="true" id="columnId6" headerVAlign="left"/>
                    <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="column7" dataName="Date" noresize="false" repeat="true" id="columnId7" headerVAlign="left"/>
                  </bttdojo:table>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:label id="TestTable_label14" text="The Table is editableTable.Appearance is 400*200 HiddenScrollBar"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="hScrollbarHidden vScrollbarHidden">                  <bttdojo:table id="TestTable_table11_copy" dataNameForList="aList" sortEnabled="true" columnReordering="true" frozenColumnNum="4" width="400px" height="200px" isPageable="false">
                    <bttdojo:column level="1" rowSpan="1" align="left" width="50" colSpan="1" hidden="false" headerHAlign="left" text="50px" dataName="index" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
                    <bttdojo:column level="1" rowSpan="1" align="left" width="100" colSpan="1" hidden="false" headerHAlign="left" text="100px" dataName="cardNo" noresize="false" repeat="true" id="columnId1" headerVAlign="left"/>
                    <bttdojo:column level="1" rowSpan="1" align="left" width="50" colSpan="1" hidden="false" headerHAlign="left" text="50px" dataName="amount" noresize="false" repeat="true" id="columnId2" headerVAlign="left"/>
                    <bttdojo:column level="1" rowSpan="1" widget="Image" align="left" width="100" colSpan="1" hidden="false" headerHAlign="left" text="100px" dataName="ImageField" noresize="false" repeat="true" id="columnId3" headerVAlign="left"/>
                    <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="column4" dataName="Size" noresize="false" repeat="true" id="columnId4" headerVAlign="left"/>
                    <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="column5" dataName="Name" noresize="false" repeat="true" id="columnId5" headerVAlign="left"/>
                    <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="column6" dataName="Age" noresize="false" repeat="true" id="columnId6" headerVAlign="left"/>
                    <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="column7" dataName="Date" noresize="false" repeat="true" id="columnId7" headerVAlign="left"/>
                  </bttdojo:table>
</div>                </div>
              </div>
            </div>
        </bttdojo:form>
        </div>
      </div>
    </div>
</bttdojo:contentpane>
</bttdojo:tabbedpane>

<!-- applet id="printApplet" name="printApplet" code="com.ibm.btt.print.applets.PrintrApplet" codebase="applets" archive="bttprint.jar,JSON4J.jar" style="width:0px; height:0px;"></applet-->
</body>
</html>