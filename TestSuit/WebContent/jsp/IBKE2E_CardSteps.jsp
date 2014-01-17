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
<!-- Generated from IBKE2E_CardSteps.xui by mashuai, on Fri Jan 17 15:17:00 CST 2014 -->
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
<script type="text/javascript" data-btt-eca="true" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/IBKE2E_CardSteps.js"> </script>
<%request.setAttribute("dse_sessionId", session.getId()); %>
<bttdojo:form id="IBKE2E_CardSteps_form" errorPage="IBKE2E_CardSteps.jsp">
  <table>
    <tr>
      <td colspan="6" align="left" valign="middle" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="boldFont">        <bttdojo:label id="IBKE2E_CardSteps_label" text="%nls.bttsample/IBKE2E_Need_Info"/>
</div>      </td>
    </tr>
    <tr>
      <td colspan="6" align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:image id="IBKE2E_CardSteps_image" location="img/step1.gif" tabIndex="-1"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="IBKE2E_CardSteps_label01" text="First Name(*)"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:textbox id="IBKE2E_CardSteps_text" dataName="CreditCard.FirstName" type="String" required="true"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="IBKE2E_CardSteps_label02" text="Middle Name"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:textbox id="IBKE2E_CardSteps_text01" dataName="CreditCard.MiddleName" type="String"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="IBKE2E_CardSteps_label03" text="Last Name(*)"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:textbox id="IBKE2E_CardSteps_text02" dataName="CreditCard.LastName" type="String" required="true"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="IBKE2E_CardSteps_label04" text="Home Address"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:textbox id="IBKE2E_CardSteps_text03" dataName="CreditCard.HomeAddress" type="String"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="IBKE2E_CardSteps_label05" text="Apt. or Suite number "/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:textbox id="IBKE2E_CardSteps_text04" dataName="CreditCard.AptNumber" type="String"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="IBKE2E_CardSteps_label06" text="City"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:textbox id="IBKE2E_CardSteps_text05" dataName="CreditCard.City" type="String"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="IBKE2E_CardSteps_label07" text="State"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:combo id="IBKE2E_CardSteps_combo" dataName="CreditCard.State" storeURL="listFiles/IBKE2E_StateList.js" hint="Demo req6: combox support label/value fields through urlForList" typeAhead="false"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="IBKE2E_CardSteps_label08" text="Zip Code"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:textbox id="IBKE2E_CardSteps_text06" dataName="CreditCard.ZipCode" type="Number" numberType="integer" minimumValue="-2147483648" maximumValue="2147483647"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="IBKE2E_CardSteps_label09" text="Date of Birth(*)"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:textbox id="IBKE2E_CardSteps_text07" dataName="CreditCard.DateBirth" type="Date" pattern="yyyy-MM-dd" required="true"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="IBKE2E_CardSteps_label10" text="Social Security Number(*)"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:textbox id="IBKE2E_CardSteps_text09" dataName="CreditCard.SSN" type="Number" numberType="integer" minimumValue="-2147483648" maximumValue="2147483647" required="true"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td colspan="2" align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="IBKE2E_CardSteps_label21" text="Are you a US citizen or a permanent US resident? "/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:radio id="IBKE2E_CardSteps_radio06" dataName="CreditCard.IsUSResident" value="True" text="Yes"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:radio id="IBKE2E_CardSteps_radio07" dataName="CreditCard.IsUSResident" value="False" text="No"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td colspan="6" align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:image id="IBKE2E_CardSteps_image01" location="img/step2.gif" tabIndex="-1"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="IBKE2E_CardSteps_label11" text="Employer Name(*)"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:textbox id="IBKE2E_CardSteps_text10" dataName="CreditCard.EmployerName" type="String" required="true"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="IBKE2E_CardSteps_label12" text="City"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:textbox id="IBKE2E_CardSteps_text12" dataName="CreditCard.EmpCity" type="String"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="IBKE2E_CardSteps_label13" text="State"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:combo id="IBKE2E_CardSteps_combo01" dataName="CreditCard.EmpState" storeURL="listFiles/IBKE2E_StateList.js" hint="Demo req6: combox support label/value fields through urlForList"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="IBKE2E_CardSteps_label14" text="Zip Code"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:textbox id="IBKE2E_CardSteps_text13" dataName="CreditCard.EmpZipCode" type="Number" numberType="integer" minimumValue="-2147483648" maximumValue="2147483647"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="IBKE2E_CardSteps_label15" text="Length of Empoyment"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:textbox id="IBKE2E_CardSteps_text11" dataName="CreditCard.EmpLength" type="Number"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:radio id="IBKE2E_CardSteps_radio" dataName="CreditCard.YearMonth" value="Year" text="Years"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:radio id="IBKE2E_CardSteps_radio01" dataName="CreditCard.YearMonth" value="Month" text="Months" height="13px"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="IBKE2E_CardSteps_label16" text="Occupation"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:textbox id="IBKE2E_CardSteps_text15" dataName="CreditCard.Occupation" type="String"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="IBKE2E_CardSteps_label17" text="Your Annual Income(*)"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:textbox id="IBKE2E_CardSteps_text16" dataName="CreditCard.AnnualIncome" type="Currency" currency="USD" numberType="bigDecimal" required="true"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="IBKE2E_CardSteps_label18" text="Other Household Income"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:textbox id="IBKE2E_CardSteps_text17" dataName="CreditCard.HouseIncome" type="Currency" currency="USD" numberType="bigDecimal"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:radio id="IBKE2E_CardSteps_radio02" dataName="CreditCard.PerYearMonth" value="PerYear" text="Per Year"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:radio id="IBKE2E_CardSteps_radio03" dataName="CreditCard.PerYearMonth" value="PerMonth" text="Per Month"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="IBKE2E_CardSteps_label19" text="Do you Have a "/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:checkedMultiSelect id="IBKE2E_CardSteps_checkedMultiSelect" dataName="CreditCard.SelectedAccountTypeList" labelFieldForSubmit="Name" valueFieldForSubmit="Value" dataNameForList="CreditCard.MyAccountTypeList" labelField="Name" valueField="Value" selectedField="Selected" disabledField="Disabled" hint="Demo req7: MultipleSelect widget"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
    <tr>
      <td colspan="6" align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:label id="IBKE2E_CardSteps_label20" text="Upon approval you will receive your new card within two weeks "/>
      </td>
    </tr>
    <tr>
      <td colspan="6" align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:radio id="IBKE2E_CardSteps_radio04" dataName="CreditCard.ApplyContinue" value="true" text="Continue on with application"/>
      </td>
    </tr>
    <tr>
      <td colspan="6" align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:radio id="IBKE2E_CardSteps_radio05" dataName="CreditCard.ApplyContinue" value="false" text="I choose not to apply at this time"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:button id="IBKE2E_CardSteps_button" type="submit" text="Submit" flowEvent="submit"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:button id="IBKE2E_CardSteps_button01" type="reset" text="Clear"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
        <bttdojo:button id="IBKE2E_CardSteps_button02" type="button" text="Input Sample Data" hint="Demo req 28: Script widget without parameter limitations"/>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
  </table>
  <bttdojo:script id="IBKE2E_CardSteps_Script01" content="dijit.byId(\"IBKE2E_CardSteps_text\").set('value', param0);
dijit.byId(\"IBKE2E_CardSteps_text02\").set('value', param1);
dijit.byId(\"IBKE2E_CardSteps_text07\").set('value', param2);
dijit.byId(\"IBKE2E_CardSteps_text09\").set('value', param3);
dijit.byId(\"IBKE2E_CardSteps_text10\").set('value', param4);
dijit.byId(\"IBKE2E_CardSteps_text16\").set('value', param5);"/>
</bttdojo:form>

<!-- applet id="printApplet" name="printApplet" code="com.ibm.btt.print.applets.PrintrApplet" codebase="applets" archive="bttprint.jar,JSON4J.jar" style="width:0px; height:0px;"></applet-->
</body>
</html>