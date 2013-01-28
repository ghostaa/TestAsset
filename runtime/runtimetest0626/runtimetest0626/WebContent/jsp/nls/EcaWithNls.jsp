<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from EcaWithNls.xui by Administrator, on Mon Jan 28 14:33:49 CST 2013 -->
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



@import "css/dijit/main.css";

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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/nls/EcaWithNls.js"> </script>
<bttdojo:form id="EcaWithNls_Form01" operationId="ecaWithNlsOp" errorPage="nls/EcaWithNls.jsp">
  <table>
    <tr>
      <td colspan="3" align="left" valign="middle">
        <bttdojo:label id="EcaWithNls_Label01" text="Change Text & Hint attributes of Label by ECA-To Test nls with eca" textWrap="false"/>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td>
      </td>
      <td align="left" valign="middle">
<div style="display:inline-block;" class="customStyle">        <bttdojo:button id="EcaWithNls_btnChangeHintText" type="button" text="%nls.NlsSupportTestResourse/_0BUTTON_NLS" hint="%nls.NlsSupportTestResourse/_0BUTTON_NLS" textWrap="false"/>
</div>      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="EcaWithNls_Label03" text="1: Label" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="EcaWithNls_Label02" dataName="labelTextField" text="%nls.NlsSupportTestResourse/_2Tip_Message2" hint="%nls.NlsSupportTestResourse/_2Tip_Message1" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="EcaWithNls_Label04" text="2: Image" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:image id="EcaWithNls_Image01" dataName="imageDataNameField" location="/img/location.gif" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td rowspan="5" align="left" valign="middle">
        <bttdojo:label id="EcaWithNls_Label05" text="3: TextBox" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="EcaWithNls_Text01" dataName="PlainTextBoxValueField" hint="%nls.NlsSupportTestResourse/_2Tip_Message1" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="EcaWithNls_Label06" text="Plain" textWrap="false"/>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:textbox id="EcaWithNls_Text02" dataName="CurrencyTextBoxValueField" type="Currency" currency="EUR" numberType="bigDecimal" hint="%nls.NlsSupportTestResourse/_2Tip_Message1" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="EcaWithNls_Label07" text="Currency" textWrap="false"/>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:textbox id="EcaWithNls_Text03" dataName="DateTextBoxValueField" type="Date" pattern="yyyy-MM-dd" hint="%nls.NlsSupportTestResourse/_2Tip_Message1" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="EcaWithNls_Label08" text="Date" textWrap="false"/>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:textbox id="EcaWithNls_Text04" dataName="NumberTextBoxValueField" type="Number" hint="%nls.NlsSupportTestResourse/_2Tip_Message1" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="EcaWithNls_Label09" text="Number" textWrap="false"/>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:textbox id="EcaWithNls_Text05" dataName="StringTextBoxValueField" hint="%nls.NlsSupportTestResourse/_2Tip_Message1" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="EcaWithNls_Label10" text="String" textWrap="false"/>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="EcaWithNls_Label11" text="4: TextArea" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textArea id="EcaWithNls_TextArea01" dataName="TextAreaValueField" hint="%nls.NlsSupportTestResourse/_2Text_Value1" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td rowspan="4" align="left" valign="middle">
        <bttdojo:label id="EcaWithNls_Label12" text="5: Button" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:button id="EcaWithNls_Button01" type="submit" text="%nls.NlsSupportTestResourse/_2Tip_Message2" operationId="ecaWithNlsOp" hint="%nls.NlsSupportTestResourse/_0Submit_Button" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="EcaWithNls_Label13" text="Submit" textWrap="false"/>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:button id="EcaWithNls_Button03" type="reset" text="%nls.NlsSupportTestResourse/_2Text_Value2" hint="%nls.NlsSupportTestResourse/_0Reset_Button" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="EcaWithNls_Label14" text="Reset" textWrap="false"/>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:button id="EcaWithNls_Button02" type="submit" text="%nls.NlsSupportTestResourse/_2Text_Value1" visibility="hidden" operationId="NlsPageRefreshOp" hint="%nls.NlsSupportTestResourse/_0Button_Button" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="EcaWithNls_label" text="Button" textWrap="false"/>
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
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="EcaWithNls_Label16" text="6: CheckBox" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:checkbox id="EcaWithNls_CheckBox01" dataName="CheckBoxValueField" checkedValue="I_Have_Been_Checked" text="%nls.NlsSupportTestResourse/_2Tip_Message2" hint="%nls.NlsSupportTestResourse/_2Text_Value2" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="EcaWithNls_Label17" text="7: RadioButton" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:radio id="EcaWithNls_Radio01" dataName="RadioButtonValueField" text="%nls.NlsSupportTestResourse/_2Tip_Message2" hint="%nls.NlsSupportTestResourse/_2Text_Value1" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="EcaWithNls_Label18" text="8: Anchor" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:a id="EcaWithNls_Link01" text="%nls.NlsSupportTestResourse/_0First_Page_Button" operationId="DisplayPageOp" hint="%nls.NlsSupportTestResourse/_0First_Page_Button" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="EcaWithNls_Label19" text="9: ComboBox" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:combo id="EcaWithNls_Combo01" dataName="ComboBoxValueField" dataNameForList="Combo2Options" hint="%nls.NlsSupportTestResourse/_2Tip_Message1" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="EcaWithNls_Label20" text="10: SelectList" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:select id="EcaWithNls_SelectList01" dataName="SelectListValueField" dataNameForList="Select2Options" hint="%nls.NlsSupportTestResourse/_2Tip_Message2" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="EcaWithNls_Label21" text="11: RichTextEditor" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:richTextEditor id="EcaWithNls_RichText01" dataName="RichTextEditorValueField" hint="%nls.NlsSupportTestResourse/_2Text_Value1" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="EcaWithNls_Label22" text="12: Table" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:table id="EcaWithNls_Table01" dataName="TableValueField" dataNameForList="Combo2Options" hint="%nls.NlsSupportTestResourse/_2Text_Value1" width="305px" height="202px" textWrap="false" isPageable="false">
          <bttdojo:column align="left" dataName="label" width="140" text="%nls.NlsSupportTestResourse/_Table_Column5"/>
          <bttdojo:column widget="TextBox" align="left" dataName="value" width="140" text="%nls.NlsSupportTestResourse/_Table_Column5"/>
        </bttdojo:table>
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
  </table>
</bttdojo:form>

</body>
</html>