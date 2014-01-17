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
<!-- Generated from NonEditableTableInTabbedPane.xui by mashuai, on  -->
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
<script type="text/javascript" data-btt-eca="true" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/NonEditableTablePage/NonEditableTableInTabbedPane.js"> </script>
<%request.setAttribute("dse_sessionId", session.getId()); %>
  <div id="NonEditableTableInTabbedPane_panel" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:top;">
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="NonEditableTableInTabbedPane_panel06" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <table id="NonEditableTableInTabbedPane_panel01">
                    <tr>
                      <td align="left" valign="middle" style="vertical-align:middle;">
                        <bttdojo:a id="NonEditableTableInTabbedPane_link" text=" non-editable table" flowEvent="returnToNonEditableTable"/>
                      </td>
                      <td align="left" valign="middle" style="vertical-align:middle;">
                        <bttdojo:label id="NonEditableTableInTabbedPane_label" text="-> non-editable table in TabbedPane"/>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="2" align="left" valign="middle" style="vertical-align:middle;">
                        <bttdojo:tabbedpane id="NonEditableTableInTabbedPane_tabbedPane">
                          <bttdojo:contentpane id="NonEditableTableInTabbedPane_ContentPane01" title="NormalTab">
                            <div class="BTTTableStyle">
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:form id="NonEditableTableInTabbedPane_form01" errorPage="NonEditableTablePage/NonEditableTableInTabbedPane.jsp">
                                    <div class="BTTTableStyle">
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:table id="NonEditableTableInTabbedPane_table" dataName="selectAccountList" dataNameForList="nonEditableAccountList" selectionMode="multiple" selectionRequired="true" isPageable="false">
                                            <bttdojo:column level="1" rowSpan="1" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" tooltipPosition="left" columnTooltip="AccountName" text="%nls.testtable/AccountName" dataName="AccountName" noresize="false" repeat="true" headerVAlign="left"/>
                                            <bttdojo:column level="1" rowSpan="1" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" tooltipPosition="left" columnTooltip="TradeTime" text="%nls.testtable/TradeTime" dataName="TradeTime" noresize="false" repeat="true" headerVAlign="left"/>
                                            <bttdojo:column level="1" rowSpan="1" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" tooltipPosition="right" columnTooltip="MaximumAmount" text="%nls.testtable/MaximumAmount" dataName="MaximumAmount" noresize="false" repeat="true" headerVAlign="left"/>
                                            <bttdojo:column level="1" rowSpan="1" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" tooltipPosition="below" columnTooltip="AccountOpeningDate" text="%nls.testtable/AccountOpeningDate" dataName="AccountOpeningDate" noresize="false" repeat="true" headerVAlign="left"/>
                                            <bttdojo:column level="1" rowSpan="1" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" tooltipPosition="above" columnTooltip="AccountBlance" text="%nls.testtable/AccountBlance" dataName="AccountBlance" noresize="false" repeat="true" headerVAlign="left"/>
                                            <bttdojo:column rowSpan="1" level="1" align="center" noresize="false" dataName="Rate" width="80" colSpan="1" headerHAlign="center" repeat="true" headerVAlign="left" text="%nls.testtable/Rate"/>
                                            <bttdojo:column level="1" rowSpan="1" align="right" showTooltip="true" width="80" colSpan="1" headerHAlign="right" tooltipPosition="right" columnTooltip="Usable" text="%nls.testtable/Usable" dataName="Usable" noresize="false" repeat="true" headerVAlign="left"/>
                                          </bttdojo:table>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                            <div id="NonEditableTableInTabbedPane_Panel01" class="BTTTableStyle">
                                              <div class="BTTRowStyle">
                                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                                  <bttdojo:button id="NonEditableTableInTabbedPane_button" type="submit" text="to group page" flowEvent="to group page"/>
                                                </div>
                                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                                  <bttdojo:button id="NonEditableTableInTabbedPane_button01" type="submit" text="to pane popup page" flowEvent="to pane popup page"/>
                                                </div>
                                              </div>
                                            </div>
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
                                        </div>
                                      </div>
                                    </div>
                                </bttdojo:form>
                                </div>
                              </div>
                            </div>
                        </bttdojo:contentpane>
                          <bttdojo:contentpane id="NonEditableTableInTabbedPane_ContentPane02" title="Group" selected="true">
                            <div class="BTTTableStyle">
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:top;">
                                  <bttdojo:group id="NonEditableTableInTabbedPane_group" text="Group">
                                    <div class="BTTTableStyle">
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:table id="NonEditableTableInTabbedPane_table_copy" dataNameForList="nonEditableAccountList" isPageable="false">
                                            <bttdojo:column level="1" rowSpan="1" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" tooltipPosition="left" columnTooltip="AccountName" text="%nls.testtable/AccountName" dataName="AccountName" noresize="true" repeat="true" headerVAlign="left"/>
                                            <bttdojo:column level="1" rowSpan="1" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" tooltipPosition="left" columnTooltip="TradeTime" text="%nls.testtable/TradeTime" dataName="TradeTime" noresize="true" repeat="true" headerVAlign="left"/>
                                            <bttdojo:column level="1" rowSpan="1" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" columnTooltip="MaximumAmount" text="%nls.testtable/MaximumAmount" dataName="MaximumAmount" noresize="true" repeat="true" headerVAlign="left"/>
                                            <bttdojo:column level="1" rowSpan="1" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" tooltipPosition="below" columnTooltip="AccountOpeningDate" text="%nls.testtable/AccountOpeningDate" dataName="AccountOpeningDate" noresize="true" repeat="true" headerVAlign="left"/>
                                            <bttdojo:column level="1" rowSpan="1" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" tooltipPosition="above" columnTooltip="AccountBlance" text="%nls.testtable/AccountBlance" dataName="AccountBlance" noresize="true" repeat="true" headerVAlign="left"/>
                                            <bttdojo:column rowSpan="1" level="1" align="left" noresize="true" dataName="Rate" width="80" colSpan="1" headerHAlign="left" repeat="true" headerVAlign="left" text="%nls.testtable/Rate"/>
                                            <bttdojo:column level="1" rowSpan="1" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" tooltipPosition="right" columnTooltip="Usable" text="%nls.testtable/Usable" dataName="Usable" noresize="true" repeat="true" headerVAlign="left"/>
                                          </bttdojo:table>
                                        </div>
                                      </div>
                                    </div>
                                </bttdojo:group>
                                </div>
                              </div>
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="submitButton">                                  <bttdojo:label id="NonEditableTableInTabbedPane_label03" text="resizable =\"false\". Every column is non-resizable"/>
</div>                                </div>
                              </div>
                            </div>
                        </bttdojo:contentpane>
                          <bttdojo:contentpane id="NonEditableTableInTabbedPane_ContentPane03" title="Pane">
                            <div class="BTTTableStyle">
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:top;">
                                  <bttdojo:tabbedpane id="NonEditableTableInTabbedPane_tabbedPane01">
                                    <bttdojo:contentpane id="NonEditableTableInTabbedPane_ContentPane04" title="Tab01">
                                      <div class="BTTTableStyle">
                                        <div class="BTTRowStyle">
                                          <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                            <bttdojo:label id="NonEditableTableInTabbedPane_label01" text="tab01"/>
                                          </div>
                                        </div>
                                        <div class="BTTRowStyle">
                                          <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                            <bttdojo:table id="NonEditableTableInTabbedPane_table_copy01" dataNameForList="nonEditableAccountList" isPageable="false">
                                              <bttdojo:column level="1" rowSpan="1" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" tooltipPosition="left" columnTooltip="AccountName" text="%nls.testtable/AccountName" dataName="AccountName" noresize="false" repeat="true" headerVAlign="left"/>
                                              <bttdojo:column level="1" rowSpan="1" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" tooltipPosition="left" columnTooltip="TradeTime" text="%nls.testtable/TradeTime" dataName="TradeTime" noresize="false" repeat="true" headerVAlign="left"/>
                                              <bttdojo:column level="1" rowSpan="1" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" columnTooltip="MaximumAmount" text="%nls.testtable/MaximumAmount" dataName="MaximumAmount" noresize="false" repeat="true" headerVAlign="left"/>
                                              <bttdojo:column level="1" rowSpan="1" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" tooltipPosition="below" columnTooltip="AccountOpeningDate" text="%nls.testtable/AccountOpeningDate" dataName="AccountOpeningDate" noresize="false" repeat="true" headerVAlign="left"/>
                                              <bttdojo:column level="1" rowSpan="1" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" tooltipPosition="above" columnTooltip="AccountBlance" text="%nls.testtable/AccountBlance" dataName="AccountBlance" noresize="false" repeat="true" headerVAlign="left"/>
                                              <bttdojo:column rowSpan="1" level="1" align="right" noresize="false" dataName="Rate" width="80" colSpan="1" headerHAlign="right" repeat="true" headerVAlign="left" text="%nls.testtable/Rate"/>
                                              <bttdojo:column level="1" rowSpan="1" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" tooltipPosition="right" columnTooltip="Usable" text="%nls.testtable/Usable" dataName="Usable" noresize="false" repeat="true" headerVAlign="left"/>
                                            </bttdojo:table>
                                          </div>
                                        </div>
                                      </div>
                                  </bttdojo:contentpane>
                                    <bttdojo:contentpane id="NonEditableTableInTabbedPane_ContentPane05" title="Tab02">
                                      <div class="BTTTableStyle">
                                        <div class="BTTRowStyle">
                                          <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                            <bttdojo:label id="NonEditableTableInTabbedPane_label02" text="tab02"/>
                                          </div>
                                        </div>
                                        <div class="BTTRowStyle">
                                          <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                            <bttdojo:table id="NonEditableTableInTabbedPane_table_copy01_copy" dataNameForList="nonEditableAccountList" isPageable="false">
                                              <bttdojo:column level="1" rowSpan="1" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" tooltipPosition="left" columnTooltip="AccountName" text="%nls.testtable/AccountName" dataName="AccountName" noresize="false" repeat="true" headerVAlign="left"/>
                                              <bttdojo:column level="1" rowSpan="1" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" tooltipPosition="left" columnTooltip="TradeTime" text="%nls.testtable/TradeTime" dataName="TradeTime" noresize="false" repeat="true" headerVAlign="left"/>
                                              <bttdojo:column level="1" rowSpan="1" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" columnTooltip="MaximumAmount" text="%nls.testtable/MaximumAmount" dataName="MaximumAmount" noresize="false" repeat="true" headerVAlign="left"/>
                                              <bttdojo:column level="1" rowSpan="1" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" tooltipPosition="below" columnTooltip="AccountOpeningDate" text="%nls.testtable/AccountOpeningDate" dataName="AccountOpeningDate" noresize="false" repeat="true" headerVAlign="left"/>
                                              <bttdojo:column level="1" rowSpan="1" align="center" showTooltip="true" width="80" colSpan="1" headerHAlign="center" tooltipPosition="above" columnTooltip="AccountBlance" text="%nls.testtable/AccountBlance" dataName="AccountBlance" noresize="false" repeat="true" headerVAlign="left"/>
                                              <bttdojo:column rowSpan="1" level="1" align="center" noresize="false" dataName="Rate" width="80" colSpan="1" headerHAlign="center" repeat="true" headerVAlign="left" text="%nls.testtable/Rate"/>
                                              <bttdojo:column level="1" rowSpan="1" align="right" showTooltip="true" width="80" colSpan="1" headerHAlign="right" tooltipPosition="right" columnTooltip="Usable" text="%nls.testtable/Usable" dataName="Usable" noresize="false" repeat="true" headerVAlign="left"/>
                                            </bttdojo:table>
                                          </div>
                                        </div>
                                      </div>
                                  </bttdojo:contentpane>
                                </bttdojo:tabbedpane>
                                </div>
                              </div>
                            </div>
                        </bttdojo:contentpane>
                          <bttdojo:contentpane id="NonEditableTableInTabbedPane_ContentPane09" title="Link">
                            <div class="BTTTableStyle">
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:form id="NonEditableTableInTabbedPane_form04" errorPage="NonEditableTablePage/NonEditableTableInTabbedPane.jsp">
                                    <div class="BTTTableStyle">
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:table id="NonEditableTableInTabbedPane_table_copy02_copy02" dataNameForList="forTableLinkList" selectionRequired="true" isPageable="false">
                                            <bttdojo:column widget="Link" rowSpan="1" level="1" align="left" showTooltip="true" width="80" dataNameForRow="forRow" tooltipPosition="left" columnTooltip="linkName" dataNameForLink="forLink" dataNameForClickable="clickAble" dataName="linkName" renderMode="text" id="columnId0" repeat="true" headerVAlign="left" colSpan="1" hidden="false" headerHAlign="left" dataNameForColumn="forColumn" text="dataNameForLink" dataNameForTooltip="forTooltip" newWindow="false" noresize="false"/>
                                            <bttdojo:column tooltip="%nls.testtable/AccountType" level="1" rowSpan="1" widget="Link" align="left" showTooltip="true" width="80" linkText="%nls.testtable/Image" tooltipPosition="below" canSort="false" dataNameForLink="forLink" renderMode="text" id="columnId1" repeat="true" headerVAlign="left" colSpan="1" hidden="false" headerHAlign="left" text="linkText" newWindow="true" noresize="false"/>
                                            <bttdojo:column level="1" rowSpan="1" widget="Link" align="left" showTooltip="true" width="80" linkText="abc" tooltipPosition="above" flowEvent="to group page" canSort="false" renderMode="text" id="columnId2" repeat="true" headerVAlign="left" colSpan="1" hidden="false" headerHAlign="left" text="change flow event" newWindow="false" noresize="false"/>
                                            <bttdojo:column widget="Link" rowSpan="1" level="1" align="left" showTooltip="true" width="80" tooltipPosition="right" columnTooltip="forImage" dataNameForLink="forLink" dataNameForClickable="clickAble" dataName="forImage" renderMode="image" id="columnId3" repeat="true" headerVAlign="left" colSpan="1" hidden="false" headerHAlign="left" text="image link" newWindow="true" noresize="false"/>
                                          </bttdojo:table>
                                        </div>
                                      </div>
                                    </div>
                                </bttdojo:form>
                                </div>
                              </div>
                            </div>
                        </bttdojo:contentpane>
                          <bttdojo:contentpane id="NonEditableTableInTabbedPane_ContentPane10" title="Button">
                            <div class="BTTTableStyle">
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:form id="NonEditableTableInTabbedPane_form03" errorPage="NonEditableTablePage/NonEditableTableInTabbedPane.jsp">
                                    <div class="BTTTableStyle">
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:table id="NonEditableTableInTabbedPane_table_copy02_copy_copy" dataNameForList="forTableLinkList" selectionRequired="true" isPageable="false">
                                            <bttdojo:column widget="Button" rowSpan="1" level="1" align="left" showTooltip="true" width="80" dataNameForRow="forRow" tooltipPosition="right" columnTooltip="linkName" dataNameForLink="forLink" dataNameForClickable="clickAble" dataName="linkName" id="columnId0" repeat="true" headerVAlign="left" colSpan="1" hidden="false" headerHAlign="left" dataNameForColumn="forColumn" text="dataNameForButton" dataNameForTooltip="forTooltip" newWindow="false" noresize="false"/>
                                            <bttdojo:column tooltip="%nls.testtable/AccountTypeValue" level="1" rowSpan="1" widget="Button" align="left" width="80" linkText="%nls.testtable/Image" canSort="false" dataNameForLink="forLink" repeat="true" id="columnId1" headerVAlign="left" colSpan="1" hidden="false" headerHAlign="left" text="linkText" newWindow="true" noresize="false"/>
                                            <bttdojo:column tooltip="hihi" level="1" rowSpan="1" widget="Button" align="left" showTooltip="true" width="80" linkText="abcdef" tooltipPosition="left" flowEvent="to group page" canSort="false" id="columnId2" repeat="true" headerVAlign="left" colSpan="1" hidden="false" headerHAlign="left" text="change flow event" newWindow="true" noresize="false"/>
                                          </bttdojo:table>
                                        </div>
                                      </div>
                                    </div>
                                </bttdojo:form>
                                </div>
                              </div>
                            </div>
                        </bttdojo:contentpane>
                          <bttdojo:contentpane id="NonEditableTableInTabbedPane_ContentPane06" title="NoneSelectionMode">
                            <div class="BTTTableStyle">
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:form id="NonEditableTableInTabbedPane_form02" errorPage="NonEditableTablePage/NonEditableTableInTabbedPane.jsp">
                                    <div class="BTTTableStyle">
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:label id="NonEditableTableInTabbedPane_label07" text="Test ContextMenu:1.Link is hasCloseButton=false,leftClickToOpen=true,position=point;"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:label id="NonEditableTableInTabbedPane_label08" text="Test ContextMenu:2.Button is hasCloseButton=true,leftClickToOpen=false,position=below;"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:label id="NonEditableTableInTabbedPane_label10" text="This selectionMode of Table is none.DataName is KColl"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                            <div id="NonEditableTableInTabbedPane_Panel02" class="BTTTableStyle">
                                              <div class="BTTRowStyle">
                                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                                  <bttdojo:label id="NonEditableTableInTabbedPane_label09" text="MenuItemId"/>
                                                </div>
                                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                                  <bttdojo:label id="NonEditableTableInTabbedPane_showMenuItemId" text="Label"/>
                                                </div>
                                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                                  <bttdojo:label id="NonEditableTableInTabbedPane_label12" text="WidgetId"/>
                                                </div>
                                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                                  <bttdojo:label id="NonEditableTableInTabbedPane_showWidgetId" text="Label"/>
                                                </div>
                                              </div>
                                            </div>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:table id="NonEditableTableInTabbedPane_table_non" dataName="SingleSelectData" dataNameForList="forTableLinkList" selectionRequired="true" isPageable="false">
                                            <bttdojo:column widget="Link" rowSpan="1" level="1" align="left" showTooltip="true" width="80" dataNameForRow="forRow" tooltipPosition="left" columnTooltip="linkName" dataNameForLink="forLink" dataNameForClickable="clickAble" dataName="linkName" renderMode="text" id="columnId03" repeat="true" headerVAlign="left" colSpan="1" hidden="false" headerHAlign="left" dataNameForColumn="forColumn" text="dataNameForLink" dataNameForTooltip="forTooltip" newWindow="false" noresize="false"/>
                                            <bttdojo:column widget="Link" rowSpan="1" level="1" align="left" showTooltip="true" width="80" tooltipPosition="left" columnTooltip="ContentMenu_Link_NoAction" dataNameForLink="ContentMenu_Link_NoAction" dataName="ContentMenu_Link_NoAction" renderMode="text" id="columnId33" repeat="true" headerVAlign="left" colSpan="1" hidden="false" headerHAlign="left" text="LinkECA" newWindow="false" noresize="false"/>
                                            <bttdojo:column rowSpan="1" widget="Link" level="1" align="left" showTooltip="true" width="80" columnTooltip="ContentMenu_Link_URLAndSubmit" dataNameForLink="ContentMenu_Link_URLAndSubmit" dataName="ContentMenu_Link_URLAndSubmit" renderMode="text" id="columnId43" repeat="true" headerVAlign="left" colSpan="1" hidden="false" headerHAlign="left" text="LinkURL" newWindow="false" noresize="false"/>
                                            <bttdojo:column widget="Link" rowSpan="1" level="1" align="left" showTooltip="true" width="80" tooltipPosition="below" columnTooltip="ContentMenu_Link_CancelAndSave" dataNameForLink="ContentMenu_Link_CancelAndSave" dataName="ContentMenu_Link_CancelAndSave" renderMode="text" id="columnId53" repeat="true" headerVAlign="left" colSpan="1" hidden="false" headerHAlign="left" text="LinkSubmit" newWindow="false" noresize="false"/>
                                            <bttdojo:column widget="Button" rowSpan="1" level="1" align="left" showTooltip="true" width="80" tooltipPosition="above" flowEvent="eventForMenu" columnTooltip="ContentMenu_Button_NoAction" dataName="ContentMenu_Button_NoAction" id="columnId63" repeat="true" headerVAlign="left" colSpan="1" hidden="false" headerHAlign="left" text="ButtonECA" newWindow="false" noresize="false"/>
                                            <bttdojo:column level="1" rowSpan="1" widget="Button" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" flowEvent="eventForMenu" text="ButtonURL" newWindow="false" dataName="ContentMenu_Button_URLAndSubmit" noresize="false" repeat="true" id="columnId73" headerVAlign="left"/>
                                            <bttdojo:column level="1" rowSpan="1" widget="Button" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" flowEvent="eventForMenu" text="ButtonSubmit" newWindow="true" dataName="ContentMenu_Button_CancelAndSave" noresize="false" repeat="true" id="columnId83" headerVAlign="left"/>
                                            <bttdojo:column widget="TextBox" rowSpan="1" level="1" align="left" showTooltip="true" width="80" tooltipPosition="right" columnTooltip="linkName" dataName="linkName" id="columnId84" repeat="true" headerVAlign="left" colSpan="1" hidden="false" headerHAlign="left" text="test" noresize="false" type="String"/>
                                            <bttdojo:tableMenu hasCloseButton="false" leftClickToOpen="true" bindingCellWidgetId="columnId33" position="point">
                                              <bttdojo:tableMenuItem type="noAction" id="menuitem110" text="ECA1"/>
                                              <bttdojo:tableMenuItem type="noAction" id="menuitem111" text="ECA2"/>
                                              <bttdojo:tableMenuItem type="noAction" id="menuitem112" text="%nls.bttsample/lang_English"/>
                                              <bttdojo:tableMenuItem type="noAction" id="menuitem113" text="menuitem113"/>
                                              <bttdojo:tableMenuItem type="noAction" id="menuitem114" text="menuitem114"/>
                                              <bttdojo:tableMenuItem type="noAction" id="menuitem115" text="menuitem115"/>
                                              <bttdojo:tableMenuItem type="noAction" id="menuitem116" text="menuitem116"/>
                                            </bttdojo:tableMenu>
                                            <bttdojo:tableMenu hasCloseButton="false" leftClickToOpen="true" bindingCellWidgetId="columnId43" position="point">
                                              <bttdojo:tableMenuItem newWindow="false" type="link" id="B1" text="launch URL" url="http://www.baidu.com"/>
                                              <bttdojo:tableMenuItem newWindow="true" type="link" id="B2" text="launch URL in new window" url="http://www.baidu.com"/>
                                            </bttdojo:tableMenu>
                                            <bttdojo:tableMenu hasCloseButton="false" leftClickToOpen="true" bindingCellWidgetId="columnId53" position="point">
                                              <bttdojo:tableMenuItem type="submit" id="menuitem136" flowEvent="eventForMenu" text="SubmitByChangeFlowEvent"/>
                                              <bttdojo:tableMenuItem flowId="IBK_4_12_ContextMenuFlow" type="submit" id="menuitem137" text="SubmitByLaunchNewFlow"/>
                                              <bttdojo:tableMenuItem operationId="IBK_4_12_ContextMenuOp" type="submit" id="menuitem138" text="SubmitByLaunchOperation"/>
                                              <bttdojo:tableMenuItem type="cancel" id="menuitem130" flowEvent="eventForMenu" text="NoDataByChangeFlowEvent"/>
                                              <bttdojo:tableMenuItem flowId="IBK_4_12_ContextMenuFlow" type="cancel" id="menuitem131" text="NoDataByLaunchNewFlow"/>
                                              <bttdojo:tableMenuItem operationId="IBK_4_12_ContextMenuOp" type="cancel" id="menuitem132" text="NoDataByLaunchOperation"/>
                                              <bttdojo:tableMenuItem type="save" id="menuitem133" flowEvent="eventForMenu" text="WithoutValidationByChangeFlowEvent"/>
                                              <bttdojo:tableMenuItem flowId="IBK_4_12_ContextMenuFlow" type="save" id="menuitem134" text="WithoutValidationByLaunchNewFlow"/>
                                              <bttdojo:tableMenuItem operationId="IBK_4_12_ContextMenuOp" type="save" id="menuitem135" text="WithoutValidationByLaunchOperation"/>
                                            </bttdojo:tableMenu>
                                            <bttdojo:tableMenu hasCloseButton="true" leftClickToOpen="false" bindingCellWidgetId="columnId63" position="below">
                                              <bttdojo:tableMenuItem type="noAction" id="D1" text="ECA"/>
                                              <bttdojo:tableMenuItem type="noAction" id="D2" text="ECA2"/>
                                            </bttdojo:tableMenu>
                                            <bttdojo:tableMenu hasCloseButton="true" leftClickToOpen="false" bindingCellWidgetId="columnId73" position="below">
                                              <bttdojo:tableMenuItem newWindow="false" type="link" id="E1" text="launch URL" url="http://www.baidu.com"/>
                                              <bttdojo:tableMenuItem newWindow="true" type="link" id="E2" text="Launch URL in new window" url="http://www.baidu.com"/>
                                            </bttdojo:tableMenu>
                                            <bttdojo:tableMenu hasCloseButton="true" leftClickToOpen="false" bindingCellWidgetId="columnId83" position="below">
                                              <bttdojo:tableMenuItem type="submit" id="menuitem156" flowEvent="eventForMenu" text="SubmitByChangeFlowEvent"/>
                                              <bttdojo:tableMenuItem flowId="IBK_4_12_ContextMenuFlow" type="submit" id="menuitem157" text="SubmitByLaunchNewFlow"/>
                                              <bttdojo:tableMenuItem operationId="IBK_4_12_ContextMenuOp" type="submit" id="menuitem158" text="SubmitByLaunchOperation"/>
                                              <bttdojo:tableMenuItem type="cancel" id="menuitem150" flowEvent="eventForMenu" text="NoDataByChangeFlowEvent"/>
                                              <bttdojo:tableMenuItem flowId="IBK_4_12_ContextMenuFlow" type="cancel" id="menuitem151" text="NoDataByLaunchNewFlow"/>
                                              <bttdojo:tableMenuItem operationId="IBK_4_12_ContextMenuOp" type="cancel" id="menuitem152" text="NoDataByLaunchOperation"/>
                                              <bttdojo:tableMenuItem type="save" id="menuitem153" flowEvent="eventForMenu" text="WithoutValidationByChangeFlowEvent"/>
                                              <bttdojo:tableMenuItem flowId="IBK_4_12_ContextMenuFlow" type="save" id="menuitem154" text="WithoutValidationByLaunchNewFlow"/>
                                              <bttdojo:tableMenuItem operationId="IBK_4_12_ContextMenuOp" type="save" id="menuitem155" text="WithoutValidationByLaunchOperation"/>
                                            </bttdojo:tableMenu>
                                          </bttdojo:table>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                            <div id="NonEditableTableInTabbedPane_panel05" class="BTTTableStyle">
                                              <div class="BTTRowStyle">
                                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                                  <bttdojo:textbox id="NonEditableTableInTabbedPane_text" dataName="DataOutOfTable1" required="true"/>
                                                </div>
                                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="submitButton">                                                  <bttdojo:label id="NonEditableTableInTabbedPane_label15" text="The textbox is mandotary"/>
</div>                                                </div>
                                              </div>
                                            </div>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:checkbox id="NonEditableTableInTabbedPane_checkBox" dataName="DataOutOfTable2" checkedValue="Smile" unCheckedValue="Cry" text="Do you feel Happy?"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:combo id="NonEditableTableInTabbedPane_combo" dataName="DataOutOfTable3" storeURL="listFiles/tradeTimeForCombo.js" typeAhead="false"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:label id="NonEditableTableInTabbedPane_label06" text="Submit"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:button id="NonEditableTableInTabbedPane_button02" type="submit" text="Submit By ChangeFlowEvent" flowEvent="eventForMenu"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:button id="NonEditableTableInTabbedPane_button04" type="submit" text="Submit By Launch New Flow" flowId="IBK_4_12_ContextMenuFlow" flowEvent="start"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:button id="NonEditableTableInTabbedPane_button05" type="submit" text="Submit By LaunchOperation" operationId="IBK_4_12_ContextMenuOp"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:label id="NonEditableTableInTabbedPane_label04" text="Submit with no data(Cancel)"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:button id="NonEditableTableInTabbedPane_button03" type="cancel" text="Submit with no data(Cancel)" flowEvent="eventForMenu"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:button id="NonEditableTableInTabbedPane_Button02" type="cancel" text="Cancel By Launch New Flow" flowId="IBK_4_12_ContextMenuFlow" flowEvent="start"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:button id="NonEditableTableInTabbedPane_button06" type="cancel" text="Cancel By Launch Operation" operationId="IBK_4_12_ContextMenuOp"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:label id="NonEditableTableInTabbedPane_label05" text="Submit without validation(Save)"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:button id="NonEditableTableInTabbedPane_Button01" type="save" text="Save By ChangeFlowEvent" flowEvent="eventForMenu"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:button id="NonEditableTableInTabbedPane_button07" type="save" text="Save By Launch New Flow" flowId="IBK_4_12_ContextMenuFlow" flowEvent="start"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:button id="NonEditableTableInTabbedPane_button08" type="save" text="Save By Launch Operation" operationId="IBK_4_12_ContextMenuOp"/>
                                        </div>
                                      </div>
                                    </div>
                                </bttdojo:form>
                                </div>
                              </div>
                            </div>
                        </bttdojo:contentpane>
                          <bttdojo:contentpane id="NonEditableTableInTabbedPane_ContentPane08" title="SingleSelectionMode">
                            <div class="BTTTableStyle">
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:form id="NonEditableTableInTabbedPane_form02_copy" errorPage="NonEditableTablePage/NonEditableTableInTabbedPane.jsp">
                                    <div class="BTTTableStyle">
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="submitButton">                                          <bttdojo:label id="NonEditableTableInTabbedPane_label07_copy" text="Test ContextMenu:1.Link is hasCloseButton=false,leftClickToOpen=false,position=point;"/>
</div>                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="submitButton">                                          <bttdojo:label id="NonEditableTableInTabbedPane_label08_copy" text="Test ContextMenu:2.Button is hasCloseButton=true,leftClickToOpen=true,position=below;"/>
</div>                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:label id="NonEditableTableInTabbedPane_label10_copy" text="This selectionMode  of Table is Single.DataName is KColl"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                            <div id="NonEditableTableInTabbedPane_Panel04" class="BTTTableStyle">
                                              <div class="BTTRowStyle">
                                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                                  <bttdojo:label id="NonEditableTableInTabbedPane_label14" text="ECA result"/>
                                                </div>
                                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                                  <bttdojo:label id="NonEditableTableInTabbedPane_label17" text="Label"/>
                                                </div>
                                              </div>
                                            </div>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:table id="NonEditableTableInTabbedPane_table_single" dataName="SingleSelectData" dataNameForList="forTableLinkList" selectionMode="single" frozenColumnNum="2" width="500px" isPageable="false">
                                            <bttdojo:column widget="Button" rowSpan="1" level="1" align="left" showTooltip="true" width="80" tooltipPosition="left" flowEvent="eventForMenu" columnTooltip="Column2" dataName="Column2" id="columnId11" repeat="true" headerVAlign="left" colSpan="1" hidden="false" headerHAlign="left" text="Button" newWindow="false" noresize="false"/>
                                            <bttdojo:column widget="Link" rowSpan="1" level="1" align="left" showTooltip="true" width="80" tooltipPosition="left" columnTooltip="ContentMenu_Link_NoAction" dataNameForLink="forLink" dataName="ContentMenu_Link_NoAction" renderMode="text" id="columnId31" repeat="true" headerVAlign="left" colSpan="1" hidden="false" headerHAlign="left" text="LinkECA" newWindow="false" noresize="false"/>
                                            <bttdojo:column rowSpan="1" widget="Link" level="1" align="left" showTooltip="true" width="80" columnTooltip="ContentMenu_Link_URLAndSubmit" dataNameForLink="forLink" dataName="ContentMenu_Link_URLAndSubmit" renderMode="text" id="columnId41" repeat="true" headerVAlign="left" colSpan="1" hidden="false" headerHAlign="left" text="LinkURL" newWindow="false" noresize="false"/>
                                            <bttdojo:column widget="Link" rowSpan="1" level="1" align="left" showTooltip="true" width="80" tooltipPosition="below" columnTooltip="ContentMenu_Link_CancelAndSave" dataNameForLink="forLink" dataName="ContentMenu_Link_CancelAndSave" renderMode="text" id="columnId51" repeat="true" headerVAlign="left" colSpan="1" hidden="false" headerHAlign="left" text="LinkSubmit" newWindow="false" noresize="false"/>
                                            <bttdojo:column widget="Button" rowSpan="1" level="1" align="left" showTooltip="true" width="80" tooltipPosition="above" flowEvent="eventForMenu" columnTooltip="ContentMenu_Button_NoAction" dataName="ContentMenu_Button_NoAction" id="columnId61" repeat="true" headerVAlign="left" colSpan="1" hidden="false" headerHAlign="left" text="ButtonECA" newWindow="false" noresize="false"/>
                                            <bttdojo:column level="1" rowSpan="1" widget="Button" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" flowEvent="eventForMenu" text="ButtonURL" newWindow="false" dataName="ContentMenu_Button_URLAndSubmit" noresize="false" repeat="true" id="columnId71" headerVAlign="left"/>
                                            <bttdojo:column rowSpan="1" widget="Button" level="1" align="left" showTooltip="true" width="80" flowEvent="eventForMenu" columnTooltip="ContentMenu_Button_CancelAndSave" dataName="ContentMenu_Button_CancelAndSave" id="columnId81" repeat="true" headerVAlign="left" colSpan="1" hidden="false" headerHAlign="left" text="ButtonSubmit" newWindow="false" noresize="false"/>
                                            <bttdojo:tableMenu hasCloseButton="false" leftClickToOpen="false" bindingCellWidgetId="columnId31" position="point">
                                              <bttdojo:tableMenuItem type="noAction" id="menu0_item0" text="getCellValueByName(ContentMenu_Link_NoAction)"/>
                                              <bttdojo:tableMenuItem type="noAction" id="menu0_item1" text="getCellValueByIndex(5) "/>
                                            </bttdojo:tableMenu>
                                            <bttdojo:tableMenu hasCloseButton="false" leftClickToOpen="false" bindingCellWidgetId="columnId41" position="point">
                                              <bttdojo:tableMenuItem newWindow="false" type="link" id="menu1_item0" text="launch URL " url="http://www.baidu.com"/>
                                              <bttdojo:tableMenuItem newWindow="true" type="link" id="menu1_item1" text="launch URL in new window" url="http://www.baidu.com"/>
                                            </bttdojo:tableMenu>
                                            <bttdojo:tableMenu hasCloseButton="false" leftClickToOpen="false" bindingCellWidgetId="columnId51" position="point">
                                              <bttdojo:tableMenuItem type="submit" id="menu2_item0" flowEvent="eventForMenu" text="SubmitByChangeFlowEvent"/>
                                              <bttdojo:tableMenuItem flowId="IBK_4_12_ContextMenuFlow" type="submit" id="menu2_item1" text="SubmitLaunchNewFlow"/>
                                              <bttdojo:tableMenuItem operationId="IBK_4_12_ContextMenuOp" type="submit" id="menu2_item2" text="SubmitLaunchOperation"/>
                                              <bttdojo:tableMenuItem type="cancel" id="menu2_item3" flowEvent="eventForMenu" text="NodataByChangeFlowEvent"/>
                                              <bttdojo:tableMenuItem flowId="IBK_4_12_ContextMenuFlow" type="cancel" id="menu2_item4" text="NodataLaunchNewFlow"/>
                                              <bttdojo:tableMenuItem operationId="IBK_4_12_ContextMenuOp" type="cancel" id="menu2_item5" text="NodataLaunchOperation"/>
                                              <bttdojo:tableMenuItem type="save" id="menu2_item6" flowEvent="eventForMenu" text="WithoutValidationByChangeFlowEvent"/>
                                              <bttdojo:tableMenuItem flowId="IBK_4_12_ContextMenuFlow" type="save" id="menu2_item7" text="WithoutValidationLaunchNewFlow"/>
                                              <bttdojo:tableMenuItem operationId="IBK_4_12_ContextMenuOp" type="save" id="menu2_item8" text="WithoutValidationLaunchOperation"/>
                                            </bttdojo:tableMenu>
                                            <bttdojo:tableMenu hasCloseButton="true" leftClickToOpen="true" bindingCellWidgetId="columnId61" position="below">
                                              <bttdojo:tableMenuItem type="noAction" id="menu3_item0" text="TEST_ECA_01"/>
                                              <bttdojo:tableMenuItem type="noAction" id="menu3_item1" text="TEST_ECA_02"/>
                                            </bttdojo:tableMenu>
                                            <bttdojo:tableMenu hasCloseButton="true" leftClickToOpen="true" bindingCellWidgetId="columnId71" position="below">
                                              <bttdojo:tableMenuItem newWindow="false" type="link" id="menu4_item0" text="launch URL" url="http://www.baidu.com"/>
                                              <bttdojo:tableMenuItem newWindow="true" type="link" id="menu4_item1" text="launch URL in new window" url="http://www.baidu.com"/>
                                            </bttdojo:tableMenu>
                                            <bttdojo:tableMenu hasCloseButton="true" leftClickToOpen="true" bindingCellWidgetId="columnId81" position="below">
                                              <bttdojo:tableMenuItem type="submit" id="menu5_item0" flowEvent="eventForMenu" text="SubmitByChangeFlowEvent"/>
                                              <bttdojo:tableMenuItem flowId="IBK_4_12_ContextMenuFlow" type="submit" id="menu5_item1" text="SubmitByLaunchNewFlow"/>
                                              <bttdojo:tableMenuItem operationId="IBK_4_12_ContextMenuOp" type="submit" id="menu5_item2" text="SubmitByLaunchNewOperation"/>
                                              <bttdojo:tableMenuItem type="cancel" id="menu5_item3" flowEvent="eventForMenu" text="NodataByChangeFlowEvent"/>
                                              <bttdojo:tableMenuItem flowId="IBK_4_12_ContextMenuFlow" type="cancel" id="menu5_item4" text="NodataLaunchNewFlow"/>
                                              <bttdojo:tableMenuItem operationId="IBK_4_12_ContextMenuOp" type="cancel" id="menu5_item5" text="NodataLaunchNewOperation"/>
                                              <bttdojo:tableMenuItem type="save" id="menu5_item6" flowEvent="eventForMenu" text="WithoutValidationChangeFlowEvent"/>
                                              <bttdojo:tableMenuItem flowId="IBK_4_12_ContextMenuFlow" type="save" id="menu5_item7" text="WithoutValidationLaunchNewFlow"/>
                                              <bttdojo:tableMenuItem operationId="IBK_4_12_ContextMenuOp" type="save" id="menu5_item8" text="WithoutValidationLaunchNewOperation"/>
                                            </bttdojo:tableMenu>
                                          </bttdojo:table>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:textbox id="NonEditableTableInTabbedPane_text_copy" dataName="DataOutOfTable1" required="false"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:checkbox id="NonEditableTableInTabbedPane_checkBox_copy" dataName="DataOutOfTable2" checkedValue="Smile" unCheckedValue="Cry" text="Do you feel Happy?"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:combo id="NonEditableTableInTabbedPane_combo_copy" dataName="DataOutOfTable3" storeURL="listFiles/City.js"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:label id="NonEditableTableInTabbedPane_label06_copy" text="Submit"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:button id="NonEditableTableInTabbedPane_button02_copy" type="submit" text="Submit By ChangeFlowEvent" flowEvent="eventForMenu"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:button id="NonEditableTableInTabbedPane_button04_copy" type="submit" text="Submit By Launch New Flow" flowId="IBK_4_12_ContextMenuFlow" flowEvent="start"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:button id="NonEditableTableInTabbedPane_button05_copy" type="submit" text="Submit By LaunchOperation" operationId="IBK_4_12_ContextMenuOp"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:label id="NonEditableTableInTabbedPane_label04_copy" text="Submit with no data(Cancel)"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:button id="NonEditableTableInTabbedPane_button03_copy" type="cancel" text="Submit with no data(Cancel)" flowEvent="eventForMenu"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:button id="NonEditableTableInTabbedPane_Button02_copy" type="cancel" text="Cancel By Launch New Flow" flowId="IBK_4_12_ContextMenuFlow" flowEvent="start"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:button id="NonEditableTableInTabbedPane_button06_copy" type="cancel" text="Cancel By Launch Operation" operationId="IBK_4_12_ContextMenuOp"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:label id="NonEditableTableInTabbedPane_label05_copy" text="Submit without validation(Save)"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:button id="NonEditableTableInTabbedPane_Button01_copy" type="save" text="Save By ChangeFlowEvent" flowEvent="eventForMenu"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:button id="NonEditableTableInTabbedPane_button07_copy" type="save" text="Save By Launch New Flow" flowId="IBK_4_12_ContextMenuFlow" flowEvent="start"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:button id="NonEditableTableInTabbedPane_button08_copy" type="save" text="Save By Launch Operation" operationId="IBK_4_12_ContextMenuOp"/>
                                        </div>
                                      </div>
                                    </div>
                                </bttdojo:form>
                                </div>
                              </div>
                            </div>
                        </bttdojo:contentpane>
                          <bttdojo:contentpane id="NonEditableTableInTabbedPane_ContentPane07" title="MutipleSelectionMode">
                            <div class="BTTTableStyle">
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:form id="NonEditableTableInTabbedPane_form02_copy01" errorPage="NonEditableTablePage/NonEditableTableInTabbedPane.jsp">
                                    <div class="BTTTableStyle">
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:label id="NonEditableTableInTabbedPane_label07_copy01" text="Test ContextMenu:1.Link is hasCloseButton=true,leftClickToOpen=true,position=point;"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:label id="NonEditableTableInTabbedPane_label08_copy01" text="Test ContextMenu:2.Button is hasCloseButton=false,leftClickToOpen=false,position=below;"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:label id="NonEditableTableInTabbedPane_label10_copy01" text="This selectionMode of Table is Mutiple.DataName is IColl"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                            <div id="NonEditableTableInTabbedPane_panel03" class="BTTTableStyle">
                                              <div class="BTTRowStyle">
                                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                                  <bttdojo:label id="NonEditableTableInTabbedPane_label11" text="ItemId testing result"/>
                                                </div>
                                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                                  <bttdojo:label id="NonEditableTableInTabbedPane_show1" text="Label"/>
                                                </div>
                                              </div>
                                            </div>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                            <div id="NonEditableTableInTabbedPane_Panel03" class="BTTTableStyle">
                                              <div class="BTTRowStyle">
                                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                                  <bttdojo:label id="NonEditableTableInTabbedPane_label13" text="WidgetId testing result"/>
                                                </div>
                                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                                  <bttdojo:label id="NonEditableTableInTabbedPane_show2" text="Label"/>
                                                </div>
                                              </div>
                                            </div>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:table id="NonEditableTableInTabbedPane_table_mutiple" dataName="MutipleSelectData" dataNameForList="forTableLinkList" selectionMode="multiple" selectionRequired="true" isPageable="false">
                                            <bttdojo:column widget="Link" rowSpan="1" level="1" align="left" showTooltip="true" width="80" linkText="abc" tooltipPosition="left" flowEvent="to group page" columnTooltip="Column3" dataName="Column3" renderMode="text" id="columnId22" repeat="true" headerVAlign="left" colSpan="1" hidden="false" headerHAlign="left" text="%nls.testtable/Rate" newWindow="false" noresize="false"/>
                                            <bttdojo:column widget="Link" rowSpan="1" level="1" align="left" showTooltip="true" width="80" tooltipPosition="left" columnTooltip="ContentMenu_Link_NoAction" dataNameForLink="ContentMenu_Link_NoAction" dataName="ContentMenu_Link_NoAction" renderMode="text" id="columnId32" repeat="true" headerVAlign="left" colSpan="1" hidden="false" headerHAlign="left" text="LinkECA" newWindow="true" noresize="false"/>
                                            <bttdojo:column rowSpan="1" widget="Link" level="1" align="left" showTooltip="true" width="80" columnTooltip="ContentMenu_Link_URLAndSubmit" dataNameForLink="ContentMenu_Link_URLAndSubmit" dataName="ContentMenu_Link_URLAndSubmit" renderMode="text" id="columnId42" repeat="true" headerVAlign="left" colSpan="1" hidden="false" headerHAlign="left" text="LinkURL" newWindow="false" noresize="false"/>
                                            <bttdojo:column widget="Link" rowSpan="1" level="1" align="left" showTooltip="true" width="80" tooltipPosition="below" columnTooltip="ContentMenu_Link_CancelAndSave" dataNameForLink="ContentMenu_Link_CancelAndSave" dataName="ContentMenu_Link_CancelAndSave" renderMode="text" id="columnId52" repeat="true" headerVAlign="left" colSpan="1" hidden="false" headerHAlign="left" text="LinkSubmit" newWindow="false" noresize="false"/>
                                            <bttdojo:column widget="Button" rowSpan="1" level="1" align="left" showTooltip="true" width="80" tooltipPosition="above" flowEvent="eventForMenu" columnTooltip="ContentMenu_Button_NoAction" dataName="ContentMenu_Button_NoAction" id="columnId62" repeat="true" headerVAlign="left" colSpan="1" hidden="false" headerHAlign="left" text="ButtonECA" newWindow="false" noresize="false"/>
                                            <bttdojo:column level="1" rowSpan="1" widget="Button" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" flowEvent="eventForMenu" text="ButtonURL" newWindow="false" dataName="ContentMenu_Button_URLAndSubmit" noresize="false" repeat="true" id="columnId72" headerVAlign="left"/>
                                            <bttdojo:column rowSpan="1" widget="Button" level="1" align="left" showTooltip="true" width="80" flowEvent="eventForMenu" columnTooltip="ContentMenu_Button_CancelAndSave" dataName="ContentMenu_Button_CancelAndSave" id="columnId82" repeat="true" headerVAlign="left" colSpan="1" hidden="false" headerHAlign="left" text="ButtonSubmit" newWindow="false" noresize="false"/>
                                            <bttdojo:tableMenu hasCloseButton="true" leftClickToOpen="true" bindingCellWidgetId="columnId32" position="point">
                                              <bttdojo:tableMenuItem type="noAction" id="700" text="ECA"/>
                                              <bttdojo:tableMenuItem type="noAction" id="701" text="ECA2"/>
                                            </bttdojo:tableMenu>
                                            <bttdojo:tableMenu hasCloseButton="true" leftClickToOpen="true" bindingCellWidgetId="columnId42" position="point">
                                              <bttdojo:tableMenuItem newWindow="false" type="link" id="menuitem0" text="launch URL" url="http://www.baidu.com"/>
                                              <bttdojo:tableMenuItem newWindow="true" type="link" id="menuitem1" text="launch URL in new window" url="http://www.baidu.com"/>
                                            </bttdojo:tableMenu>
                                            <bttdojo:tableMenu hasCloseButton="true" leftClickToOpen="true" bindingCellWidgetId="columnId52" position="point">
                                              <bttdojo:tableMenuItem type="submit" id="menu2_item0" flowEvent="eventForMenu" text="SubmitByChangeFlowEvent"/>
                                              <bttdojo:tableMenuItem flowId="IBK_4_12_ContextMenuFlow" type="submit" id="menu2_item1" text="SubmitLaunchNewFlow"/>
                                              <bttdojo:tableMenuItem operationId="IBK_4_12_ContextMenuOp" type="submit" id="menu2_item2" text="SubmitLaunchNewOperation"/>
                                              <bttdojo:tableMenuItem type="cancel" id="menu2_item3" flowEvent="eventForMenu" text="NoDataByChangeFlowEvent"/>
                                              <bttdojo:tableMenuItem flowId="IBK_4_12_ContextMenuFlow" type="cancel" id="menu2_item4" text="NoDataLaunchNewFlow"/>
                                              <bttdojo:tableMenuItem operationId="IBK_4_12_ContextMenuOp" type="cancel" id="menu2_item5" text="NoDataLaunchNewOpertion"/>
                                              <bttdojo:tableMenuItem type="save" id="menu2_item6" flowEvent="eventForMenu" text="WithoutValidationByChangeFlowEvent"/>
                                              <bttdojo:tableMenuItem flowId="IBK_4_12_ContextMenuFlow" type="save" id="menu2_item7" text="WithoutValidationLaunchNewFlow"/>
                                              <bttdojo:tableMenuItem operationId="IBK_4_12_ContextMenuOp" type="save" id="menu2_item8" text="WithoutValidationLaunchNewOperation"/>
                                            </bttdojo:tableMenu>
                                            <bttdojo:tableMenu hasCloseButton="false" leftClickToOpen="false" bindingCellWidgetId="columnId62" position="below">
                                              <bttdojo:tableMenuItem type="noAction" id="730" text="NoAction"/>
                                              <bttdojo:tableMenuItem type="noAction" id="731" text="%nls.bttsample/lang_English"/>
                                            </bttdojo:tableMenu>
                                            <bttdojo:tableMenu hasCloseButton="false" leftClickToOpen="false" bindingCellWidgetId="columnId72" position="below">
                                              <bttdojo:tableMenuItem newWindow="false" type="link" id="menuitem0" text="launch URL" url="http://www.baidu.com"/>
                                              <bttdojo:tableMenuItem newWindow="true" type="link" id="menuitem1" text="launch URL in new window" url="http://www.baidu.com"/>
                                            </bttdojo:tableMenu>
                                            <bttdojo:tableMenu hasCloseButton="false" leftClickToOpen="false" bindingCellWidgetId="columnId82" position="below">
                                              <bttdojo:tableMenuItem type="submit" id="menuitem0" flowEvent="eventForMenu" text="SubmitByChangeFlowEvent"/>
                                              <bttdojo:tableMenuItem flowId="IBK_4_12_ContextMenuFlow" type="submit" id="menuitem1" text="SubmitLaunchNewFlow"/>
                                              <bttdojo:tableMenuItem operationId="IBK_4_12_ContextMenuOp" type="submit" id="menuitem2" text="SubmitLaunchNewOperation"/>
                                              <bttdojo:tableMenuItem type="cancel" id="menuitem3" flowEvent="eventForMenu" text="NoDataByChangeFlowEvent"/>
                                              <bttdojo:tableMenuItem flowId="IBK_4_12_ContextMenuFlow" type="cancel" id="menuitem4" text="NoDataLaunchNewFlow"/>
                                              <bttdojo:tableMenuItem operationId="IBK_4_12_ContextMenuOp" type="cancel" id="menuitem5" text="NoDataLaunchNewOpertion"/>
                                              <bttdojo:tableMenuItem type="save" id="menu5_item0" flowEvent="eventForMenu" text="WithoutValidationByChangeFlowEvent"/>
                                              <bttdojo:tableMenuItem flowId="IBK_4_12_ContextMenuFlow" type="save" id="menu5_item1" text="WithoutValidationLaunchNewFlow"/>
                                              <bttdojo:tableMenuItem operationId="IBK_4_12_ContextMenuOp" type="save" id="menu5_item2" text="WithoutValidationLaunchNewOperation"/>
                                            </bttdojo:tableMenu>
                                          </bttdojo:table>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:textbox id="NonEditableTableInTabbedPane_text_copy01" dataName="DataOutOfTable1" required="false"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:checkbox id="NonEditableTableInTabbedPane_checkBox_copy01" dataName="DataOutOfTable2" checkedValue="Smile" unCheckedValue="Cry" text="Do you feel Happy?"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:combo id="NonEditableTableInTabbedPane_combo_copy01" dataName="DataOutOfTable3" storeURL="listFiles/City.js"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:label id="NonEditableTableInTabbedPane_label06_copy01" text="Submit"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:button id="NonEditableTableInTabbedPane_button02_copy01" type="submit" text="Submit By ChangeFlowEvent" flowEvent="eventForMenu"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:button id="NonEditableTableInTabbedPane_button04_copy01" type="submit" text="Submit By Launch New Flow" flowId="IBK_4_12_ContextMenuFlow" flowEvent="start"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:button id="NonEditableTableInTabbedPane_button05_copy01" type="submit" text="Submit By LaunchOperation" operationId="IBK_4_12_ContextMenuOp"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:label id="NonEditableTableInTabbedPane_label04_copy01" text="Submit with no data(Cancel)"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:button id="NonEditableTableInTabbedPane_button03_copy01" type="cancel" text="Submit with no data(Cancel)" flowEvent="eventForMenu"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:button id="NonEditableTableInTabbedPane_Button02_copy01" type="cancel" text="Cancel By Launch New Flow" flowId="IBK_4_12_ContextMenuFlow" flowEvent="start"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:button id="NonEditableTableInTabbedPane_button06_copy01" type="cancel" text="Cancel By Launch Operation" operationId="IBK_4_12_ContextMenuOp"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:label id="NonEditableTableInTabbedPane_label05_copy01" text="Submit without validation(Save)"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:button id="NonEditableTableInTabbedPane_Button01_copy01" type="save" text="Save By ChangeFlowEvent" flowEvent="eventForMenu"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:button id="NonEditableTableInTabbedPane_button07_copy01" type="save" text="Save By Launch New Flow" flowId="IBK_4_12_ContextMenuFlow" flowEvent="start"/>
                                        </div>
                                      </div>
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:button id="NonEditableTableInTabbedPane_button08_copy01" type="save" text="Save By Launch Operation" operationId="IBK_4_12_ContextMenuOp"/>
                                        </div>
                                      </div>
                                    </div>
                                </bttdojo:form>
                                </div>
                              </div>
                            </div>
                        </bttdojo:contentpane>
                      </bttdojo:tabbedpane>
                      </td>
                    </tr>
                  </table>
              </div>
            </div>
          </div>
      </div>
    </div>
  </div>

<!-- applet id="printApplet" name="printApplet" code="com.ibm.btt.print.applets.PrintrApplet" codebase="applets" archive="bttprint.jar,JSON4J.jar" style="width:0px; height:0px;"></applet-->
</body>
</html>