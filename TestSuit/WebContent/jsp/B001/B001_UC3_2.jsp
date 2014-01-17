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
<!-- Generated from B001_UC3_2.xui by mashuai, on  -->
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
<script type="text/javascript" data-btt-eca="true" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/B001/B001_UC3_2.js"> </script>
<%request.setAttribute("dse_sessionId", session.getId()); %>
  <div id="B001_UC3_2_panel" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:form id="B001_UC3_2_form" errorPage="B001/B001_UC3_2.jsp">
          <div class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="width:889px;vertical-align:middle;">
                <bttdojo:label id="B001_UC3_2_label" text="%nls.testb001/Query_Accts"/>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="width:889px;vertical-align:middle;">
                <bttdojo:label id="B001_UC3_2_label01" text="%nls.testb001/MyCreditAccts"/>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="width:889px;height:40px;vertical-align:middle;">
                  <div class=" table_head BTTTableStyle" style="width:1168px;height:50px;" id="B001_UC3_2_panel01">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="width:30px;height:50px;vertical-align:middle;">
                      </div>
                      <div class="BTTCellStyle" align="center" style="width:100px;height:50px;vertical-align:middle;">
                        <bttdojo:label id="B001_UC3_2_label02" text="%nls.testb001/Given_Name"/>
                      </div>
                      <div class="BTTCellStyle" align="center" style="width:160px;height:50px;vertical-align:middle;">
                        <bttdojo:label id="B001_UC3_2_label03" text="%nls.testb001/Acct_No"/>
                      </div>
                      <div class="BTTCellStyle" align="center" style="width:80px;height:50px;vertical-align:middle;">
                        <bttdojo:label id="B001_UC3_2_label04" text="%nls.testb001/Cur_Type"/>
                      </div>
                      <div class="BTTCellStyle" align="right" style="width:100px;height:50px;vertical-align:middle;">
                        <bttdojo:label id="B001_UC3_2_label05" text="%nls.testb001/Credit_Line" width="100px" textWrap="false"/>
                      </div>
                      <div class="BTTCellStyle" align="right" style="width:100px;height:50px;vertical-align:middle;">
                        <bttdojo:label id="B001_UC3_2_label07" text="%nls.testb001/Withdrawal_Line" width="100px" textWrap="false"/>
                      </div>
                      <div class="BTTCellStyle" align="right" style="width:100px;height:50px;vertical-align:middle;">
                        <bttdojo:label id="B001_UC3_2_label08" text="%nls.testb001/Available_Credit" width="100px" textWrap="false"/>
                      </div>
                      <div class="BTTCellStyle" align="right" style="width:100px;height:50px;vertical-align:middle;">
                        <bttdojo:label id="B001_UC3_2_label09" text="%nls.testb001/Balance"/>
                      </div>
                      <div class="BTTCellStyle" align="center" style="width:140px;height:50px;vertical-align:middle;">
                        <bttdojo:label id="B001_UC3_2_label10" text="%nls.testb001/Branch_Bank"/>
                      </div>
                      <div class="BTTCellStyle" align="center" style="width:240px;height:50px;vertical-align:middle;">
                        <bttdojo:label id="B001_UC3_2_label11" text="%nls.testb001/operation"/>
                      </div>
                    </div>
                  </div>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="width:889px;height:100px;vertical-align:top;">
                <bttdojo:repetitivepanel id="B001_UC3_2_repetitivePanel" dataNameForList="MyCreditAccts" class="oddeven" dataNameForRow="RowNum" selectionMode="single">
                  <table>
                    <tr>
                      <td align="left" valign="middle" style="width:30px;height:32px;vertical-align:middle;">
                      </td>
                      <td align="center" valign="middle" style="width:93px;height:32px;vertical-align:middle;">
                        <bttdojo:label id="B001_UC3_2_label14_${index}" dataName="MyCreditAccts.${index}.GivenName" text="Label"/>
                      </td>
                      <td align="center" valign="middle" style="width:154px;height:32px;vertical-align:middle;">
                        <bttdojo:label id="B001_UC3_2_label06_${index}" dataName="MyCreditAccts.${index}.AcctNo" text="Label"/>
                      </td>
                      <td align="left" valign="middle" style="width:80px;height:32px;vertical-align:middle;">
                        <bttdojo:label id="B001_UC3_2_label12_${index}" dataName="MyCreditAccts.${index}.ParentType" text="Label" height="13px"/>
                      </td>
                      <td align="right" valign="middle" style="width:100px;height:32px;vertical-align:middle;">
                        <bttdojo:label id="B001_UC3_2_label13_${index}" text="%nls.testb001/bar" width="100px" textWrap="false"/>
                      </td>
                      <td align="right" valign="middle" style="width:100px;height:32px;vertical-align:middle;">
                        <bttdojo:label id="B001_UC3_2_label15_${index}" text="%nls.testb001/bar" width="100px" textWrap="false"/>
                      </td>
                      <td align="right" valign="middle" style="width:100px;height:32px;vertical-align:middle;">
                        <bttdojo:label id="B001_UC3_2_label16_${index}" text="%nls.testb001/bar"/>
                      </td>
                      <td align="right" valign="middle" style="width:100px;height:32px;vertical-align:middle;">
                        <bttdojo:label id="B001_UC3_2_label17_${index}" text="%nls.testb001/bar"/>
                      </td>
                      <td align="center" valign="middle" style="width:140px;height:32px;vertical-align:middle;">
                        <bttdojo:label id="B001_UC3_2_label26_${index}" dataName="MyCreditAccts.${index}.BranchBank" text="Label"/>
                      </td>
                      <td align="center" valign="middle" style="width:200px;height:32px;vertical-align:middle;">
                          <div style="width:242px;" id="B001_UC3_2_panel02_${index}" class="BTTTableStyle">
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:conditionalPanel id="B001_UC3_2_conditionalPanel01_${index}" dataName="MyCreditAccts.${index}.ParentType" width="46px" height="46px">
                                  <bttdojo:optionPanel id="B001_UC3_2_OptionPanel01_${index}" optionValue="Multi-Currency" style="width:100%;height:100%;">
                                    <div style="width:100%;height:100%;" class="BTTTableStyle">
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:button id="B001_UC3_2_button_${index}" type="button" text="%nls.testb001/Balance"/>
                                        </div>
                                      </div>
                                    </div>
                                </bttdojo:optionPanel>
                              </bttdojo:conditionalPanel>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:conditionalPanel id="B001_UC3_2_conditionalPanel02_${index}" dataName="MyCreditAccts.${index}.GivenName" width="46px" height="46px">
                                  <bttdojo:optionPanel id="B001_UC3_2_OptionPanel02_${index}" optionValue="Golden Card" style="width:100%;height:100%;">
                                    <div style="width:100%;height:100%;" class="BTTTableStyle">
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:button id="B001_UC3_2_button01_${index}" type="button" text="%nls.testb001/Credits" flowEvent="queryPoints"/>
                                        </div>
                                      </div>
                                    </div>
                                </bttdojo:optionPanel>
                              </bttdojo:conditionalPanel>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:conditionalPanel id="B001_UC3_2_conditionalPanel03_${index}" dataName="MyCreditAccts.${index}.BranchBank" width="70px" height="46px">
                                  <bttdojo:optionPanel id="B001_UC3_2_OptionPanel03_${index}" optionValue="BeiJing Branch" style="width:100%;height:100%;">
                                    <div style="width:100%;height:100%;" class="BTTTableStyle">
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:button id="B001_UC3_2_button02_${index}" type="button" text="%nls.testb001/Settled_Bill" flowEvent="settledBill"/>
                                        </div>
                                      </div>
                                    </div>
                                </bttdojo:optionPanel>
                                  <bttdojo:optionPanel id="B001_UC3_2_OptionPanel04_${index}" optionValue="娆у厓鍗�" style="width:100%;height:100%;">
                                    <div style="width:100%;height:100%;" class="BTTTableStyle">
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:button id="B001_UC3_2_button02_1_${index}" type="submit" text="%nls.testb001/Settled_Bill" flowEvent="settledBill"/>
                                        </div>
                                      </div>
                                    </div>
                                </bttdojo:optionPanel>
                              </bttdojo:conditionalPanel>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:conditionalPanel id="B001_UC3_2_conditionalPanel04_${index}" dataName="MyCreditAccts.${index}.GivenName" width="70px" height="46px">
                                  <bttdojo:optionPanel id="B001_UC3_2_OptionPanel05_${index}" optionValue="Golden Card" style="width:100%;height:100%;">
                                    <div style="width:100%;height:100%;" class="BTTTableStyle">
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:button id="B001_UC3_2_button03_${index}" type="button" text="%nls.testb001/Unsettled_Bill" flowEvent="unsettledBill"/>
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
                      <td colspan="10" align="left" valign="middle" style="width:1180px;height:32px;vertical-align:middle;">
                          <div id="B001_UC3_2_panel04_${index}" class="BTTTableStyle">
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="width:30px;vertical-align:middle;">
                              </div>
                              <div class="BTTCellStyle" align="left" style="width:100px;vertical-align:middle;">
                              </div>
                              <div class="BTTCellStyle" align="left" style="width:160px;vertical-align:middle;">
                              </div>
                              <div class="BTTCellStyle" align="left" style="width:80px;vertical-align:middle;">
                                <bttdojo:label id="B001_UC3_2_label18_${index}" dataName="MyCreditAccts.${index}.CurBalanceList.0.CurType" text="Label"/>
                              </div>
                              <div class="BTTCellStyle" align="right" style="width:100px;vertical-align:middle;">
                                <bttdojo:label id="B001_UC3_2_label20_${index}" dataName="MyCreditAccts.${index}.CurBalanceList.0.CreditLine" text="Label"/>
                              </div>
                              <div class="BTTCellStyle" align="right" style="width:100px;vertical-align:middle;">
                                <bttdojo:label id="B001_UC3_2_label21_${index}" dataName="MyCreditAccts.${index}.CurBalanceList.0.WithdrawalLine" text="Label"/>
                              </div>
                              <div class="BTTCellStyle" align="right" style="width:100px;vertical-align:middle;">
                                <bttdojo:label id="B001_UC3_2_label22_${index}" dataName="MyCreditAccts.${index}.CurBalanceList.0.AvailableCredit" text="Label"/>
                              </div>
                              <div class="BTTCellStyle" align="right" style="width:100px;vertical-align:middle;">
                                <bttdojo:label id="B001_UC3_2_label29_${index}" dataName="MyCreditAccts.${index}.CurBalanceList.0.Balance" text="Label"/>
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
                                <bttdojo:label id="B001_UC3_2_label19_${index}" dataName="MyCreditAccts.${index}.CurBalanceList.1.CurType" text="Label"/>
                              </div>
                              <div class="BTTCellStyle" align="right" style="width:100px;vertical-align:middle;">
                                <bttdojo:label id="B001_UC3_2_label23_${index}" dataName="MyCreditAccts.${index}.CurBalanceList.1.CreditLine" text="Label"/>
                              </div>
                              <div class="BTTCellStyle" align="right" style="width:100px;vertical-align:middle;">
                                <bttdojo:label id="B001_UC3_2_label24_${index}" dataName="MyCreditAccts.${index}.CurBalanceList.1.WithdrawalLine" text="Label"/>
                              </div>
                              <div class="BTTCellStyle" align="right" style="width:100px;vertical-align:middle;">
                                <bttdojo:label id="B001_UC3_2_label25_${index}" dataName="MyCreditAccts.${index}.CurBalanceList.1.AvailableCredit" text="Label"/>
                              </div>
                              <div class="BTTCellStyle" align="right" style="width:100px;vertical-align:middle;">
                                <bttdojo:label id="B001_UC3_2_label30_${index}" dataName="MyCreditAccts.${index}.CurBalanceList.1.Balance" text="Label"/>
                              </div>
                            </div>
                          </div>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="10" align="left" valign="middle" style="width:1180px;height:12px;vertical-align:middle;">
                        <bttdojo:conditionalPanel id="B001_UC3_2_conditionalPanel_${index}" dataName="MyCreditAccts.${index}.GivenName" width="1164px" height="115px">
                          <bttdojo:optionPanel id="B001_UC3_2_OptionPanel06_${index}" optionValue="Golden Card" style="width:100%;height:100%;">
                            <div style="width:100%;height:100%;" class="BTTTableStyle">
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:label id="B001_UC3_2_label32_${index}" text="this is option panel 1"/>
                                </div>
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:textbox id="B001_UC3_2_text_${index}" dataName="MyCreditAccts.${index}.forSubmit.forText"/>
                                </div>
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:button id="B001_UC3_2_button04_${index}" type="button" text="Button"/>
                                </div>
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:combo id="B001_UC3_2_combo_${index}" dataName="MyCreditAccts.${index}.forSubmit.forCombo" dataNameForList="MyCreditAccts.${index}.CurBalanceList" labelField="AvailableCredit" valueField="CurType"/>
                                </div>
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:radio id="B001_UC3_2_radio_${index}" dataName="MyCreditAccts.${index}.forSubmit.forRadio" text="Radio"/>
                                </div>
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:checkbox id="B001_UC3_2_checkBox_${index}" dataName="MyCreditAccts.${index}.forSubmit.forCheckBox" checkedValue="true" text="CheckBox"/>
                                </div>
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:select id="B001_UC3_2_selectList_${index}" dataName="MyCreditAccts.${index}.forSubmit.forSelect" dataNameForList="MyCreditAccts.${index}.CurBalanceList" labelField="AvailableCredit" valueField="WithdrawalLine"/>
                                </div>
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:textArea id="B001_UC3_2_textArea_${index}" dataName="MyCreditAccts.${index}.AcctNo" type="String"/>
                                </div>
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                </div>
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                </div>
                              </div>
                            </div>
                        </bttdojo:optionPanel>
                          <bttdojo:optionPanel id="B001_UC3_2_OptionPanel07_${index}" optionValue="Single-Currency" style="width:100%;height:100%;">
                            <div style="width:100%;height:100%;" class="BTTTableStyle">
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:label id="B001_UC3_2_label33_${index}" text="This is option panel 2"/>
                                </div>
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:multiSelect id="B001_UC3_2_multiSelect_${index}" dataName="MyCreditAccts.${index}.forSubmit.forMultiSel" dataNameForList="MyCreditAccts" labelField="AcctNo" valueField="GivenName"/>
                                </div>
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:checkedMultiSelect id="B001_UC3_2_checkedMultiSelect_${index}" dataName="MyCreditAccts.${index}.forSubmit.forCheckedMultiSel" dataNameForList="MyCreditAccts" labelField="GivenName" valueField="AcctNo"/>
                                </div>
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:enhancedMultiSelect id="B001_UC3_2_checkedMultiSelectExt_${index}" dataName="MyCreditAccts.${index}.forSubmit.forEnhanceMultiSel" dataNameForList="MyCreditAccts" labelField="AcctNo" valueField="GivenName"/>
                                </div>
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:richTextEditor id="B001_UC3_2_richText_${index}" dataName="MyCreditAccts.${index}.ParentType" height="199px"/>
                                </div>
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:a id="B001_UC3_2_link_${index}" text="Link" action="#"/>
                                </div>
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                </div>
                              </div>
                            </div>
                        </bttdojo:optionPanel>
                          <bttdojo:optionPanel id="B001_UC3_2_OptionPanel08_${index}" optionValue="Euro Card" style="width:100%;height:100%;">
                            <div style="width:100%;height:100%;" class="BTTTableStyle">
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:label id="B001_UC3_2_label34_${index}" text="this is optional 3"/>
                                </div>
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:table id="B001_UC3_2_table_${index}" dataName="MyCreditAccts.${index}.forSubmit.forTableSingle" dataNameForList="MyCreditAccts" selectionMode="single" isPageable="false">
                                    <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="GivenName" dataName="GivenName" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
                                    <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="AcctNo" dataName="AcctNo" noresize="false" repeat="true" id="columnId1" headerVAlign="left"/>
                                  </bttdojo:table>
                                </div>
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:message id="B001_UC3_2_message_${index}" dataName="MyCreditAccts.${index}.TestMK.MKF1"/>
                                </div>
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                </div>
                              </div>
                            </div>
                        </bttdojo:optionPanel>
                      </bttdojo:conditionalPanel>
                      </td>
                    </tr>
                  </table>
              </bttdojo:repetitivepanel>
              </div>
            </div>
          </div>
          <bttdojo:hidden id="B001_UC3_2_hiddenField_AcctNo" dataName="CreditAcct.AcctNo"/>
      </bttdojo:form>
      </div>
    </div>
  </div>

<!-- applet id="printApplet" name="printApplet" code="com.ibm.btt.print.applets.PrintrApplet" codebase="applets" archive="bttprint.jar,JSON4J.jar" style="width:0px; height:0px;"></applet-->
</body>
</html>