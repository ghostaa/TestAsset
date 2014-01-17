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
<!-- Generated from F003_Both.xui by mashuai, on Fri Jan 17 15:17:05 CST 2014 -->
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

@import "css/testGridEnhancement.css";

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
<script type="text/javascript" data-btt-eca="true" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/IBK_F_003/F003_1/F003_Both.js"> </script>
<%request.setAttribute("dse_sessionId", session.getId()); %>
  <div id="F003_Both_panel" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:form id="F003_Both_form" errorPage="IBK_F_003/F003_1/F003_Both.jsp">
          <div style="width:955px;height:341px;" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:table id="F003_Both_table" dataNameForList="transferHistory" sortEnabled="true" columnReordering="true" headerRows="2" cellMerge="[{\"start\":7,\"major\":8,\"row\":9,\"end\":8}, {\"start\":9,\"major\":9,\"row\":9,\"end\":11}]" isPageable="false" operationName="PAG_IBK_F_003$F003_1$F003_Both_table" directPagination="true" paginationWhenLoading="true" rowsPerPage="10" timeout="10000">
                  <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="2" hidden="false" headerHAlign="center" text="HeaderA" canSort="false" dataName="historyID" noresize="false" repeat="false" id="columnId0" headerVAlign="center"/>
                  <bttdojo:column level="1" rowSpan="1" align="left" showTooltip="true" width="80" colSpan="3" hidden="false" headerHAlign="center" columnTooltip="amount" text="HeaderB" canSort="false" dataName="amount" noresize="false" id="columnId1" repeat="false" headerVAlign="center"/>
                  <bttdojo:column level="2" rowSpan="1" align="left" width="100" colSpan="1" hidden="false" headerHAlign="center" text="History ID" dataName="historyID" noresize="false" repeat="true" id="columnId2" headerVAlign="center"/>
                  <bttdojo:column rowSpan="1" level="2" align="left" showTooltip="true" width="160" colSpan="1" hidden="false" headerHAlign="center" tooltipPosition="below" columnTooltip="toAccount" text="To Account" dataName="toAccount" noresize="false" id="columnId3" repeat="true" headerVAlign="center"/>
                  <bttdojo:column rowSpan="1" level="2" align="left" noresize="false" dataName="amount" width="80" colSpan="1" headerHAlign="right" id="columnId4" repeat="true" headerVAlign="bottom" text="Amount"/>
                  <bttdojo:column level="2" rowSpan="1" align="left" width="100" colSpan="1" hidden="false" headerHAlign="left" text="Transfer Time" dataName="transfer_date" noresize="false" repeat="true" id="columnId5" headerVAlign="left"/>
                  <bttdojo:column rowSpan="1" level="2" align="left" noresize="false" dataName="comments" width="100" colSpan="1" headerHAlign="center" id="columnId6" repeat="true" headerVAlign="left" text="Comments"/>
                </bttdojo:table>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:block;" class="border-style font-Georgia">                <bttdojo:group id="F003_Both_group" text="Hide a column">
                  <div class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:button id="F003_Both_button_hide01" type="button" text="hide Head 1"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:button id="F003_Both_button_hide02" type="button" text="hide Head 2"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:button id="F003_Both_button_hide03" type="button" text="hide Head 3"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:button id="F003_Both_button_hide04" type="button" text="hide Head 4"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:button id="F003_Both_button_hide05" type="button" text="hide Head 5"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:button id="F003_Both_button_hide06" type="button" text="hide Head 6"/>
                      </div>
                    </div>
                  </div>
              </bttdojo:group>
</div>              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:group id="F003_Both_group01" style="height:60px;" text="Show a column" height="60px">
                  <div style="height:100%;" class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:button id="F003_Both_button_show01" type="button" text="show Head1"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:button id="F003_Both_button_show02" type="button" text="show Head2"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:button id="F003_Both_button_show03" type="button" text="show Head3"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:button id="F003_Both_button_show04" type="button" text="show Head4"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:button id="F003_Both_button_show05" type="button" text="show Head5"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:button id="F003_Both_button_show06" type="button" text="show Head6"/>
                      </div>
                    </div>
                  </div>
              </bttdojo:group>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:button id="F003_Both_button" type="submit" text="Submit" flowEvent="viewEvt"/>
              </div>
            </div>
          </div>
      </bttdojo:form>
      </div>
    </div>
  </div>

<!-- applet id="printApplet" name="printApplet" code="com.ibm.btt.print.applets.PrintrApplet" codebase="applets" archive="bttprint.jar,JSON4J.jar" style="width:0px; height:0px;"></applet-->
</body>
</html>