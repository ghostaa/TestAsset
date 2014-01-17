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
<!-- Generated from FTInTabbedPane.xui by mashuai, on Fri Jan 17 15:17:18 CST 2014 -->
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
  <div id="FTInTabbedPane_panel" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:top;">
        <bttdojo:form id="FTInTabbedPane_form" errorPage="PaginationTablePage/FT/FTInTabbedPane.jsp">
          <div class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:top;">
                  <div id="FTInTabbedPane_panel01" class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:a id="FTInTabbedPane_link" text="FTtable" flowEvent="returnToTFTable"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="FTInTabbedPane_label" text="-> FTInTabbedPane"/>
                      </div>
                    </div>
                  </div>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:top;">
                <bttdojo:tabbedpane id="FTInTabbedPane_tabbedPane">
                  <bttdojo:contentpane id="FTInTabbedPane_ContentPane01" title="NormalTab">
                    <div class="BTTTableStyle">
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:table id="FTInTabbedPane_tableFT" dataNameForList="AccountInfoList" isPageable="true" operationName="PAG_PaginationTablePage$FT$FTInTabbedPane_tableFT" directPagination="false" paginationWhenLoading="true" rowsPerPage="10" timeout="9999999999">
                            <bttdojo:column level="1" rowSpan="1" widget="TextBox" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" tooltipPosition="left" columnTooltip="AccountName" text="%nls.testtable/AccountName" dataName="AccountName" noresize="false" type="String" repeat="true" headerVAlign="left"/>
                            <bttdojo:column level="1" rowSpan="1" widget="Select" align="left" showTooltip="true" width="80" valueField="valueField" tooltipPosition="left" columnTooltip="AccountType" dataName="AccountType" repeat="true" headerVAlign="left" labelField="labelField" colSpan="1" headerHAlign="left" text="%nls.testtable/AccountType" dataNameForList="AccountTypeForSelect" noresize="false"/>
                            <bttdojo:column level="1" rowSpan="1" widget="Select" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" tooltipPosition="right" columnTooltip="TradeTime" text="%nls.testtable/TradeTime" storeURL="listFiles/tradeTimeForSelect.js" dataName="TradeTime" noresize="false" repeat="true" headerVAlign="left"/>
                            <bttdojo:column numberType="bigDecimal" level="1" rowSpan="1" widget="TextBox" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" tooltipPosition="below" columnTooltip="MaximumAmount" text="%nls.testtable/MaximumAmount" dataName="MaximumAmount" noresize="false" type="Number" repeat="true" headerVAlign="left" decimalPlaces="3"/>
                            <bttdojo:column level="1" rowSpan="1" widget="TextBox" align="left" showTooltip="true" width="100" colSpan="1" headerHAlign="left" tooltipPosition="above" columnTooltip="AccountOpeningDate" text="%nls.testtable/AccountOpeningDate" pattern="yyyy-MM-dd" dataName="AccountOpeningDate" noresize="false" type="Date" repeat="true" headerVAlign="left"/>
                            <bttdojo:column numberType="bigDecimal" level="1" rowSpan="1" widget="TextBox" align="left" width="80" headerHAlign="left" colSpan="1" text="%nls.testtable/AccountBlance" currency="USD" dataName="AccountBlance" noresize="false" type="Currency" repeat="true" headerVAlign="left"/>
                            <bttdojo:column level="1" rowSpan="1" widget="ComboBox" align="left" width="80" headerHAlign="left" colSpan="1" text="%nls.testtable/Rate" storeURL="listFiles/rateForCombo.js" dataName="Rate" noresize="false" repeat="true" headerVAlign="left"/>
                            <bttdojo:column level="1" rowSpan="1" widget="ComboBox" align="left" width="80" labelField="labelField" headerHAlign="left" colSpan="1" text="%nls.testtable/Localtion" dataNameForList="LocaltionForComboBox" dataName="Localtion" noresize="false" repeat="true" headerVAlign="left"/>
                            <bttdojo:column unCheckedValue="false" level="1" rowSpan="1" widget="CheckBox" align="left" width="80" alwaysEditing="false" headerHAlign="left" colSpan="1" checkedValue="true" text="%nls.testtable/Usable" dataName="Usable" noresize="false" titleStyle="text" repeat="true" headerVAlign="left"/>
                            <bttdojo:column widget="LabelFromList" rowSpan="1" level="1" align="left" noresize="false" dataName="accountAttribution" width="80" colSpan="1" headerHAlign="left" repeat="true" headerVAlign="left" text="%nls.testtable/accountAttribution"/>
                            <bttdojo:column level="1" rowSpan="1" widget="Image" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" tooltipPosition="right" columnTooltip="ImageField" text="%nls.testtable/Image" dataName="ImageField" noresize="false" repeat="true" headerVAlign="left"/>
                          </bttdojo:table>
                        </div>
                      </div>
                    </div>
                </bttdojo:contentpane>
                  <bttdojo:contentpane id="FTInTabbedPane_ContentPane02" title="Group">
                    <div class="BTTTableStyle">
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:top;">
                          <bttdojo:group id="FTInTabbedPane_group" text="Group">
                            <div class="BTTTableStyle">
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:table id="FTInTabbedPane_tableFT1" dataNameForList="AccountInfoList" isPageable="true" operationName="PAG_PaginationTablePage$FT$FTInTabbedPane_tableFT1" directPagination="false" paginationWhenLoading="true" rowsPerPage="10" timeout="9999999999">
                                    <bttdojo:column level="1" rowSpan="1" widget="TextBox" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" tooltipPosition="left" columnTooltip="AccountName" text="%nls.testtable/AccountName" dataName="AccountName" noresize="false" type="String" repeat="true" headerVAlign="left"/>
                                    <bttdojo:column level="1" rowSpan="1" widget="Select" align="left" showTooltip="true" width="80" valueField="valueField" tooltipPosition="left" columnTooltip="AccountType" dataName="AccountType" repeat="true" headerVAlign="left" labelField="labelField" colSpan="1" headerHAlign="left" text="%nls.testtable/AccountType" dataNameForList="AccountTypeForSelect" noresize="false"/>
                                    <bttdojo:column level="1" rowSpan="1" widget="Select" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" tooltipPosition="right" columnTooltip="TradeTime" text="%nls.testtable/TradeTime" storeURL="listFiles/tradeTimeForSelect.js" dataName="TradeTime" noresize="false" repeat="true" headerVAlign="left"/>
                                    <bttdojo:column numberType="bigDecimal" level="1" rowSpan="1" widget="TextBox" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" tooltipPosition="below" columnTooltip="MaximumAmount" text="%nls.testtable/MaximumAmount" dataName="MaximumAmount" noresize="false" type="Number" repeat="true" headerVAlign="left" decimalPlaces="3"/>
                                    <bttdojo:column level="1" rowSpan="1" widget="TextBox" align="left" showTooltip="true" width="100" colSpan="1" headerHAlign="left" tooltipPosition="above" columnTooltip="AccountOpeningDate" text="%nls.testtable/AccountOpeningDate" pattern="yyyy-MM-dd" dataName="AccountOpeningDate" noresize="false" type="Date" repeat="true" headerVAlign="left"/>
                                    <bttdojo:column numberType="bigDecimal" level="1" rowSpan="1" widget="TextBox" align="left" width="80" headerHAlign="left" colSpan="1" text="%nls.testtable/AccountBlance" currency="USD" dataName="AccountBlance" noresize="false" type="Currency" repeat="true" headerVAlign="left"/>
                                    <bttdojo:column level="1" rowSpan="1" widget="ComboBox" align="left" width="80" headerHAlign="left" colSpan="1" text="%nls.testtable/Rate" storeURL="listFiles/rateForCombo.js" dataName="Rate" noresize="false" repeat="true" headerVAlign="left"/>
                                    <bttdojo:column level="1" rowSpan="1" widget="ComboBox" align="left" width="80" labelField="labelField" headerHAlign="left" colSpan="1" text="%nls.testtable/Localtion" dataNameForList="LocaltionForComboBox" dataName="Localtion" noresize="false" repeat="true" headerVAlign="left"/>
                                    <bttdojo:column unCheckedValue="false" level="1" rowSpan="1" widget="CheckBox" align="left" width="80" alwaysEditing="false" headerHAlign="left" colSpan="1" checkedValue="true" text="%nls.testtable/Usable" dataName="Usable" noresize="false" titleStyle="text" repeat="true" headerVAlign="left"/>
                                    <bttdojo:column widget="LabelFromList" rowSpan="1" level="1" align="left" noresize="false" dataName="accountAttribution" width="80" colSpan="1" headerHAlign="left" repeat="true" headerVAlign="left" text="%nls.testtable/accountAttribution"/>
                                    <bttdojo:column level="1" rowSpan="1" widget="Image" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" tooltipPosition="right" columnTooltip="ImageField" text="%nls.testtable/Image" dataName="ImageField" noresize="false" repeat="true" headerVAlign="left"/>
                                  </bttdojo:table>
                                </div>
                              </div>
                            </div>
                        </bttdojo:group>
                        </div>
                      </div>
                    </div>
                </bttdojo:contentpane>
                  <bttdojo:contentpane id="FTInTabbedPane_ContentPane03" title="Pane">
                    <div class="BTTTableStyle">
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:top;">
                          <bttdojo:tabbedpane id="FTInTabbedPane_tabbedPane01">
                            <bttdojo:contentpane id="FTInTabbedPane_ContentPane04" title="Tab01">
                              <div class="BTTTableStyle">
                                <div class="BTTRowStyle">
                                  <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                    <bttdojo:label id="FTInTabbedPane_label01" text="tab01"/>
                                  </div>
                                </div>
                                <div class="BTTRowStyle">
                                  <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                    <bttdojo:table id="FTInTabbedPane_tableFT2" dataNameForList="AccountInfoList" isPageable="true" operationName="PAG_PaginationTablePage$FT$FTInTabbedPane_tableFT2" directPagination="false" paginationWhenLoading="true" rowsPerPage="10" timeout="9999999999">
                                      <bttdojo:column level="1" rowSpan="1" widget="TextBox" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" tooltipPosition="left" columnTooltip="AccountName" text="%nls.testtable/AccountName" dataName="AccountName" noresize="false" type="String" repeat="true" headerVAlign="left"/>
                                      <bttdojo:column level="1" rowSpan="1" widget="Select" align="left" showTooltip="true" width="80" valueField="valueField" tooltipPosition="left" columnTooltip="AccountType" dataName="AccountType" repeat="true" headerVAlign="left" labelField="labelField" colSpan="1" headerHAlign="left" text="%nls.testtable/AccountType" dataNameForList="AccountTypeForSelect" noresize="false"/>
                                      <bttdojo:column level="1" rowSpan="1" widget="Select" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" tooltipPosition="right" columnTooltip="TradeTime" text="%nls.testtable/TradeTime" storeURL="listFiles/tradeTimeForSelect.js" dataName="TradeTime" noresize="false" repeat="true" headerVAlign="left"/>
                                      <bttdojo:column numberType="bigDecimal" level="1" rowSpan="1" widget="TextBox" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" tooltipPosition="below" columnTooltip="MaximumAmount" text="%nls.testtable/MaximumAmount" dataName="MaximumAmount" noresize="false" type="Number" repeat="true" headerVAlign="left" decimalPlaces="3"/>
                                      <bttdojo:column level="1" rowSpan="1" widget="TextBox" align="left" showTooltip="true" width="100" colSpan="1" headerHAlign="left" tooltipPosition="above" columnTooltip="AccountOpeningDate" text="%nls.testtable/AccountOpeningDate" pattern="yyyy-MM-dd" dataName="AccountOpeningDate" noresize="false" type="Date" repeat="true" headerVAlign="left"/>
                                      <bttdojo:column numberType="bigDecimal" level="1" rowSpan="1" widget="TextBox" align="left" width="80" headerHAlign="left" colSpan="1" text="%nls.testtable/AccountBlance" currency="USD" dataName="AccountBlance" noresize="false" type="Currency" repeat="true" headerVAlign="left"/>
                                      <bttdojo:column level="1" rowSpan="1" widget="ComboBox" align="left" width="80" headerHAlign="left" colSpan="1" text="%nls.testtable/Rate" storeURL="listFiles/tradeTimeForCombo.js" dataName="Rate" noresize="false" repeat="true" headerVAlign="left"/>
                                      <bttdojo:column level="1" rowSpan="1" widget="ComboBox" align="left" width="80" labelField="labelField" headerHAlign="left" colSpan="1" text="%nls.testtable/Localtion" dataNameForList="LocaltionForComboBox" dataName="Localtion" noresize="false" repeat="true" headerVAlign="left"/>
                                      <bttdojo:column unCheckedValue="false" level="1" rowSpan="1" widget="CheckBox" align="left" width="80" alwaysEditing="false" headerHAlign="left" colSpan="1" checkedValue="true" text="%nls.testtable/Usable" dataName="Usable" noresize="false" titleStyle="text" repeat="true" headerVAlign="left"/>
                                      <bttdojo:column widget="LabelFromList" rowSpan="1" level="1" align="left" noresize="false" dataName="accountAttribution" width="80" colSpan="1" headerHAlign="left" repeat="true" headerVAlign="left" text="%nls.testtable/accountAttribution"/>
                                      <bttdojo:column level="1" rowSpan="1" widget="Image" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" tooltipPosition="right" columnTooltip="ImageField" text="%nls.testtable/Image" dataName="ImageField" noresize="false" repeat="true" headerVAlign="left"/>
                                    </bttdojo:table>
                                  </div>
                                </div>
                              </div>
                          </bttdojo:contentpane>
                            <bttdojo:contentpane id="FTInTabbedPane_ContentPane05" title="Tab02">
                              <div class="BTTTableStyle">
                                <div class="BTTRowStyle">
                                  <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                    <bttdojo:label id="FTInTabbedPane_label02" text="tab02"/>
                                  </div>
                                </div>
                                <div class="BTTRowStyle">
                                  <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                    <bttdojo:table id="FTInTabbedPane_tableFT3" dataNameForList="AccountInfoList" isPageable="true" operationName="PAG_PaginationTablePage$FT$FTInTabbedPane_tableFT3" directPagination="false" paginationWhenLoading="true" rowsPerPage="10" timeout="9999999999">
                                      <bttdojo:column level="1" rowSpan="1" widget="TextBox" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" tooltipPosition="left" columnTooltip="AccountName" text="%nls.testtable/AccountName" dataName="AccountName" noresize="false" type="String" repeat="true" headerVAlign="left"/>
                                      <bttdojo:column level="1" rowSpan="1" widget="Select" align="left" showTooltip="true" width="80" valueField="valueField" tooltipPosition="left" columnTooltip="AccountType" dataName="AccountType" repeat="true" headerVAlign="left" labelField="labelField" colSpan="1" headerHAlign="left" text="%nls.testtable/AccountType" dataNameForList="AccountTypeForSelect" noresize="false"/>
                                      <bttdojo:column level="1" rowSpan="1" widget="Select" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" tooltipPosition="right" columnTooltip="TradeTime" text="%nls.testtable/TradeTime" storeURL="listFiles/tradeTimeForSelect.js" dataName="TradeTime" noresize="false" repeat="true" headerVAlign="left"/>
                                      <bttdojo:column numberType="bigDecimal" level="1" rowSpan="1" widget="TextBox" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" tooltipPosition="below" columnTooltip="MaximumAmount" text="%nls.testtable/MaximumAmount" dataName="MaximumAmount" noresize="false" type="Number" repeat="true" headerVAlign="left" decimalPlaces="3"/>
                                      <bttdojo:column level="1" rowSpan="1" widget="TextBox" align="left" showTooltip="true" width="100" colSpan="1" headerHAlign="left" tooltipPosition="above" columnTooltip="AccountOpeningDate" text="%nls.testtable/AccountOpeningDate" pattern="yyyy-MM-dd" dataName="AccountOpeningDate" noresize="false" type="Date" repeat="true" headerVAlign="left"/>
                                      <bttdojo:column numberType="bigDecimal" level="1" rowSpan="1" widget="TextBox" align="left" width="80" headerHAlign="left" colSpan="1" text="%nls.testtable/AccountBlance" currency="USD" dataName="AccountBlance" noresize="false" type="Currency" repeat="true" headerVAlign="left"/>
                                      <bttdojo:column level="1" rowSpan="1" widget="ComboBox" align="left" width="80" headerHAlign="left" colSpan="1" text="%nls.testtable/Rate" storeURL="listFiles/rateForCombo.js" dataName="Rate" noresize="false" repeat="true" headerVAlign="left"/>
                                      <bttdojo:column level="1" rowSpan="1" widget="ComboBox" align="left" width="80" labelField="labelField" headerHAlign="left" colSpan="1" text="%nls.testtable/Localtion" dataNameForList="LocaltionForComboBox" dataName="Localtion" noresize="false" repeat="true" headerVAlign="left"/>
                                      <bttdojo:column unCheckedValue="false" level="1" rowSpan="1" widget="CheckBox" align="left" width="80" alwaysEditing="false" headerHAlign="left" colSpan="1" checkedValue="true" text="%nls.testtable/Usable" dataName="Usable" noresize="false" titleStyle="text" repeat="true" headerVAlign="left"/>
                                      <bttdojo:column widget="LabelFromList" rowSpan="1" level="1" align="left" noresize="false" dataName="accountAttribution" width="80" colSpan="1" headerHAlign="left" repeat="true" headerVAlign="left" text="%nls.testtable/accountAttribution"/>
                                      <bttdojo:column level="1" rowSpan="1" widget="Image" align="left" showTooltip="true" width="80" colSpan="1" headerHAlign="left" tooltipPosition="right" columnTooltip="ImageField" text="%nls.testtable/Image" dataName="ImageField" noresize="false" repeat="true" headerVAlign="left"/>
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
              </bttdojo:tabbedpane>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" style="vertical-align:">
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