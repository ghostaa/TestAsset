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
<!-- Generated from TableEdit.xui by mashuai, on  -->
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
<script type="text/javascript" data-btt-eca="true" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/IBK_F_018/TableEdit.js"> </script>
<%request.setAttribute("dse_sessionId", session.getId()); %>
  <div id="TableEdit_panel" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:form id="TableEdit_form" errorPage="IBK_F_018/TableEdit.jsp">
          <table>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="TableEdit_label" text="Name"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:textbox id="TableEdit_text" dataName="selectedRecord.name"/>
              </td>
              <td rowspan="3" align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:button id="TableEdit_AppendButton" type="button" text="Append"/>
              </td>
              <td rowspan="3" align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="TableEdit_label01" text="Age"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:textbox id="TableEdit_text01" dataName="selectedRecord.age"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="TableEdit_label02" text="Account"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:textbox id="TableEdit_text02" dataName="selectedRecord.account"/>
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
                <bttdojo:label id="TableEdit_label03" text="Customer Information Table"/>
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
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:form id="TableEdit_form01" errorPage="IBK_F_018/TableEdit.jsp">
          <table>
            <tr>
              <td rowspan="5" align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:table id="TableEdit_table" dataName="selectedRecord" dataNameForList="TableList" sortEnabled="true" selectionMode="single" height="160px" isPageable="false">
                  <bttdojo:column level="1" rowSpan="1" widget="TextBox" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Name" dataName="name" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
                  <bttdojo:column minimumValue="-2147483648" numberType="integer" level="1" rowSpan="1" widget="TextBox" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Age" maximumValue="2147483647" dataName="age" noresize="false" type="Number" repeat="true" id="columnId1" headerVAlign="left"/>
                  <bttdojo:column level="1" rowSpan="1" widget="TextBox" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="Account" dataName="account" noresize="false" repeat="true" id="columnId2" headerVAlign="left"/>
                </bttdojo:table>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:button id="TableEdit_NewButton" type="button" text="New"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:button id="TableEdit_DeleteButton" type="button" text="Delete"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:button id="TableEdit_UpButton" type="button" text="Up"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:button id="TableEdit_DownButton" type="button" text="Down"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:button id="TableEdit_button01" type="submit" text="Select" flowEvent="Select"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:button id="TableEdit_button02" type="submit" text="Complete" flowEvent="OK"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
          </table>
      </bttdojo:form>
      </div>
    </div>
  </div>
  <bttdojo:script id="TableEdit_AppendInputScript01" content="console.debug(\"####### Add input fields to last row of table \");

var temp={};
temp.name=dijit.byId(\"TableEdit_text\").value;
temp.age=dijit.byId(\"TableEdit_text01\").value;
temp.account=dijit.byId(\"TableEdit_text02\").value;

var rows = [];
rows[0]=temp;

dijit.byId(\"TableEdit_table\").rows_append=true;
dijit.byId(\"TableEdit_table\").setStoreData(rows);

var lastVisibleRow=dijit.byId(\"TableEdit_table\").scroller.rowCount;
dijit.byId(\"TableEdit_table\").scrollToRow(lastVisibleRow);" executeOnLoad="false"/>
  <bttdojo:script id="TableEdit_newRowScript" content="console.debug(\"####### Add new empty row to table \");

var temp={};
temp.name=' ';
temp.age=0;
temp.account=\" \";

var rows = [];
rows[0]=temp;

 
dijit.byId(\"TableEdit_table\").rows_append=true;
dijit.byId(\"TableEdit_table\").setStoreData(rows);

var lastVisibleRow=dijit.byId(\"TableEdit_table\").scroller.rowCount;
dijit.byId(\"TableEdit_table\").scrollToRow(lastVisibleRow);" executeOnLoad="false"/>
  <bttdojo:script id="TableEdit_DeleteRowScript" content="console.debug(\"####### Delete selected row \");

  
var tableInst=dijit.byId(\"TableEdit_table\");
var oldRows=tableInst.store._getItemsArray();
var selectedIndex=tableInst.selection.selectedIndex ;
tableInst.removeSelectedRows();
" executeOnLoad="false"/>
  <bttdojo:script id="TableEdit_UpDownScript" content="console.debug(\"#######  Up/Down selected row  :\"+param0);
var tableInst=dijit.byId(\"TableEdit_table\");
var rowItems=tableInst.store._getItemsArray();
var rowCount=tableInst.rowCount;
var  selectedIndex=tableInst.selection.selectedIndex ;
var new_selectedIndex= selectedIndex;

if   (param0==\"Up\" && selectedIndex>0) 
 new_selectedIndex=selectedIndex - 1;
else if  (param0==\"Down\" && selectedIndex<rowCount-1) 
      new_selectedIndex=selectedIndex + 1;
 
    
if (  new_selectedIndex != selectedIndex ) {
 var temp=rowItems[new_selectedIndex];
 rowItems[new_selectedIndex]=rowItems[selectedIndex];
 rowItems[selectedIndex]=temp;
 console.debug(\"####### set to new selectedIndex : \"+new_selectedIndex ,rowItems[new_selectedIndex] );
 
 dijit.byId(\"TableEdit_table\").setStoreData(rowItems);
 dijit.byId(\"TableEdit_table\").selection.setSelected(selectedIndex, false);
 dijit.byId(\"TableEdit_table\").selection.setSelected(new_selectedIndex, true);
}" executeOnLoad="false"/>

<!-- applet id="printApplet" name="printApplet" code="com.ibm.btt.print.applets.PrintrApplet" codebase="applets" archive="bttprint.jar,JSON4J.jar" style="width:0px; height:0px;"></applet-->
</body>
</html>