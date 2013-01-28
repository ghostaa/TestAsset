<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from eca5.xui by Administrator, on Mon Jan 28 14:33:45 CST 2013 -->
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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/eca/eca5.js"> </script>
<bttdojo:form id="eca5_Form01" operationId="eca5Op" errorPage="eca/eca5.jsp">
  <table>
    <tr>
      <td colspan="5" align="center" valign="middle">
        <bttdojo:label id="eca5_Label01" text="TextBox values submit with Form or AjaxRequest" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td>
      </td>
      <td>
      </td>
      <td>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="eca5_Label31" textWrap="false"/>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="eca5_Label27" text="Operations:" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:radio id="eca5_Radio01" dataName="submitFlag" value="1" text="1: Ajax Request(only)" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:radio id="eca5_Radio03" dataName="submitFlag" value="2" text="2: Ajax Request & Response" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:radio id="eca5_Radio02" dataName="submitFlag" value="0" text="3: Form Submit" textWrap="false"/>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td>
      </td>
      <td>
      </td>
      <td>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="eca5_Label30" textWrap="false"/>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td colspan="5" align="left" valign="middle">
        <bttdojo:label id="eca5_Label26" text="1: Leave all TextBox blank, click \'AjaxRequest\' button, check if values can be gotten from server side!" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td colspan="5" align="left" valign="middle">
        <bttdojo:label id="eca5_Label28" text="2: Input values to each TextBox, then click \'AjaxReqRest\' button, check if values equal what you have inputed." textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td colspan="5" align="left" valign="middle">
        <bttdojo:label id="eca5_Label29" text="3: Input values to each TextBox, then click \'FormSubmit\' button, check if values equal what you have inputed." textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td>
      </td>
      <td>
      </td>
      <td>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="eca5_Label32" textWrap="false"/>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td rowspan="3" align="left" valign="middle">
        <bttdojo:label id="eca5_Label02" text="Currency Typed Data" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="eca5_Label03" text="currency1" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="eca5_currency1" dataName="CurrencyKColl.currency1" type="Currency" currency="EUR" numberType="bigDecimal" decimalPlaces="2" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="eca5_Label04" text="currency2" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="eca5_currency2" dataName="CurrencyKColl.currency2" type="Currency" currency="EUR" numberType="bigDecimal" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="eca5_Label05" text="currency3" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="eca5_currency3" dataName="CurrencyKColl.currency3" type="Currency" currency="CNY" numberType="bigDecimal" required="false" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td>
      </td>
      <td colspan="3" align="center" valign="middle">
        <bttdojo:label id="eca5_Label10" text="***************************" textWrap="false"/>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td rowspan="3" align="left" valign="middle">
        <bttdojo:label id="eca5_Label06" text="Date Typed Data" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="eca5_Label07" text="date1" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="eca5_date1" dataName="DateKColl.date1" type="Date" pattern="MM/dd/yyyy" minimumDate="2001-01-01" maximumDate="2222-02-22" required="false" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="eca5_Label08" text="date2" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="eca5_date2" dataName="DateKColl.date2" type="Date" pattern="yyyy-MM-dd" textWrap="false"/>
      </td>
      <td>
      </td>
      <td align="left" valign="middle">
        <bttdojo:button id="eca5_Button02" type="button" text="1AjaxRequest" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="eca5_Label09" text="date3" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="eca5_date3" dataName="DateKColl.date3" type="Date" pattern="yyyy-MM-dd" maximumDate="2222-12-31" required="false" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td>
      </td>
      <td colspan="3" align="center" valign="middle">
        <bttdojo:label id="eca5_Label11" text="***************************" textWrap="false"/>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td rowspan="9" align="left" valign="middle">
        <bttdojo:label id="eca5_Label12" text="Number Typed Data" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="eca5_Label13" text="number1" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="eca5_number1" dataName="NumberKColl.number1" type="Number" numberType="bigDecimal" minimumValue="-1048576.1234" maximumValue="1048576.5678" required="false" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="eca5_Label14" text="number2" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="eca5_number2" dataName="NumberKColl.number2" type="Number" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="eca5_Label15" text="number3" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="eca5_number3" dataName="NumberKColl.number3" type="Number" textWrap="false"/>
      </td>
      <td>
      </td>
      <td align="left" valign="middle">
        <bttdojo:button id="eca5_Button03" type="button" text="2AjaxReqResp" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="eca5_Label16" text="number4" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="eca5_number4" dataName="NumberKColl.number4" type="Number" minimumValue="-1" maximumValue="1024" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td>
      </td>
      <td>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="eca5_Label17" text="number5" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="eca5_number5" dataName="NumberKColl.number5" type="Number" required="false" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="eca5_Label18" text="number6" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="eca5_number6" dataName="NumberKColl.number6" type="Number" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="eca5_Label19" text="number7" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="eca5_number7" dataName="NumberKColl.number7" type="Number" numberType="double" textWrap="false"/>
      </td>
      <td>
      </td>
      <td align="left" valign="middle">
        <bttdojo:button id="eca5_Button01" type="submit" text="3FormSubmit" operationId="eca5Op" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="eca5_Label20" text="number8" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="eca5_number8" dataName="NumberKColl.number8" type="Number" numberType="float" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td>
      </td>
      <td colspan="3" align="center" valign="middle">
        <bttdojo:label id="eca5_Label21" text="***************************" textWrap="false"/>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td rowspan="3" align="left" valign="middle">
        <bttdojo:label id="eca5_Label22" text="String Typed Data" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="eca5_Label23" text="string1" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="eca5_string1" dataName="StringKColl.string1" type="String" minimumLength="6" maximumLength="16" regExp="[A-Z]*" required="false" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="eca5_Label24" text="string2" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="eca5_string2" dataName="StringKColl.string2" type="String" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="eca5_Label25" text="string3" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="eca5_string3" dataName="StringKColl.string3" type="String" minimumLength="2" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
  </table>
</bttdojo:form>

</body>
</html>