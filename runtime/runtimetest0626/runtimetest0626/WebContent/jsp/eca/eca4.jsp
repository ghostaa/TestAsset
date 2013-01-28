<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from eca4.xui by Administrator, on Mon Jan 28 14:33:44 CST 2013 -->
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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/eca/eca4.js"> </script>
  <table id="eca4_null">
    <tr>
      <td>
        <bttdojo:group id="eca4_Group01" text="Typed textbox VS. Properties" width="1034px" height="139px" textWrap="false">
          <table style="width:1034px;height:139px;">
            <tr>
              <td>
                <bttdojo:form id="eca4_Form01" operationId="eca4Op" errorPage="eca/eca4.jsp">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="eca4_Label01" text="Currency Disabled TextBox" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="eca4_txtTPCurrency" dataName="TypePropertyKColl.TpCurrencyDisabledField" type="Currency" currency="CNY" numberType="bigDecimal" disabled="true" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="eca4_btnTPFillCurrencyValue" type="button" text="Fill Currency Value" textWrap="false"/>
                      </td>
                      <td rowspan="4" align="left" valign="middle">
                        <bttdojo:button id="eca4_btnTpSubmit" type="submit" text="Submit" operationId="eca4Op" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="eca4_label" text="No Data will be Submitted" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="eca4_button" type="cancel" text="submit with no data" operationId="eca4Op" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="eca4_Label02" text="Date Mandatory TextBox" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="eca4_txtTPDate" dataName="TypePropertyKColl.TpDateMandatoryField" type="Date" pattern="dd/MM/yyyy" maximumDate="today" required="true" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="eca4_button13" type="save" text="submit without validation" operationId="eca4Op" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="eca4_Label03" text="Number ReadOnly TextBox" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="eca4_txtTPNumber" dataName="TypePropertyKColl.TpNumberReadOnlyField" type="Number" readOnly="true" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="eca4_btnTPFillNumberValue" type="button" text="Fill Number Value" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="eca4_Label04" text="String Password TextBox" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="eca4_txtTPString" dataName="TypePropertyKColl.TpStringPasswordField" type="String" minimumLength="6" maximumLength="15" required="true" password="true" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td>
                      </td>
                      <td>
                      </td>
                    </tr>
                  </table>
                </bttdojo:form>
              </td>
              <td>
                <bttdojo:group id="eca4_Group02" text="Returned Values" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="eca4_txtTPCurrency1" dataName="TypePropertyKColl.TpCurrencyDisabledField" type="Currency" currency="CNY" numberType="bigDecimal" readOnly="true" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="eca4_txtTPDate1" dataName="TypePropertyKColl.TpDateMandatoryField" type="Date" pattern="dd/MM/yyyy" maximumDate="today" required="true" readOnly="true" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="eca4_txtTPNumber1" dataName="TypePropertyKColl.TpNumberReadOnlyField" type="Number" readOnly="true" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="eca4_txtTPString1" dataName="TypePropertyKColl.TpStringPasswordField" type="String" minimumLength="6" maximumLength="15" required="true" readOnly="true" textWrap="false"/>
                      </td>
                    </tr>
                  </table>
                </bttdojo:group>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="eca4_Group03" text="MX defect 23997" textWrap="false">
          <table>
            <tr>
              <td>
                <bttdojo:form id="eca4_Form02" operationId="eca4Op" errorPage="eca/eca4.jsp" style="width:1198px;height:99px;">
                  <table style="width:1198px;height:99px;">
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="eca4_Label05" text="Currency with decimal places=4" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="eca4_txtMxDefect23997" dataName="legacyKColl.mxCurrencyField" type="Currency" currency="USD" numberType="bigDecimal" decimalPlaces="4" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="eca4_Button01" type="submit" text="Submit" operationId="eca4Op" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:button id="eca4_mbtnDisable" type="button" text="Disabled" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="eca4_Button10" type="button" text="ReadOnly" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="eca4_Button11" type="button" text="Editable" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="eca4_mbtnHidden" type="button" text="Hidden" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="eca4_mbtnGone" type="button" text="Gone" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:button id="eca4_Button09" type="button" text="Enabled" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="eca4_Button12" type="button" text="Visible" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="eca4_mbtnIsFocusable" type="button" text="IsFocusable" textWrap="false"/>
                      </td>
                      <td colspan="3" align="left" valign="middle">
                        <bttdojo:label id="eca4_lblInfo" textWrap="false"/>
                      </td>
                    </tr>
                  </table>
                </bttdojo:form>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:group id="eca4_Group04" text="Events VS. Actions" width="1254px" height="149px" textWrap="false">
          <table style="width:1254px;height:149px;">
            <tr>
              <td>
                <bttdojo:form id="eca4_Form03" operationId="eca4Op" errorPage="eca/eca4.jsp">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="eca4_Label06" text="Date Type" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="eca4_txtEADateField" dataName="EAKColl.EADateField" type="Date" pattern="MM/dd/yyyy" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="eca4_Label10" text="onBlur;onClick;onChange;onFocus;onMouseDown;onMouseUp;onMouseEnter;onMouseLeave;onMouseMove" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="eca4_Label07" text="String Type" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="eca4_txtEAStringField" dataName="EAKColl.EAStringField" type="String" maximumLength="6" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="eca4_Label11" text="onBlur;onClick;onChange;onFocus;onKeyDown;onKeyPress;onKeyUp" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="eca4_Label08" text="Currency Type" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="eca4_txtEAExtendedCurrencyField" dataName="EAKColl.EAExtendedCurrencyField" type="Currency" currency="EUR" numberType="bigDecimal" maximumValue="200000" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="eca4_Label12" text="onBlur;onClick;onChange;onFocus" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="eca4_Label09" text="Number TYpe" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="eca4_txtEANumberField" dataName="EAKColl.EANumberField" type="Number" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="eca4_Label12Copy" text="onBlur;onClick;onChange;onFocus" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="eca4_Button02" type="submit" text="Submit" operationId="eca4Op" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="eca4_txtEAInformationDisplay" dataName="EAKColl.EAInformationDisplayField" width="659px" height="25px" textWrap="false"/>
                      </td>
                    </tr>
                  </table>
                </bttdojo:form>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="eca4_Group05" text="Backend VS. Actions(problem)" textWrap="false">
          <table>
            <tr>
              <td>
                <bttdojo:form id="eca4_Form04" operationId="eca4Op" errorPage="eca/eca4.jsp">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="eca4_txtRandomConditionName" dataName="BAKColl.RandomConditionName" readOnly="true" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="eca4_Button03" type="button" text="Fetch Values" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="eca4_txtRandomConditionId" dataName="BAKColl.RandomConditionId" visibility="hidden" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="eca4_Edit Mode" text="Edit Mode" textWrap="false"/>
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
                        <bttdojo:textbox id="eca4_txtBACurrencyField" dataName="BAKColl.BACurrency" type="Currency" currency="EUR" numberType="bigDecimal" decimalPlaces="2" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="eca4_txtBADateField" dataName="BAKColl.BADate" type="Date" pattern="yyyy-MM-dd" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="eca4_txtBANumberField" dataName="BAKColl.BANumber" type="Number" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="eca4_txtBADate2" dataName="BAKColl.BADate2" type="Date" pattern="yyyy-MM-dd" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="eca4_txtBAPlainField" dataName="BAKColl.BAString" type="String" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="center" valign="middle">
                        <bttdojo:button id="eca4_Button04" type="button" text="Focus" inValid="true" textWrap="false"/>
                      </td>
                      <td align="center" valign="middle">
                        <bttdojo:button id="eca4_Button05" type="button" text="Disabled" inValid="true" textWrap="false"/>
                      </td>
                      <td align="center" valign="middle">
                        <bttdojo:button id="eca4_Button06" type="button" text="ReadOnly" inValid="true" textWrap="false"/>
                      </td>
                      <td align="center" valign="middle">
                        <bttdojo:button id="eca4_Button07" type="button" text="DateSubmitTest" inValid="true" textWrap="false"/>
                      </td>
                      <td align="center" valign="middle">
                        <bttdojo:button id="eca4_Button08" type="button" text="Visibility" inValid="true" textWrap="false"/>
                      </td>
                    </tr>
                  </table>
                </bttdojo:form>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="eca4_Group06" text="API: showErrorMessage(...)" textWrap="false">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="eca4_Label13" text="Sample Widget:" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:textbox id="eca4_Text01" dataName="EAKColl.EAInformationDisplayField" hint="Only for testing api, no need to care the value of this widget!" textWrap="false"/>
              </td>
              <td>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="center" valign="middle">
                <bttdojo:button id="eca4_btnShowErrMsg1" type="button" text="ShowNonNlsMsg" textWrap="false"/>
              </td>
              <td align="center" valign="middle">
                <bttdojo:button id="eca4_btnShowErrMsg4" type="button" text="ShowNonNlsParamedMsg" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="eca4_btnShowErrMsg5" type="button" text="ShowConstantMsgWithParams" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="center" valign="middle">
                <bttdojo:button id="eca4_btnShowErrMsg2" type="button" text="ShowNlsMsg" textWrap="false"/>
              </td>
              <td align="center" valign="middle">
                <bttdojo:button id="eca4_btnShowErrMsg3" type="button" text="ShowNlsParamedMsg" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="eca4_btnShowErrMsg6" type="button" text="ShowExtraParamedNlsMsg" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
      <td>
      </td>
    </tr>
  </table>

</body>
</html>