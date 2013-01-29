<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from TableValidation.xui by Administrator, on Tue Jan 29 10:56:41 CST 2013 -->
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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/TableValidation.js"> </script>
  <table id="TableValidation_null">
    <tr>
      <td>
        <bttdojo:form id="TableValidation_Form01" operationId="tableValidationStringOp" errorPage="TableValidation.jsp">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="TableValidation_Label01" text="String" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="TableValidation_Button01" type="button" text="init" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="TableValidation_Button12" type="reset" text="reset" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="TableValidation_Button05" type="button" text="submit" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="TableValidation_Button14_copy" type="button" text="submit for select row" flowEvent="multiSelectWithPage" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="TableValidation_Label05" dataName="StringTableRow.requiredBasicField" text="Label01ii" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:textbox id="TableValidation_Text04" dataName="st" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:table id="TableValidation_Table01" dataName="StringTableRow" dataNameForList="StringTableData" sortEnabled="true" selectionMode="single" selectionRequired="true" textWrap="false" isPageable="false">
                  <bttdojo:column widget="TextBox" align="left" dataName="requiredBasicField" width="80" type="String" text="requiredBasicField"/>
                  <bttdojo:column minimumLength="3" widget="TextBox" align="left" dataName="lengthofStringTestField" maximumLength="6" width="80" type="String" text="length"/>
                  <bttdojo:column widget="TextBox" align="left" dataName="NumberInString" width="80" type="Number" text="number"/>
                  <bttdojo:column pattern="yyyy-MM-dd" widget="TextBox" align="left" dataName="DateInString" width="80" type="Date" text="date"/>
                  <bttdojo:column currency="EUR" numberType="bigDecimal" widget="TextBox" align="left" dataName="CurrencyInString" width="80" type="Currency" text="currency"/>
                </bttdojo:table>
              </td>
              <td>
              </td>
            </tr>
          </table>
        </bttdojo:form>
      </td>
    </tr>
    <tr>
      <td>
      </td>
    </tr>
    <tr>
      <td>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:form id="TableValidation_Form06" operationId="tableValidationStringMulOp" errorPage="TableValidation.jsp">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="TableValidation_Label111" text="String for multi select" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="TableValidation_Button011" type="button" text="init" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="TableValidation_Button121" type="reset" text="reset" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="TableValidation_Button051" type="button" text="submit" operationId="tableValidationString" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="TableValidation_Button14" type="button" text="submit for multi select" operationId="MultiSelectResultWithoutPagination" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:textbox id="TableValidation_Text041" dataName="st" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:table id="TableValidation_Table06" dataName="selectTableDate" dataNameForList="StringTableData" sortEnabled="true" selectionMode="multiple" selectionRequired="true" textWrap="false" isPageable="false">
                  <bttdojo:column widget="TextBox" align="left" dataName="requiredBasicField" width="80" text="requiredBasicField"/>
                  <bttdojo:column widget="TextBox" align="left" dataName="lengthofStringTestField" width="80" text="length"/>
                  <bttdojo:column widget="TextBox" align="left" dataName="CurrencyInString" width="80" text="currency"/>
                  <bttdojo:column widget="TextBox" align="left" dataName="NumberInString" width="80" text="number"/>
                  <bttdojo:column widget="TextBox" align="left" dataName="DateInString" width="80" text="date"/>
                  <bttdojo:column unCheckedValue="false" widget="CheckBox" align="left" dataName="chk" width="80" checkedValue="tru" text="checkbox"/>
                  <bttdojo:column dataNameForList="selList" widget="Select" align="left" dataName="sId" width="80" text="select"/>
                  <bttdojo:column dataNameForList="comboList" widget="ComboBox" align="left" dataName="cId" width="80" text="comboBox"/>
                </bttdojo:table>
              </td>
            </tr>
          </table>
        </bttdojo:form>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:form id="TableValidation_Form02" operationId="tableValidationNumberOp" errorPage="TableValidation.jsp">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="TableValidation_Label02" text="Number" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="TableValidation_Button02" type="button" text="init" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="TableValidation_Button09" type="reset" text="reset" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="TableValidation_Button06" type="button" text="submit" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:textbox id="TableValidation_Text01" dataName="st" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:table id="TableValidation_Table02" dataName="NumberTableRow" dataNameForList="NumberTableData" sortEnabled="true" selectionRequired="true" textWrap="false" isPageable="false">
                  <bttdojo:column widget="TextBox" align="left" dataName="DefaultNumberTypeofNumberField" width="80" type="Number" text="DefaultNumberTypeofNumberField" required="true"/>
                  <bttdojo:column align="left" dataName="ByteofNumberField" width="80" text="ByteofNumberField"/>
                  <bttdojo:column widget="TextBox" align="left" dataName="ShortofNumberField" width="80" text="ShortofNumberField"/>
                  <bttdojo:column widget="TextBox" align="left" dataName="IntegerofNumberField" width="80" text="IntegerofNumberField"/>
                  <bttdojo:column widget="TextBox" align="left" dataName="LongNumberField" width="80" text="LongNumberField"/>
                  <bttdojo:column numberType="bigDecimal" widget="TextBox" align="left" dataName="DecimalofNumberField" width="80" type="Number" text="DecimalofNumberField" required="true"/>
                  <bttdojo:column numberType="float" widget="TextBox" align="left" dataName="FloatNumberField" width="80" type="Number" text="FloatNumberField" required="true"/>
                  <bttdojo:column maximumValue="100.999" minimumValue="10.999" numberType="double" widget="TextBox" align="left" dataName="DoubleNumberField" width="80" type="Number" text="DoubleNumberField" required="true"/>
                  <bttdojo:column numberType="double" widget="TextBox" align="left" dataName="DoubleFiledForSorting" width="80" type="Number" text="DoubleFiledForSorting" required="true"/>
                  <bttdojo:column maximumValue="100" minimumValue="10" widget="TextBox" align="left" dataName="maxMinIntegerofNumberField" width="80" type="Number" text="maxMinIntegerofNumberField"/>
                  <bttdojo:column maximumValue="100.99" minimumValue="10.99" numberType="float" widget="TextBox" align="left" dataName="maxMinDecimalofNumberField" width="80" type="Number" text="maxMinDecimalofNumberField"/>
                  <bttdojo:column widget="TextBox" align="left" dataName="formatWithPatternofNumberField3" width="80" type="Number" text="formatWithPatternofNumberField3" required="true"/>
                  <bttdojo:column numberType="bigDecimal" widget="TextBox" align="left" dataName="formatWithPatternofNumberField2" width="80" type="Number" text="formatWithPatternofNumberField2" required="true"/>
                  <bttdojo:column numberType="bigDecimal" widget="TextBox" align="left" dataName="formatWithPatternofNumberField1" width="80" type="Number" text="formatWithPatternofNumberField1" required="true"/>
                  <bttdojo:column numberType="bigDecimal" widget="TextBox" align="left" dataName="formatWithLocaleofNumberField" width="80" type="Number" text="formatWithLocaleofNumberField" required="true"/>
                  <bttdojo:column numberType="double" widget="TextBox" align="left" dataName="formatWithDecimalPlacesofNumberField1" width="80" type="Number" text="formatWithDecimalPlacesofNumberField1" required="true"/>
                  <bttdojo:column numberType="bigDecimal" widget="TextBox" align="left" dataName="formatWithDecimalPlacesofNumberField2" width="80" type="Number" text="formatWithDecimalPlacesofNumberField2" required="true"/>
                </bttdojo:table>
              </td>
            </tr>
          </table>
        </bttdojo:form>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:form id="TableValidation_Form03" operationId="tableValidationCurrencyOp" errorPage="TableValidation.jsp">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="TableValidation_Label03" text="currency" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="TableValidation_Button03" type="button" text="init" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="TableValidation_Button10" type="reset" text="reset" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="TableValidation_Button07" type="button" text="submit" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:textbox id="TableValidation_Text02" dataName="st" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:table id="TableValidation_Table03" dataName="CurrencyTableRow" dataNameForList="CurrencyTableData" sortEnabled="true" textWrap="false" isPageable="false">
                  <bttdojo:column widget="TextBox" align="left" dataName="basicCurrencyofCurrencyField" width="80" text="basicCurrencyofCurrencyField"/>
                  <bttdojo:column widget="TextBox" align="left" dataName="CNYCurrencyofCurrencyField" width="80" text="CNYCurrencyofCurrencyField"/>
                  <bttdojo:column widget="TextBox" align="left" dataName="FRFCurrencyofCurrencyField" width="80" text="FRFCurrencyofCurrencyField"/>
                  <bttdojo:column widget="TextBox" align="left" dataName="IntegerofCurrencyField" width="80" text="IntegerofCurrencyField"/>
                  <bttdojo:column widget="TextBox" align="left" dataName="DecimalofCurrencyField" width="80" text="DecimalofCurrencyField"/>
                  <bttdojo:column widget="TextBox" align="left" dataName="ByteofCurrencyField" width="80" text="ByteofCurrencyField"/>
                  <bttdojo:column widget="TextBox" align="left" dataName="ShortofCurrencyField" width="80" text="ShortofCurrencyField"/>
                  <bttdojo:column widget="TextBox" align="left" dataName="LongCurrencyField" width="80" text="LongCurrencyField"/>
                  <bttdojo:column widget="TextBox" align="left" dataName="DoubleCurrencyField" width="80" text="DoubleCurrencyField"/>
                  <bttdojo:column widget="TextBox" align="left" dataName="FloatCurrencyField" width="80" text="FloatCurrencyField"/>
                  <bttdojo:column widget="TextBox" align="left" dataName="decimalPlacesAndLimit" width="80" text="decimalPlacesAndLimit"/>
                  <bttdojo:column widget="TextBox" align="left" dataName="maxMinIntegerofCurrencyField" width="80" text="maxMinIntegerofCurrencyField"/>
                  <bttdojo:column widget="TextBox" align="left" dataName="maxMinDecimalofCurrencyField" width="80" text="maxMinDecimalofCurrencyField"/>
                  <bttdojo:column widget="TextBox" align="left" dataName="formatWithDecimalPlacesofCurrencyField1" width="80" text="formatWithDecimalPlacesofCurrencyField1"/>
                  <bttdojo:column widget="TextBox" align="left" dataName="formatWithDecimalPlacesofCurrencyField2" width="80" text="formatWithDecimalPlacesofCurrencyField2"/>
                </bttdojo:table>
              </td>
            </tr>
          </table>
        </bttdojo:form>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:form id="TableValidation_Form04" operationId="tableValidationDateOp" errorPage="TableValidation.jsp">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="TableValidation_Label04" text="date" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="TableValidation_button" type="button" text="init" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="TableValidation_Button11" type="reset" text="reset" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="TableValidation_Button08" type="button" text="submit" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:textbox id="TableValidation_Text03" dataName="st" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:table id="TableValidation_Table04" dataName="DateTableRow" dataNameForList="DateTableData" sortEnabled="true" textWrap="false" isPageable="false">
                  <bttdojo:column pattern="MM-dd-yyyy" widget="TextBox" align="left" dataName="maxMinofDateTestField2" width="80" type="Date" minimumDate="today-7d" text="maxMinofDateTestField2" maximumDate="today+7d"/>
                  <bttdojo:column pattern="MM-dd-yyyy" widget="TextBox" align="left" dataName="maxMinofDateTestField3" width="80" type="Date" minimumDate="1979-10-11" text="maxMinofDateTestField3" maximumDate="1979-10-21" required="true"/>
                  <bttdojo:column pattern="MM-dd-yyyy" widget="TextBox" align="left" dataName="maxMinofDateTestField4" width="80" type="Date" minimumDate="today-1y1m7d" text="maxMinofDateTestField4" maximumDate="today+1y1m7d" required="true"/>
                  <bttdojo:column pattern="yyyy-MM-dd" widget="TextBox" align="left" dataName="nullPatternofDateTestField" width="80" type="Date" text="nullPatternofDateTestField"/>
                  <bttdojo:column pattern="MM-dd-yyyy" widget="TextBox" align="left" dataName="basicfDateTestField" width="80" type="Date" text="basicfDateTestField" required="true"/>
                </bttdojo:table>
              </td>
            </tr>
          </table>
        </bttdojo:form>
      </td>
    </tr>
  </table>

</body>
</html>