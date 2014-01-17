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
<!-- Generated from IBKE2E_AccountPay.xui by mashuai, on Fri Jan 17 15:16:57 CST 2014 -->
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

@import "css/master.css";
@import "css/dijit/Label.css";

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
<script type="text/javascript" data-btt-eca="true" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/IBKE2E_AccountPay.js"> </script>
<%request.setAttribute("dse_sessionId", session.getId()); %>
  <div id="IBKE2E_AccountPay_panel" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:form id="IBKE2E_AccountPay_form" errorPage="IBKE2E_AccountPay.jsp">
          <table style="width:400px;">
            <tr>
              <td colspan="2" align="center" valign="middle" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="labelAccountList">                <bttdojo:label id="IBKE2E_AccountPay_label" text="%nls.bttsample/IBKE2E_Account_Transfer"/>
</div>              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
            <tr>
              <td colspan="3" align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="IBKE2E_AccountPay_label01" text="Select an account FROM which money is dispensed"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="width:200px;vertical-align:middle;">
                <bttdojo:select id="IBKE2E_AccountPay_selectList" dataName="FromAccount" dataNameForList="AccountList" labelField="AccountNumber" valueField="AccountNumber"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="IBKE2E_AccountPay_label04" text="Balance($):"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="IBKE2E_AccountPay_availableAmountLabel" dataName="AvailableAmount"/>
              </td>
            </tr>
            <tr>
              <td colspan="3" align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="IBKE2E_AccountPay_label02" text="Select or Input an account TO which money is deposited"/>
              </td>
            </tr>
            <tr>
              <td colspan="2" align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:combo id="IBKE2E_AccountPay_combo" dataName="AccountTransfer.ToAccount" dataNameForList="AccountList" labelField="AccountNumber" valueField="AccountNumber" required="true" hint="demo req 6: combo box typeAhead property and label/value fields"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
            <tr>
              <td colspan="3" align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="IBKE2E_AccountPay_label03" text="Please enter the amount of money to be transferred"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="width:200px;vertical-align:middle;">
                <bttdojo:textbox id="IBKE2E_AccountPay_amountText" dataName="AccountTransfer.Amount" type="Number" required="true"/>
              </td>
              <td colspan="2" align="left" valign="top" style="vertical-align:top;">
<div style="display:inline-block;width:auto;height:auto;" class="dojoxGridErroressages">                <bttdojo:label id="IBKE2E_AccountPay_checkAmountLabel"/>
</div>              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="width:200px;vertical-align:middle;">
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
        <bttdojo:form id="IBKE2E_AccountPay_form01" errorPage="IBKE2E_AccountPay.jsp">
          <table style="width:400px;">
            <tr>
              <td align="left" valign="middle" style="width:200px;vertical-align:middle;">
                <bttdojo:checkbox id="IBKE2E_AccountPay_inRealTimeCheckBox" checkedValue="true" text="Transfer in Realtime?"/>
              </td>
              <td align="left" valign="middle" style="width:10%;vertical-align:middle;">
                <bttdojo:label id="IBKE2E_AccountPay_feeLabel" text="Fee($):"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="IBKE2E_AccountPay_feeNumberLabel"/>
              </td>
            </tr>
            <tr>
              <td colspan="3" align="left" valign="middle" style="width:200px;vertical-align:middle;">
                <bttdojo:checkbox id="IBKE2E_AccountPay_feeConfirmCheck" checkedValue="true" text="I Accept the Fee"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="width:200px;vertical-align:middle;">
                <bttdojo:button id="IBKE2E_AccountPay_cancelButton" type="save" text="Cancel" flowEvent="cancel"/>
              </td>
              <td colspan="2" align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:button id="IBKE2E_AccountPay_submitButton" type="submit" text="Submit" inValid="true" flowEvent="submit"/>
              </td>
            </tr>
          </table>
          <bttdojo:hidden id="IBKE2E_AccountPay_FromAccount" dataName="AccountTransfer.FromAccount"/>
          <bttdojo:hidden id="IBKE2E_AccountPay_ToAccount" dataName="AccountTransfer.ToAccount"/>
          <bttdojo:hidden id="IBKE2E_AccountPay_Amount" dataName="AccountTransfer.Amount"/>
          <bttdojo:hidden id="IBKE2E_AccountPay_TransferFee" dataName="AccountTransfer.TransferFee"/>
      </bttdojo:form>
      </div>
    </div>
  </div>

<!-- applet id="printApplet" name="printApplet" code="com.ibm.btt.print.applets.PrintrApplet" codebase="applets" archive="bttprint.jar,JSON4J.jar" style="width:0px; height:0px;"></applet-->
</body>
</html>