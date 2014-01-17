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
<!-- Generated from B001_UC1.xui by mashuai, on  -->
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

@import "css/main.css";
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
<script type="text/javascript" data-btt-eca="true" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/B001/B001_UC1.js"> </script>
<%request.setAttribute("dse_sessionId", session.getId()); %>
  <div id="B001_UC1_panel" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:form id="B001_UC1_form" errorPage="B001/B001_UC1.jsp">
          <div style="width:1618px;height:416px;" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="width:889px;vertical-align:middle;">
                <bttdojo:label id="B001_UC1_label" text="%nls.testb001/Query_Accts"/>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="width:889px;vertical-align:middle;">
                <bttdojo:label id="B001_UC1_label01" text="%nls.testb001/MyCreditAccts"/>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="width:889px;height:40px;vertical-align:middle;">
                  <div class="table_head BTTTableStyle" style="width:1168px;height:50px;" id="B001_UC1_panel01">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="width:30px;height:50px;vertical-align:middle;">
                      </div>
                      <div class="BTTCellStyle" align="center" style="width:100px;height:50px;vertical-align:middle;">
                        <bttdojo:label id="B001_UC1_label02" text="%nls.testb001/Given_Name"/>
                      </div>
                      <div class="BTTCellStyle" align="center" style="width:160px;height:50px;vertical-align:middle;">
                        <bttdojo:label id="B001_UC1_label03" text="%nls.testb001/Acct_No"/>
                      </div>
                      <div class="BTTCellStyle" align="center" style="width:80px;height:50px;vertical-align:middle;">
                        <bttdojo:label id="B001_UC1_label04" text="%nls.testb001/Cur_Type"/>
                      </div>
                      <div class="BTTCellStyle" align="right" style="width:100px;height:50px;vertical-align:middle;">
                        <bttdojo:label id="B001_UC1_label05" text="%nls.testb001/Credit_Line" width="100px" textWrap="false"/>
                      </div>
                      <div class="BTTCellStyle" align="right" style="width:100px;height:50px;vertical-align:middle;">
                        <bttdojo:label id="B001_UC1_label07" text="%nls.testb001/Withdrawal_Line" width="100px" textWrap="false"/>
                      </div>
                      <div class="BTTCellStyle" align="right" style="width:100px;height:50px;vertical-align:middle;">
                        <bttdojo:label id="B001_UC1_label08" text="%nls.testb001/Available_Credit" width="100px" textWrap="false"/>
                      </div>
                      <div class="BTTCellStyle" align="right" style="width:100px;height:50px;vertical-align:middle;">
                        <bttdojo:label id="B001_UC1_label09" text="%nls.testb001/Balance"/>
                      </div>
                      <div class="BTTCellStyle" align="center" style="width:140px;height:50px;vertical-align:middle;">
                        <bttdojo:label id="B001_UC1_label10" text="%nls.testb001/Branch_Bank"/>
                      </div>
                      <div class="BTTCellStyle" align="center" style="width:240px;height:50px;vertical-align:middle;">
                        <bttdojo:label id="B001_UC1_label11" text="%nls.testb001/operation"/>
                      </div>
                    </div>
                  </div>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="width:889px;height:100px;vertical-align:top;">
                <bttdojo:repetitivepanel id="B001_UC1_repetitivePanel" dataNameForList="MyCreditAccts" class="oddeven" style="width:1175px;" dataNameForRow="RowNum" selectionMode="single">
                  <table style="width:1175px;">
                    <tr>
                      <td align="left" valign="middle" style="width:30px;height:32px;vertical-align:middle;">
                      </td>
                      <td align="center" valign="middle" style="width:100px;height:32px;vertical-align:middle;">
                        <bttdojo:label id="B001_UC1_label14_${index}" dataName="MyCreditAccts.${index}.GivenName" text="Label"/>
                      </td>
                      <td align="center" valign="middle" style="width:160px;height:32px;vertical-align:middle;">
                        <bttdojo:label id="B001_UC1_label06_${index}" dataName="MyCreditAccts.${index}.AcctNo" text="Label"/>
                      </td>
                      <td align="left" valign="middle" style="width:80px;height:32px;vertical-align:middle;">
                        <bttdojo:label id="B001_UC1_label12_${index}" dataName="MyCreditAccts.${index}.ParentType" text="Label" height="13px"/>
                      </td>
                      <td align="right" valign="middle" style="width:100px;height:32px;vertical-align:middle;">
                        <bttdojo:label id="B001_UC1_label13_${index}" text="%nls.testb001/bar" width="100px" textWrap="false"/>
                      </td>
                      <td align="right" valign="middle" style="width:100px;height:32px;vertical-align:middle;">
                        <bttdojo:label id="B001_UC1_label15_${index}" text="%nls.testb001/bar" width="100px" textWrap="false"/>
                      </td>
                      <td align="right" valign="middle" style="width:100px;height:32px;vertical-align:middle;">
                        <bttdojo:label id="B001_UC1_label16_${index}" text="%nls.testb001/bar"/>
                      </td>
                      <td align="right" valign="middle" style="width:100px;height:32px;vertical-align:middle;">
                        <bttdojo:label id="B001_UC1_label17_${index}" text="%nls.testb001/bar"/>
                      </td>
                      <td align="center" valign="middle" style="width:140px;height:32px;vertical-align:middle;">
                        <bttdojo:label id="B001_UC1_label26_${index}" dataName="MyCreditAccts.${index}.BranchBank" text="Label"/>
                      </td>
                      <td align="center" valign="middle" style="width:200px;height:32px;vertical-align:middle;">
                          <div style="width:242px;" id="B001_UC1_panel02_${index}" class="BTTTableStyle">
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:conditionalPanel id="B001_UC1_conditionalPanel01_${index}" dataName="MyCreditAccts.${index}.ParentType" width="46px" height="46px">
                                  <bttdojo:optionPanel id="B001_UC1_OptionPanel01_${index}" optionValue="Multi-Currency" style="width:100%;height:100%;">
                                    <div style="width:100%;height:100%;" class="BTTTableStyle">
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:button id="B001_UC1_button_${index}" type="button" text="%nls.testb001/Balance"/>
                                        </div>
                                      </div>
                                    </div>
                                </bttdojo:optionPanel>
                              </bttdojo:conditionalPanel>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:conditionalPanel id="B001_UC1_conditionalPanel02_${index}" dataName="MyCreditAccts.${index}.GivenName" width="46px" height="46px">
                                  <bttdojo:optionPanel id="B001_UC1_OptionPanel02_${index}" optionValue="Golden Card" style="width:100%;height:100%;">
                                    <div style="width:100%;height:100%;" class="BTTTableStyle">
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:label id="B001_UC1_label32_${index}" text="%nls.testb001/Credits"/>
                                        </div>
                                      </div>
                                    </div>
                                </bttdojo:optionPanel>
                              </bttdojo:conditionalPanel>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:conditionalPanel id="B001_UC1_conditionalPanel03_${index}" dataName="MyCreditAccts.${index}.BranchBank" width="70px" height="46px">
                                  <bttdojo:optionPanel id="B001_UC1_OptionPanel03_${index}" optionValue="BeiJing Branch" style="width:100%;height:100%;">
                                    <div style="width:100%;height:100%;" class="BTTTableStyle">
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:label id="B001_UC1_label33_${index}" text="%nls.testb001/Settled_Bill"/>
                                        </div>
                                      </div>
                                    </div>
                                </bttdojo:optionPanel>
                              </bttdojo:conditionalPanel>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:conditionalPanel id="B001_UC1_conditionalPanel04_${index}" dataName="MyCreditAccts.${index}.GivenName" width="70px" height="46px">
                                  <bttdojo:optionPanel id="B001_UC1_OptionPanel05_${index}" optionValue="Golden Card" style="width:100%;height:100%;">
                                    <div style="width:100%;height:100%;" class="BTTTableStyle">
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:label id="B001_UC1_label34_${index}" text="%nls.testb001/Unsettled_Bill"/>
                                        </div>
                                      </div>
                                    </div>
                                </bttdojo:optionPanel>
                              </bttdojo:conditionalPanel>
                              </div>
                            </div>
                          </div>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="10" align="left" valign="middle" style="height:32px;vertical-align:middle;">
                          <div id="B001_UC1_panel04_${index}" class="BTTTableStyle">
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="width:30px;vertical-align:middle;">
                              </div>
                              <div class="BTTCellStyle" align="left" style="width:100px;vertical-align:middle;">
                              </div>
                              <div class="BTTCellStyle" align="left" style="width:160px;vertical-align:middle;">
                              </div>
                              <div class="BTTCellStyle" align="left" style="width:80px;vertical-align:middle;">
                                <bttdojo:label id="B001_UC1_label18_${index}" dataName="MyCreditAccts.${index}.CurBalanceList.0.CurType" text="Label"/>
                              </div>
                              <div class="BTTCellStyle" align="right" style="width:100px;vertical-align:middle;">
                                <bttdojo:label id="B001_UC1_label20_${index}" dataName="MyCreditAccts.${index}.CurBalanceList.0.CreditLine" text="Label"/>
                              </div>
                              <div class="BTTCellStyle" align="right" style="width:100px;vertical-align:middle;">
                                <bttdojo:label id="B001_UC1_label21_${index}" dataName="MyCreditAccts.${index}.CurBalanceList.0.WithdrawalLine" text="Label"/>
                              </div>
                              <div class="BTTCellStyle" align="right" style="width:100px;vertical-align:middle;">
                                <bttdojo:label id="B001_UC1_label22_${index}" dataName="MyCreditAccts.${index}.CurBalanceList.0.AvailableCredit" text="Label"/>
                              </div>
                              <div class="BTTCellStyle" align="right" style="width:100px;vertical-align:middle;">
                                <bttdojo:label id="B001_UC1_label29_${index}" dataName="MyCreditAccts.${index}.CurBalanceList.0.Balance" text="Label"/>
                              </div>
                            </div>
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="width:30px;vertical-align:middle;">
                              </div>
                              <div class="BTTCellStyle" align="left" style="width:100px;vertical-align:middle;">
                              </div>
                              <div class="BTTCellStyle" align="left" style="width:160px;vertical-align:middle;">
                              </div>
                              <div class="BTTCellStyle" align="left" style="width:80px;vertical-align:middle;">
                                <bttdojo:label id="B001_UC1_label19_${index}" dataName="MyCreditAccts.${index}.CurBalanceList.1.CurType" text="Label"/>
                              </div>
                              <div class="BTTCellStyle" align="right" style="width:100px;vertical-align:middle;">
                                <bttdojo:label id="B001_UC1_label23_${index}" dataName="MyCreditAccts.${index}.CurBalanceList.1.CreditLine" text="Label"/>
                              </div>
                              <div class="BTTCellStyle" align="right" style="width:100px;vertical-align:middle;">
                                <bttdojo:label id="B001_UC1_label24_${index}" dataName="MyCreditAccts.${index}.CurBalanceList.1.WithdrawalLine" text="Label"/>
                              </div>
                              <div class="BTTCellStyle" align="right" style="width:100px;vertical-align:middle;">
                                <bttdojo:label id="B001_UC1_label25_${index}" dataName="MyCreditAccts.${index}.CurBalanceList.1.AvailableCredit" text="Label"/>
                              </div>
                              <div class="BTTCellStyle" align="right" style="width:100px;vertical-align:middle;">
                                <bttdojo:label id="B001_UC1_label30_${index}" dataName="MyCreditAccts.${index}.CurBalanceList.1.Balance" text="Label"/>
                              </div>
                            </div>
                          </div>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="10" align="left" valign="middle" style="vertical-align:middle;">
                      </td>
                    </tr>
                  </table>
              </bttdojo:repetitivepanel>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="width:889px;vertical-align:middle;">
              </div>
            </div>
          </div>
          <bttdojo:hidden id="B001_UC1_hiddenField_AcctNo" dataName="CreditAcct.AcctNo"/>
      </bttdojo:form>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
    </div>
  </div>

<!-- applet id="printApplet" name="printApplet" code="com.ibm.btt.print.applets.PrintrApplet" codebase="applets" archive="bttprint.jar,JSON4J.jar" style="width:0px; height:0px;"></applet-->
</body>
</html>