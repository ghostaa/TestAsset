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
<!-- Generated from SettledBill.xui by mashuai, on Fri Jan 17 15:16:00 CST 2014 -->
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
  <div id="SettledBill_panel" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:form id="SettledBill_form" errorPage="B001/SettledBill.jsp">
          <table>
            <tr>
              <td align="left" valign="middle" style="width:187px;vertical-align:middle;">
                <bttdojo:label id="SettledBill_label04" text="Selected Row Num"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="SettledBill_label05" dataName="RowNum" text="Label"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="width:187px;vertical-align:middle;">
                <bttdojo:label id="SettledBill_label" text="%nls.testb001/queryUnsettledBill"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
            <tr>
              <td align="right" valign="middle" style="width:187px;height:40px;vertical-align:middle;">
                <bttdojo:label id="SettledBill_label01" text="%nls.testb001/Bill_CurType"/>
              </td>
              <td align="left" valign="middle" style="height:40px;vertical-align:middle;">
                <bttdojo:combo id="SettledBill_combo" dataName="SearchCondition.CurType" storeURL="listFiles/curType.js" typeAhead="false"/>
              </td>
            </tr>
            <tr>
              <td align="right" valign="middle" style="width:187px;vertical-align:middle;">
                <bttdojo:label id="SettledBill_label03" text="%nls.testb001/Time_Period"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:select id="SettledBill_selectList" dataName="SearchCondition.TimePeriod" storeURL="listFiles/timePeriod.js"/>
              </td>
            </tr>
            <tr>
              <td align="center" valign="middle" style="width:187px;vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:button id="SettledBill_button" type="submit" text="%nls.testb001/Confirm" flowEvent="search"/>
              </td>
            </tr>
            <tr>
              <td colspan="2" align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
            <tr>
              <td colspan="2" align="left" valign="middle" style="vertical-align:middle;">
                  <div style="width:663px;" id="SettledBill_panel01" class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:table id="SettledBill_table01" dataNameForList="SettledBillList01" isPageable="false">
                          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="%nls.testb001/Bill_Date" dataName="BillDate" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
                          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="%nls.testb001/PaymentDueDate" dataName="PaymentDueDate" noresize="false" repeat="true" id="columnId1" headerVAlign="left"/>
                          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="%nls.testb001/CurBillNeedPay" dataName="CurBillNeedPay" noresize="false" repeat="true" id="columnId2" headerVAlign="left"/>
                          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="%nls.testb001/MinBill" dataName="MinBill" noresize="false" repeat="true" id="columnId3" headerVAlign="left"/>
                        </bttdojo:table>
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:table id="SettledBill_table02" dataNameForList="SettledBillList02" isPageable="false">
                          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="%nls.testb001/LastBillBalance" dataName="LastBillBalance" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
                          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="%nls.testb001/CurBillAlreadyPay" dataName="CurBillAlreadyPay" noresize="false" repeat="true" id="columnId1" headerVAlign="left"/>
                          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="%nls.testb001/NewAddBill" dataName="NewAddBill" noresize="false" repeat="true" id="columnId2" headerVAlign="left"/>
                          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="%nls.testb001/Withdrawl" dataName="Withdrawl" noresize="false" repeat="true" id="columnId3" headerVAlign="left"/>
                          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="%nls.testb001/Interest" dataName="Interest" noresize="false" repeat="true" id="columnId4" headerVAlign="left"/>
                          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="%nls.testb001/CurBillBalance" dataName="CurBillBalance" noresize="false" repeat="true" id="columnId5" headerVAlign="left"/>
                        </bttdojo:table>
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:table id="SettledBill_table" dataNameForList="SettledBillList" isPageable="true" operationName="PAG_B001$SettledBill_table" directPagination="true" paginationWhenLoading="true" rowsPerPage="10" timeout="8000">
                          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="%nls.testb001/Short_AcctNo" dataName="ShortAcctNo" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
                          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="%nls.testb001/TradeDate" dataName="TradeDate" noresize="false" repeat="true" id="columnId1" headerVAlign="left"/>
                          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="%nls.testb001/BookDate" dataName="BookDate" noresize="false" repeat="true" id="columnId2" headerVAlign="left"/>
                          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="%nls.testb001/TradeType" dataName="TradeType" noresize="false" repeat="true" id="columnId3" headerVAlign="left"/>
                          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="%nls.testb001/Trade_CurType" dataName="CurType" noresize="false" repeat="true" id="columnId4" headerVAlign="left"/>
                          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="%nls.testb001/Amount" dataName="Amount" noresize="false" repeat="true" id="columnId5" headerVAlign="left"/>
                          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="%nls.testb001/Comments" dataName="Comments" noresize="false" repeat="true" id="columnId6" headerVAlign="left"/>
                        </bttdojo:table>
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="center" style="vertical-align:middle;">
                          <div id="SettledBill_panel02" class="BTTTableStyle">
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:button id="SettledBill_button02" type="button" text="%nls.testb001/print"/>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:button id="SettledBill_button03" type="button" text="%nls.testb001/download"/>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:button id="SettledBill_button01" type="submit" text="%nls.testb001/Close" flowEvent="close"/>
                              </div>
                            </div>
                          </div>
                      </div>
                    </div>
                  </div>
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