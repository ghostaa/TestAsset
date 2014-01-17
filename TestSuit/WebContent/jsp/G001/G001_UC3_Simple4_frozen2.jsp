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
<!-- Generated from G001_UC3_Simple4_frozen2.xui by mashuai, on Fri Jan 17 15:16:20 CST 2014 -->
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
  <div id="G001_UC3_Simple4_frozen2_panel" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:form id="G001_UC3_Simple4_frozen2_form" errorPage="G001/G001_UC3_Simple4_frozen2.jsp">
          <table style="width:910px;height:550px;">
            <tr>
              <td align="left" valign="middle" style="width:100px;height:5%;vertical-align:middle;">
                <bttdojo:label id="G001_UC3_Simple4_frozen2_label" text="transfer history:"/>
              </td>
              <td align="left" valign="middle" style="height:5%;vertical-align:middle;">
                <bttdojo:a id="G001_UC3_Simple4_frozen2_link" text=">>back" flowEvent="back4"/>
              </td>
            </tr>
            <tr>
              <td colspan="2" align="left" valign="top" style="vertical-align:top;">
                <bttdojo:table id="G001_UC3_Simple4_frozen2_Table01" dataNameForList="transferHistory" sortEnabled="true" columnReordering="true" frozenColumnNum="2" headerRows="3" width="493px" isPageable="false" operationName="PAG_G001$G001_UC3_Simple4_frozen2_Table01" directPagination="true" paginationWhenLoading="true" rowsPerPage="10" timeout="10000">
                  <bttdojo:column level="1" rowSpan="2" align="left" width="240" headerHAlign="right" colSpan="2" hidden="false" text="Header A" canSort="false" noresize="false" repeat="false" id="columnId6" headerVAlign="left"/>
                  <bttdojo:column level="1" rowSpan="1" align="left" width="100" headerHAlign="left" colSpan="1" hidden="false" text="Header B" canSort="false" noresize="false" repeat="false" id="columnId7" headerVAlign="left"/>
                  <bttdojo:column level="1" rowSpan="1" align="left" width="100" headerHAlign="left" colSpan="1" hidden="false" text="Header C" canSort="false" noresize="false" repeat="false" id="columnId8" headerVAlign="left"/>
                  <bttdojo:column level="2" rowSpan="1" align="left" width="200" headerHAlign="right" colSpan="2" hidden="false" text="Header D" canSort="false" noresize="false" repeat="false" id="columnId9" headerVAlign="bottom"/>
                  <bttdojo:column level="3" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="center" text="HistoryID" dataName="historyID" noresize="false" repeat="true" id="columnId5" headerVAlign="center"/>
                  <bttdojo:column rowSpan="1" level="3" align="left" showTooltip="false" width="160" colSpan="1" hidden="false" headerHAlign="center" tooltipPosition="below" columnTooltip="toAccount" text="ToAccount" dataName="toAccount" noresize="false" id="columnId0" repeat="true" headerVAlign="center"/>
                  <bttdojo:column rowSpan="1" level="3" align="left" noresize="false" dataName="amount" width="100" colSpan="1" headerHAlign="left" id="columnId2" repeat="true" headerVAlign="left" text="Amount"/>
                  <bttdojo:column level="3" rowSpan="1" align="left" width="100" colSpan="1" hidden="false" headerHAlign="center" text="TransferTime" dataName="transfer_date" noresize="false" repeat="true" id="columnId4" headerVAlign="left"/>
                </bttdojo:table>
              </td>
            </tr>
          </table>
      </bttdojo:form>
      </div>
    </div>
  </div>

<!-- applet id="printApplet" name="printApplet" code="com.ibm.btt.print.applets.PrintrApplet" codebase="applets" archive="bttprint.jar,JSON4J.jar" style="width:0px; height:0px;"></applet-->
</body>
</html>