<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from EditSelectionResultInGroupPage.xui by Administrator, on Tue Jan 29 10:56:07 CST 2013 -->
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
@import "js/com/ibm/btt/dijit/templates/message.css";
@import "css/dijit/main.css";
@import "css/dijit/dijit.css";
@import "css/dijit/FileUpload.css";
@import "css/dijit/Grid.css";
@import "css/dijit/Group.css";
@import "css/dijit/Label.css";
@import "css/dijit/ScreenCover.css";
@import "css/dijit/show.css";




.dojoxGrid table { margin: 0; }
.dj_gecko .dijitTextBoxReadOnly INPUT.dijitInputInner {
    -moz-user-input: auto;
}
.dj_gecko .dijitTextBoxReadOnlyFocused INPUT.dijitInputInner {
	-moz-user-input: none;
}
</style>
<script>
	var djConfig =  {
		baseUrl:"js/dojo/",
		<bttdojo:locale/>,
		isDebug: false, 
		parseOnLoad: true
	};
</script>

<script type="text/javascript" src="js/dojo/dojo_BTT.js" ></script>
<script type="text/javascript" src="js/com/ibm/btt/btt.js"></script>

<script type="text/javascript" >
dojo.addOnLoad(function(){
	dojo.style(document.body, "visibility", "");
});
</script>

<script type="text/javascript">
	
	if(!window.engine){
		<%if(utb.ajaxNavigationEnabled()){%>
			window.engine = new com.ibm.btt.event.NavigationEngine();
		<%}else{%>
			window.engine = new com.ibm.btt.event.Engine();
		<%}%>
		engine.setMonitor(new com.ibm.btt.event.BaseMonitor());
		engine.registerCond("js/condition/condition.js");
		engine.registerKeys("http://9.181.87.190:9082/runtimetest0626/js/attendGlobalKey.js");
		
		
	}
	<%if(utb.ajaxNavigationEnabled()){%>
		dojo.require("dojo.back");
		var state = {
		    back: function() { /* window.engine.onBack(); */},
		    forward: function() { /* window.engine.onForward(); */ }
		};
		dojo.back.setInitialState(state);
	<%}%>

</script>
</head>
<body class="claro" style="visibility:hidden">
  <table id="EditSelectionResultInGroupPage_panel">
    <tr>
      <td align="left" valign="top">
        <bttdojo:form id="EditSelectionResultInGroupPage_form" errorPage="EditSelectionResultPage/EditSelectionResultInGroupPage.jsp">
          <table>
            <tr>
              <td align="left" valign="top">
                  <table id="EditSelectionResultInGroupPage_panel01">
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:a id="EditSelectionResultInGroupPage_link_copy" text="editable table" flowEvent="back" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="EditSelectionResultInGroupPage_label" text="-> EditSelection Result in group" textWrap="false"/>
                      </td>
                    </tr>
                  </table>
              </td>
            </tr>
            <tr>
              <td align="left" valign="top">
                <bttdojo:group id="EditSelectionResultInGroupPage_group" text="multi-selection result" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:table id="EditSelectionResultInGroupPage_table" dataNameForList="selectAccountList" textWrap="false" isPageable="false">
                          <bttdojo:column widget="TextBox" align="left" dataName="AccountName" width="80" text="%nls.testtable/AccountName"/>
                          <bttdojo:column widget="Select" align="left" dataName="TradeTime" width="80" text="%nls.testtable/TradeTime" storeURL="listFiles/tradeTimeForSelect.js"/>
                          <bttdojo:column align="left" dataName="TradeTime" width="80" text="%nls.testtable/TradeTimeValue"/>
                          <bttdojo:column dataNameForList="AccountTypeForSelect" widget="Select" align="left" dataName="AccountType" width="80" labelField="labelField" valueField="valueField" text="%nls.testtable/AccountType"/>
                          <bttdojo:column align="left" dataName="AccountType" width="80" text="%nls.testtable/AccountTypeValue"/>
                          <bttdojo:column widget="TextBox" align="left" dataName="AccountOpeningDate" width="100" text="%nls.testtable/AccountOpeningDate"/>
                          <bttdojo:column widget="TextBox" align="left" dataName="AccountBlance" width="80" text="%nls.testtable/AccountBlance"/>
                          <bttdojo:column widget="ComboBox" align="left" dataName="Rate" width="80" text="%nls.testtable/Rate" storeURL="listFiles/rateForCombo.js"/>
                          <bttdojo:column dataNameForList="LocaltionForComboBox" widget="ComboBox" align="left" dataName="Localtion" width="80" labelField="labelField" text="%nls.testtable/Localtion"/>
                          <bttdojo:column unCheckedValue="false" widget="CheckBox" align="left" dataName="Usable" width="80" checkedValue="true" text="%nls.testtable/Usable"/>
                          <bttdojo:column widget="LabelFromList" align="left" dataName="accountAttribution" width="80" text="%nls.testtable/accountAttribution" storeURL="listFiles/accountAttribution.js"/>
                          <bttdojo:column widget="Image" align="left" dataName="ImageField" width="80" text="%nls.testtable/Image"/>
                        </bttdojo:table>
                      </td>
                    </tr>
                  </table>
                </bttdojo:group>
              </td>
            </tr>
            <tr>
              <td align="left" valign="top">
                <bttdojo:group id="EditSelectionResultInGroupPage_group01" text="single-selection result" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="EditSelectionResultInGroupPage_label08" text="AccountName" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="EditSelectionResultInGroupPage_label01" dataName="AccountInfo.AccountName" text="Label" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="EditSelectionResultInGroupPage_label09" text="TradeTime" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="EditSelectionResultInGroupPage_label02" dataName="AccountInfo.TradeTime" text="Label" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="EditSelectionResultInGroupPage_label10" text="MaximumAmount" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="EditSelectionResultInGroupPage_label03" dataName="AccountInfo.MaximumAmount" text="Label" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="EditSelectionResultInGroupPage_label11" text="AccountOpeningDate" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="EditSelectionResultInGroupPage_label04" dataName="AccountInfo.AccountOpeningDate" text="Label" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="EditSelectionResultInGroupPage_label12" text="AccountBlance" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="EditSelectionResultInGroupPage_label05" dataName="AccountInfo.AccountBlance" text="Label" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="EditSelectionResultInGroupPage_label13" text="Rate" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="EditSelectionResultInGroupPage_label06" dataName="AccountInfo.Rate" text="Label" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="EditSelectionResultInGroupPage_label14" text="Usable" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="EditSelectionResultInGroupPage_label07" dataName="AccountInfo.Usable" text="Label" textWrap="false"/>
                      </td>
                    </tr>
                  </table>
                </bttdojo:group>
              </td>
            </tr>
          </table>
        </bttdojo:form>
      </td>
    </tr>
  </table>

</body>
</html>