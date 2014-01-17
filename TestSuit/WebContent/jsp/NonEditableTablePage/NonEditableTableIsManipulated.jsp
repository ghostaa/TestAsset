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
<!-- Generated from NonEditableTableIsManipulated.xui by mashuai, on Fri Jan 17 15:17:14 CST 2014 -->
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

@import "css/dijit/main.css";

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
<script type="text/javascript" data-btt-eca="true" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/NonEditableTablePage/NonEditableTableIsManipulated.js"> </script>
<%request.setAttribute("dse_sessionId", session.getId()); %>
  <div id="NonEditableTableIsManipulated_panel" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:top;">
        <bttdojo:form id="NonEditableTableIsManipulated_form" errorPage="NonEditableTablePage/NonEditableTableIsManipulated.jsp">
          <div class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:top;">
                  <div id="NonEditableTableIsManipulated_panel03" class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:a id="NonEditableTableIsManipulated_link_copy" text=" non-editable table" flowEvent="returnToNonEditableTable"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="NonEditableTableIsManipulated_label" text=" -> manipulate non-editable table"/>
                      </div>
                    </div>
                  </div>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:top;">
                  <div id="NonEditableTableIsManipulated_panel01" class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="NonEditableTableIsManipulated_label01" text="Sort and columReorder"/>
                      </div>
                    </div>
                  </div>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:table id="NonEditableTableIsManipulated_table" dataName="selectAccountList" dataNameForList="nonEditableAccountList" sortEnabled="true" columnReordering="true" hint="the old hint" selectionMode="multiple" selectionRequired="true" isPageable="false">
                  <bttdojo:column level="1" rowSpan="1" widget="TextBox" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" tooltipPosition="left" columnTooltip="AccountName" text="%nls.testtable/AccountName" dataName="AccountName" noresize="false" type="String" repeat="true" headerVAlign="left"/>
                  <bttdojo:column level="1" rowSpan="1" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" tooltipPosition="left" columnTooltip="TradeTime" text="%nls.testtable/TradeTime" dataName="TradeTime" noresize="false" repeat="true" headerVAlign="left"/>
                  <bttdojo:column level="1" rowSpan="1" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" tooltipPosition="right" columnTooltip="MaximumAmount" text="%nls.testtable/MaximumAmount" dataName="MaximumAmount" noresize="false" repeat="true" headerVAlign="left"/>
                  <bttdojo:column level="1" rowSpan="1" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" tooltipPosition="below" columnTooltip="AccountOpeningDate" text="%nls.testtable/AccountOpeningDate" dataName="AccountOpeningDate" noresize="false" repeat="true" headerVAlign="left"/>
                  <bttdojo:column level="1" rowSpan="1" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" tooltipPosition="above" columnTooltip="AccountBlance" text="%nls.testtable/AccountBlance" dataName="AccountBlance" noresize="false" repeat="true" headerVAlign="left"/>
                  <bttdojo:column rowSpan="1" level="1" align="left" noresize="false" dataName="Rate" width="80" colSpan="1" headerHAlign="left" repeat="true" headerVAlign="left" text="%nls.testtable/Rate"/>
                  <bttdojo:column level="1" rowSpan="1" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" columnTooltip="Usable" text="%nls.testtable/Usable" dataName="Usable" noresize="false" repeat="true" headerVAlign="left"/>
                </bttdojo:table>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:top;">
                  <div id="NonEditableTableIsManipulated_visibility" class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:button id="NonEditableTableIsManipulated_visible" type="button" text="visible"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:button id="NonEditableTableIsManipulated_hidden" type="button" text="hidden"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:button id="NonEditableTableIsManipulated_gone" type="button" text="gone"/>
                      </div>
                    </div>
                  </div>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:top;">
                  <div id="NonEditableTableIsManipulated_disabled" class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="NonEditableTableIsManipulated_label02" text="disabled:"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:button id="NonEditableTableIsManipulated_disabletrue" type="button" text=" true"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:button id="NonEditableTableIsManipulated_disablefalse" type="button" text="false"/>
                      </div>
                    </div>
                  </div>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:top;">
                  <div id="NonEditableTableIsManipulated_readonly" class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="NonEditableTableIsManipulated_readonlylabel" text="read only:"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:button id="NonEditableTableIsManipulated_readonlytrue" type="button" text="true"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:button id="NonEditableTableIsManipulated_readonlyfalse" type="button" text="false"/>
                      </div>
                    </div>
                  </div>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" style="vertical-align:">
                  <div id="NonEditableTableIsManipulated_panel02" class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:button id="NonEditableTableIsManipulated_To group popup page" type="submit" text="To group popup page" flowEvent="to group popup page"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:button id="NonEditableTableIsManipulated_To pane popup page" type="submit" text="To pane popup page" flowEvent="to pane popup page"/>
                      </div>
                    </div>
                  </div>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:top;">
                  <div id="NonEditableTableIsManipulated_panel04" class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:button id="NonEditableTableIsManipulated_Change the hint from text" type="button" text="Change the hint from text"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:button id="NonEditableTableIsManipulated_Change the hint from NLS" type="button" text="Change the hint from NLS"/>
                      </div>
                    </div>
                  </div>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:top;">
                  <div id="NonEditableTableIsManipulated_panel05" class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:button id="NonEditableTableIsManipulated_Change the CSS" type="button" text="Change the CSS"/>
                      </div>
                      <div class="BTTCellStyle" style="vertical-align:">
                      </div>
                      <div class="BTTCellStyle" style="vertical-align:">
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
      <div class="BTTCellStyle" style="vertical-align:">
      </div>
    </div>
  </div>

<!-- applet id="printApplet" name="printApplet" code="com.ibm.btt.print.applets.PrintrApplet" codebase="applets" archive="bttprint.jar,JSON4J.jar" style="width:0px; height:0px;"></applet-->
</body>
</html>