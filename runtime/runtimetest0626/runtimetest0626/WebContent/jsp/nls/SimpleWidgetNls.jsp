<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from SimpleWidgetNls.xui by Administrator, on Mon Jan 28 14:33:50 CST 2013 -->
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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/nls/SimpleWidgetNls.js"> </script>
  <table id="SimpleWidgetNls_null">
    <tr>
      <td>
        <bttdojo:group id="SimpleWidgetNls_Group01" text="Label text & hint NLS test cases" textWrap="false">
          <table>
            <tr>
              <td>
                <bttdojo:form id="SimpleWidgetNls_Form01" operationId="simpleWidgetNlsOp" errorPage="nls/SimpleWidgetNls.jsp">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="SimpleWidgetNls_Label02" text="Constant string as the value of attribute [text]:" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="SimpleWidgetNls_labelConstant" text="%nls.NlsSupportTestResourse/_2Text_Value1" hint="%nls.NlsSupportTestResourse/_2Tip_Message1" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="SimpleWidgetNls_Label03" text="DataName value as the value of attribute [text]:" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="SimpleWidgetNls_labelDataName" dataName="LabelKColl.labelDataName" text="%nls.NlsSupportTestResourse/_2Text_Value2" hint="%nls.NlsSupportTestResourse/_2Tip_Message2" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="SimpleWidgetNls_Label27" text="plain label with non-NLS hint or text value [text]:" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="SimpleWidgetNls_Plain Label" text="Plain Text" hint="plain label with non-NLS hint" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="SimpleWidgetNls_Button01" type="submit" text="%nls.NlsSupportTestResourse/_0Submit_Button" operationId="simpleWidgetNlsOp" hint="%nls.NlsSupportTestResourse/_0Submit_Button" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="SimpleWidgetNls_Button02" type="submit" text="%nls.NlsSupportTestResourse/_0First_Page_Button" operationId="SimpleWidgetNlsRefreshPageOp" hint="%nls.NlsSupportTestResourse/_0First_Page_Button" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="SimpleWidgetNls_Label29" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="SimpleWidgetNls_Label28" textWrap="false"/>
                      </td>
                    </tr>
                  </table>
                </bttdojo:form>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="SimpleWidgetNls_Group02" text="Image text & hint NLS test cases" textWrap="false">
          <table>
            <tr>
              <td>
                <bttdojo:form id="SimpleWidgetNls_Form02" operationId="simpleWidgetNlsOp" errorPage="nls/SimpleWidgetNls.jsp">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="SimpleWidgetNls_Label04" text="Image with location attribute:" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:image id="SimpleWidgetNls_imgLocation" location="img/location.gif" hint="%nls.NlsSupportTestResourse/_2Tip_Message1" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="SimpleWidgetNls_Label05" text="Image with dataName attribute:" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:image id="SimpleWidgetNls_imgDataName" dataName="ImageKColl.imgDataName" hint="%nls.NlsSupportTestResourse/_2Tip_Message2" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="SimpleWidgetNls_Button03" type="submit" text="%nls.NlsSupportTestResourse/_0Submit_Button" operationId="simpleWidgetNlsOp" hint="%nls.NlsSupportTestResourse/_0Submit_Button" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="SimpleWidgetNls_Button04" type="submit" text="%nls.NlsSupportTestResourse/_0First_Page_Button" operationId="SimpleWidgetNlsRefreshPageOp" hint="%nls.NlsSupportTestResourse/_0First_Page_Button" textWrap="false"/>
                      </td>
                    </tr>
                  </table>
                </bttdojo:form>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="SimpleWidgetNls_Group03" text="TextBox hint NLS test cases" textWrap="false">
          <table>
            <tr>
              <td>
                <bttdojo:form id="SimpleWidgetNls_Form03" operationId="simpleWidgetNlsOp" errorPage="nls/SimpleWidgetNls.jsp">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="SimpleWidgetNls_Label06" text="Plain BTT Data Field:" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="SimpleWidgetNls_txtPlain" dataName="TextKColl.txtPlainField" hint="%nls.NlsSupportTestResourse/_2Tip_Message1" textWrap="false"/>
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
                        <bttdojo:label id="SimpleWidgetNls_Label07" text="Currency Typed Data:" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="SimpleWidgetNls_txtCurrency" dataName="TextKColl.txtCurrencyField" type="Currency" currency="USD" numberType="bigDecimal" hint="%nls.NlsSupportTestResourse/_2Tip_Message2" textWrap="false"/>
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
                        <bttdojo:label id="SimpleWidgetNls_Label08" text="Date Typed Data:" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="SimpleWidgetNls_txtDate" dataName="TextKColl.txtDateField" type="Date" pattern="yyyy-MM-dd" maximumDate="today+1m" hint="%nls.NlsSupportTestResourse/_2Text_Value1" textWrap="false"/>
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
                        <bttdojo:label id="SimpleWidgetNls_Label09" text="Number Typed Data:" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="SimpleWidgetNls_txtNumber" dataName="TextKColl.txtNumberField" type="Number" hint="%nls.NlsSupportTestResourse/_2Text_Value2" textWrap="false"/>
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
                        <bttdojo:label id="SimpleWidgetNls_Label10" text="String Typed Data:" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="SimpleWidgetNls_txtString" dataName="TextKColl.txtStringField" type="String" maximumLength="6" hint="%nls.NlsSupportTestResourse/_2Tip_Message1" textWrap="false"/>
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
                        <bttdojo:label id="SimpleWidgetNls_Label11" text="String Typed Password Data:" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="SimpleWidgetNls_txtStrPwd" dataName="TextKColl.txtStringPassword" type="String" minimumLength="3" maximumLength="8" hint="%nls.NlsSupportTestResourse/_2Tip_Message2" password="true" textWrap="false"/>
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
                        <bttdojo:label id="SimpleWidgetNls_Label12" text="Currency Typed Disabled Data:" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="SimpleWidgetNls_txtCurrencyDisabled" dataName="TextKColl.txtCurrencyDisabled" type="Currency" currency="USD" numberType="bigDecimal" disabled="true" hint="%nls.NlsSupportTestResourse/_2Text_Value1" textWrap="false"/>
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
                        <bttdojo:label id="SimpleWidgetNls_Label13" text="Date Typed ReadOnly Data:" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="SimpleWidgetNls_txtDateReadOnly" dataName="TextKColl.txtDateReadOnly" type="Date" pattern="yyyy-MM-dd" maximumDate="today+1d" readOnly="true" hint="%nls.NlsSupportTestResourse/_2Text_Value2" textWrap="false"/>
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
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="SimpleWidgetNls_Group04" text="TextArea hint NLS test cases" textWrap="false">
          <table>
            <tr>
              <td>
                <bttdojo:form id="SimpleWidgetNls_Form04" operationId="simpleWidgetNlsOp" errorPage="nls/SimpleWidgetNls.jsp">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:textArea id="SimpleWidgetNls_taPlain1" dataName="TextAreaKColl.taPlainField1" hint="%nls.NlsSupportTestResourse/_2Tip_Message1" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textArea id="SimpleWidgetNls_taPlain2" dataName="TextAreaKColl.taPlainField2" disabled="true" hint="%nls.NlsSupportTestResourse/_2Tip_Message2" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textArea id="SimpleWidgetNls_taPlain3" dataName="TextAreaKColl.taPlainField3" readOnly="true" hint="%nls.NlsSupportTestResourse/_2Text_Value1" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="SimpleWidgetNls_Button07" type="submit" text="%nls.NlsSupportTestResourse/_0Submit_Button" operationId="simpleWidgetNlsOp" hint="%nls.NlsSupportTestResourse/_0Submit_Button" textWrap="false"/>
                      </td>
                    </tr>
                  </table>
                </bttdojo:form>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="SimpleWidgetNls_Group05" text="Button hint & text NLS test cases" textWrap="false">
          <table>
            <tr>
              <td>
                <bttdojo:form id="SimpleWidgetNls_Form05" operationId="simpleWidgetNlsOp" errorPage="nls/SimpleWidgetNls.jsp">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:button id="SimpleWidgetNls_btnSubmit" type="submit" text="%nls.NlsSupportTestResourse/_0Submit_Button" operationId="simpleWidgetNlsOp" hint="%nls.NlsSupportTestResourse/_0Submit_Button" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="SimpleWidgetNls_btnButton" type="button" text="%nls.NlsSupportTestResourse/_0Button_Button" hint="%nls.NlsSupportTestResourse/_0Button_Button" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="SimpleWidgetNls_btnReset" type="submit" text="%nls.NlsSupportTestResourse/_0Reset_Button" hint="%nls.NlsSupportTestResourse/_0Reset_Button" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="SimpleWidgetNls_btnSubmitDisabled" type="submit" text="%nls.NlsSupportTestResourse/_0Submit_Button" inValid="true" operationId="simpleWidgetNlsOp" hint="%nls.NlsSupportTestResourse/_2Tip_Message1" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="SimpleWidgetNls_btnButtonIcon" type="button" text="%nls.NlsSupportTestResourse/_0Button_Button" hint="%nls.NlsSupportTestResourse/_2Text_Value2" icon="img/ico/3.png" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="SimpleWidgetNls_btnTextNLS" type="button" text="%nls.NlsSupportTestResourse/_2Text_Value1" hint="%nls.NlsSupportTestResourse/_2Text_Value1" textWrap="false"/>
                      </td>
                      <td>
                      </td>
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
                        <bttdojo:button id="SimpleWidgetNls_btnForTest" type="button" text="BtnForTest" textWrap="false"/>
                      </td>
                      <td colspan="2" align="left" valign="middle">
                        <bttdojo:label id="SimpleWidgetNls_lblInfo" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="SimpleWidgetNls_btnIsFocusable" type="button" text="isFocusable" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="SimpleWidgetNls_btnDisable" type="button" text="disable" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="SimpleWidgetNls_btnEnable" type="button" text="enable" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="SimpleWidgetNls_btnReadOnly" type="button" text="readOnly" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="SimpleWidgetNls_btnUndoReadOnly" type="button" text="undoReadOnly" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="SimpleWidgetNls_btnHide" type="button" text="hide" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="SimpleWidgetNls_btnVisible" type="button" text="visible" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="SimpleWidgetNls_btnGone" type="button" text="gone" textWrap="false"/>
                      </td>
                    </tr>
                  </table>
                </bttdojo:form>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="SimpleWidgetNls_Group06" text="CheckBox hint & text NLS test cases" textWrap="false">
          <table>
            <tr>
              <td>
                <bttdojo:form id="SimpleWidgetNls_Form06" operationId="simpleWidgetNlsOp" errorPage="nls/SimpleWidgetNls.jsp">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:checkbox id="SimpleWidgetNls_chkboxConstantString" dataName="CheckBoxKColl.cbPlainField1" checkedValue="true" text="Constant String in English" hint="Tip message that do not change with locale!" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:checkbox id="SimpleWidgetNls_chkboxNlsTextDisabled" dataName="CheckBoxKColl.cbPlainField3" checkedValue="true" text="%nls.NlsSupportTestResourse/_2Text_Value1" disabled="true" hint="%nls.NlsSupportTestResourse/_2Text_Value1" textWrap="false"/>
                      </td>
                      <td rowspan="2" align="left" valign="middle">
                        <bttdojo:button id="SimpleWidgetNls_Button08" type="submit" text="%nls.NlsSupportTestResourse/_0Submit_Button" operationId="simpleWidgetNlsOp" hint="%nls.NlsSupportTestResourse/_0Submit_Button" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:checkbox id="SimpleWidgetNls_chkboxNlsText" dataName="CheckBoxKColl.cbPlainField2" checkedValue="true" text="%nls.NlsSupportTestResourse/_2Text_Value2" hint="%nls.NlsSupportTestResourse/_2Text_Value2" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:checkbox id="SimpleWidgetNls_chkboxNlsTextReadOnly" dataName="CheckBoxKColl.cbPlainField4" checkedValue="true" text="%nls.NlsSupportTestResourse/_2Tip_Message2" readOnly="true" hint="%nls.NlsSupportTestResourse/_2Tip_Message2" textWrap="false"/>
                      </td>
                    </tr>
                  </table>
                </bttdojo:form>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="SimpleWidgetNls_Group07" text="RadioButton hint & text NLS test cases" textWrap="false">
          <table>
            <tr>
              <td>
                <bttdojo:form id="SimpleWidgetNls_Form07" operationId="simpleWidgetNlsOp" errorPage="nls/SimpleWidgetNls.jsp">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:radio id="SimpleWidgetNls_rdConstantStr" dataName="RadioButtonKColl.rbPlainField1" value="0" text="Constant String in English!" hint="Tip message only in english!" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:radio id="SimpleWidgetNls_rbNlsTextDisabled" dataName="RadioButtonKColl.rbPlainField1" value="2" text="%nls.NlsSupportTestResourse/_2Text_Value2" disabled="true" hint="%nls.NlsSupportTestResourse/_2Tip_Message2" textWrap="false"/>
                      </td>
                      <td rowspan="2" align="left" valign="middle">
                        <bttdojo:button id="SimpleWidgetNls_Button09" type="submit" text="%nls.NlsSupportTestResourse/_0Submit_Button" operationId="simpleWidgetNlsOp" hint="%nls.NlsSupportTestResourse/_0Submit_Button" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:radio id="SimpleWidgetNls_rdNlsText" dataName="RadioButtonKColl.rbPlainField1" value="1" text="%nls.NlsSupportTestResourse/_2Text_Value1" hint="%nls.NlsSupportTestResourse/_2Tip_Message1" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:radio id="SimpleWidgetNls_rbNlsTextReadOnly" dataName="RadioButtonKColl.rbPlainField1" value="3" text="%nls.NlsSupportTestResourse/_2Tip_Message1" hint="%nls.NlsSupportTestResourse/_2Text_Value1" textWrap="false"/>
                      </td>
                    </tr>
                  </table>
                </bttdojo:form>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="SimpleWidgetNls_Group08" text="Anchor hint & text NLS test cases" textWrap="false">
          <table>
            <tr>
              <td>
                <bttdojo:form id="SimpleWidgetNls_Form08" operationId="simpleWidgetNlsOp" errorPage="nls/SimpleWidgetNls.jsp">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:a id="SimpleWidgetNls_anchorPlainTextHint" text="Constant String Value." operationId="DisplayPageOp" hint="Plain anchor with palin text and hint in English!" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:a id="SimpleWidgetNls_anchorNlsDisabled" text="%nls.NlsSupportTestResourse/_2Text_Value2" disabled="true" operationId="DisplayPageOp" hint="%nls.NlsSupportTestResourse/_2Tip_Message2" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:a id="SimpleWidgetNls_anchorNls" text="%nls.NlsSupportTestResourse/_2Text_Value1" operationId="DisplayPageOp" hint="%nls.NlsSupportTestResourse/_2Tip_Message1" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                  </table>
                </bttdojo:form>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="SimpleWidgetNls_Group09" text="ComboBox hint & text NLS test cases" textWrap="false">
          <table>
            <tr>
              <td>
                <bttdojo:form id="SimpleWidgetNls_Form11" operationId="simpleWidgetNlsOp" errorPage="nls/SimpleWidgetNls.jsp">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="SimpleWidgetNls_Label19" text="Constant String hint message and Non-NLS options" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:combo id="SimpleWidgetNls_comboConstantStrHintOpt" dataName="ComboBoxKColl.cbPlainField1" dataNameForList="Combo1Options" hint="Sample constant string hint message!" textWrap="false"/>
                      </td>
                      <td rowspan="6" align="left" valign="middle">
                        <bttdojo:button id="SimpleWidgetNls_Button12" type="submit" text="%nls.NlsSupportTestResourse/_0Submit_Button" operationId="simpleWidgetNlsOp" hint="%nls.NlsSupportTestResourse/_0Submit_Button" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="SimpleWidgetNls_Label20" text="NLS hint message and NLS options" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:combo id="SimpleWidgetNls_comboNlsHintandOpts" dataName="ComboBoxKColl.cbPlainField2" dataNameForList="Combo2Options" hint="%nls.NlsSupportTestResourse/_2Tip_Message1" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="SimpleWidgetNls_Label21" text="NLS hint message and NLS options Disabled" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:combo id="SimpleWidgetNls_comboNlsHintOptDisabled" dataName="ComboBoxKColl.cbPlainField3" dataNameForList="Combo2Options" disabled="true" hint="%nls.NlsSupportTestResourse/_2Tip_Message2" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="SimpleWidgetNls_Label22" text="NLS hint message and NLS options ReadOnly" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:combo id="SimpleWidgetNls_comboNlsHintOptsReadOnly" dataName="ComboBoxKColl.cbPlainField4" dataNameForList="Combo2Options" readOnly="true" hint="%nls.NlsSupportTestResourse/_2Text_Value1" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="SimpleWidgetNls_Label23" text="NLS hint message and Non-NLS static options list" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:combo id="SimpleWidgetNls_comboNonNlsStaticOpt" dataName="ComboBoxKColl.cbPlainField5" storeURL="listfiles/non_nls_opts.js" hint="Sample Static Options Hint Message!" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="SimpleWidgetNls_Label24" text="NLS hint message and NLS static options list" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:combo id="SimpleWidgetNls_comboNlsStaticOpts" dataName="ComboBoxKColl.cbPlainField6" storeURL="listFiles/nls_opts.js" hint="%nls.NlsSupportTestResourse/_2Text_Value2" textWrap="false"/>
                      </td>
                    </tr>
                  </table>
                </bttdojo:form>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="SimpleWidgetNls_Group10" text="SelectList hint & text NLS test cases" textWrap="false">
          <table>
            <tr>
              <td>
                <bttdojo:form id="SimpleWidgetNls_Form10" operationId="simpleWidgetNlsOp" errorPage="nls/SimpleWidgetNls.jsp">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="SimpleWidgetNls_Label01" text="Constant String hint message and Non-NLS options" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:select id="SimpleWidgetNls_slPlainConstantStrHint" dataName="SelectListKColl.slPlainField1" dataNameForList="Select1Options" hint="Sample constant string tooltip message only in english!" textWrap="false"/>
                      </td>
                      <td rowspan="6" align="left" valign="middle">
                        <bttdojo:button id="SimpleWidgetNls_Button11" type="submit" text="%nls.NlsSupportTestResourse/_0Submit_Button" operationId="simpleWidgetNlsOp" hint="%nls.NlsSupportTestResourse/_0Submit_Button" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="SimpleWidgetNls_Label14" text="NLS hint message and NLS options" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:select id="SimpleWidgetNls_slNlsTipandOps" dataName="SelectListKColl.slPlainField2" dataNameForList="Select2Options" hint="%nls.NlsSupportTestResourse/_2Tip_Message1" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="SimpleWidgetNls_Label15" text="NLS hint message and NLS options Disabled" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:select id="SimpleWidgetNls_slNlsTipandOpsDisabled" dataName="SelectListKColl.slPlainField3" dataNameForList="Select2Options" disabled="true" hint="%nls.NlsSupportTestResourse/_2Tip_Message2" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="SimpleWidgetNls_Label16" text="NLS hint message and NLS options ReadOnly" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:select id="SimpleWidgetNls_slNlsHintandOpsReadOnly" dataName="SelectListKColl.slPlainField4" dataNameForList="Select2Options" readOnly="true" hint="%nls.NlsSupportTestResourse/_2Text_Value1" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="SimpleWidgetNls_Label17" text="NLS hint message and Non-NLS static options list" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:select id="SimpleWidgetNls_slNonNlsStaticOpts" dataName="ComboBoxKColl.cbPlainField5" storeURL="listfiles/non_nls_opts.js" hint="Sample Static Options Hint Message!" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="SimpleWidgetNls_Label18" text="NLS hint message and NLS static options list" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:select id="SimpleWidgetNls_slNlsStaticOpts" dataName="SelectListKColl.slPlainField6" storeURL="listFiles/nls_opts.js" hint="%nls.NlsSupportTestResourse/_2Text_Value2" textWrap="false"/>
                      </td>
                    </tr>
                  </table>
                </bttdojo:form>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="SimpleWidgetNls_Group11" text="RichTextEditor hint & text NLS test cases" textWrap="false">
          <table>
            <tr>
              <td>
                <bttdojo:form id="SimpleWidgetNls_Form09" operationId="simpleWidgetNlsOp" errorPage="nls/SimpleWidgetNls.jsp">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:richTextEditor id="SimpleWidgetNls_rtePlain" dataName="RichTextEditorKColl.rtePlainField1" hint="RichTextEditor tip message only in English!" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:richTextEditor id="SimpleWidgetNls_rteNlsHint" dataName="RichTextEditorKColl.rtePlainField2" hint="%nls.NlsSupportTestResourse/_2Tip_Message1" textWrap="false"/>
                      </td>
                      <td rowspan="2" align="left" valign="middle">
                        <bttdojo:button id="SimpleWidgetNls_Button10" type="submit" text="%nls.NlsSupportTestResourse/_0Submit_Button" operationId="simpleWidgetNlsOp" hint="%nls.NlsSupportTestResourse/_0Submit_Button" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:richTextEditor id="SimpleWidgetNls_rteHintNlsDisabled" dataName="RichTextEditorKColl.rtePlainField3" hint="%nls.NlsSupportTestResourse/_2Tip_Message2" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:richTextEditor id="SimpleWidgetNls_rteHintNlsReadOnly" dataName="RichTextEditorKColl.rtePlainField4" hint="%nls.NlsSupportTestResourse/_2Text_Value1" textWrap="false"/>
                      </td>
                    </tr>
                  </table>
                </bttdojo:form>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="SimpleWidgetNls_Group12" text="Table hint & column text NLS test cases" textWrap="false">
          <table>
            <tr>
              <td>
                <bttdojo:form id="SimpleWidgetNls_Form13" operationId="simpleWidgetNlsOp" errorPage="nls/SimpleWidgetNls.jsp">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:table id="SimpleWidgetNls_tableNonNlsHint" dataName="TableKColl.Table1" dataNameForList="TableDataKColl.Table1DataList" hint="Constant String as a sample tip message!" textWrap="false" isPageable="false">
                          <bttdojo:column align="left" dataName="tbInnerField1" width="120" text="COL1"/>
                          <bttdojo:column align="left" dataName="tbInnerField2" width="120" text="COL2"/>
                          <bttdojo:column align="left" dataName="tbInnerField3" width="120" text="COL3"/>
                        </bttdojo:table>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:table id="SimpleWidgetNls_tableNlsHintandColText" dataName="TableKColl.Table2" dataNameForList="TableDataKColl.Table2DataList" hint="%nls.NlsSupportTestResourse/_2Tip_Message1" textWrap="false" isPageable="false">
                          <bttdojo:column align="left" dataName="tbInnerField1" width="120" text="%nls.NlsSupportTestResourse/_Table_Column1"/>
                          <bttdojo:column align="left" dataName="tbInnerField2" width="120" text="%nls.NlsSupportTestResourse/_Table_Column2"/>
                          <bttdojo:column align="left" dataName="tbInnerField3" width="120" text="%nls.NlsSupportTestResourse/_Table_Column3"/>
                        </bttdojo:table>
                      </td>
                      <td rowspan="2" align="left" valign="middle">
                        <bttdojo:button id="SimpleWidgetNls_Button14" type="submit" text="%nls.NlsSupportTestResourse/_0Submit_Button" operationId="simpleWidgetNlsOp" hint="%nls.NlsSupportTestResourse/_0Submit_Button" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:table id="SimpleWidgetNls_tableNlsHintandColTextDisabled" dataName="TableKColl.Table3" dataNameForList="TableDataKColl.Table3DataList" disabled="true" hint="%nls.NlsSupportTestResourse/_2Tip_Message2" textWrap="false" isPageable="false">
                          <bttdojo:column align="left" dataName="tbInnerField1" width="120" text="%nls.NlsSupportTestResourse/_Table_Column1"/>
                          <bttdojo:column align="left" dataName="tbInnerField2" width="120" text="%nls.NlsSupportTestResourse/_Table_Column2"/>
                          <bttdojo:column align="left" dataName="tbInnerField3" width="120" text="%nls.NlsSupportTestResourse/_Table_Column3"/>
                          <bttdojo:column align="left" dataName="tbInnerField4" width="120" text="%nls.NlsSupportTestResourse/_Table_Column4"/>
                          <bttdojo:column align="left" dataName="tbInnerField5" width="120" text="%nls.NlsSupportTestResourse/_Table_Column5"/>
                        </bttdojo:table>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:table id="SimpleWidgetNls_tableNlsHintandColTextReadOnly" dataName="TableKColl.Table4" dataNameForList="TableDataKColl.Table4DataList" readOnly="true" hint="%nls.NlsSupportTestResourse/_2Text_Value2" textWrap="false" isPageable="false">
                          <bttdojo:column align="left" dataName="tbInnerField1" width="120" text="%nls.NlsSupportTestResourse/_Table_Column1"/>
                          <bttdojo:column align="left" dataName="tbInnerField2" width="120" text="%nls.NlsSupportTestResourse/_Table_Column2"/>
                          <bttdojo:column align="left" dataName="tbInnerField3" width="120" text="%nls.NlsSupportTestResourse/_Table_Column3"/>
                          <bttdojo:column align="left" dataName="tbInnerField4" width="120" text="%nls.NlsSupportTestResourse/_Table_Column4"/>
                        </bttdojo:table>
                      </td>
                    </tr>
                  </table>
                </bttdojo:form>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="SimpleWidgetNls_Group14" text="File upload hint & text NLS test cases" textWrap="false">
          <table>
            <tr>
              <td>
                <bttdojo:form id="SimpleWidgetNls_Form14" operationId="simpleWidgetNlsOp" errorPage="nls/SimpleWidgetNls.jsp">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:fileupload id="SimpleWidgetNls_FileUpload01" dataName="fileupload1" hint="%nls.NlsSupportTestResourse/_2Tip_Message1" textWrap="false"/>
                      </td>
                    </tr>
                  </table>
                </bttdojo:form>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="SimpleWidgetNls_Group15" text="%nls.NlsSupportTestResourse/_2Tip_Message1" textWrap="false">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="SimpleWidgetNls_Label30" text="I am a blank group with NLS aware values as text!!" textWrap="false"/>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
  </table>

</body>
</html>