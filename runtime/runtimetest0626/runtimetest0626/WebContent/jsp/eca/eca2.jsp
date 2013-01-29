<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from eca2.xui by Administrator, on Tue Jan 29 10:56:47 CST 2013 -->
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



@import "css/main.css";

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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/eca/eca2.js"> </script>
<bttdojo:form id="eca2_Form01" operationId="eca2Op" errorPage="eca/eca2.jsp">
  <table>
    <tr>
      <td colspan="6" align="left" valign="middle">
        <bttdojo:label id="eca2_Label01" text="ECA to TextArea widget" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td colspan="2" align="left" valign="middle">
        <bttdojo:textArea id="eca2_tareaUserComments" dataName="userComments" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="eca2_Label02" text="Values Submitted:" textWrap="false"/>
      </td>
      <td colspan="3" align="left" valign="middle">
        <bttdojo:label id="eca2_Label03" dataName="value4Display" text="Submitted values will be displayed here" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td colspan="6" align="left" valign="middle">
        <bttdojo:textbox id="eca2_txtUserCommentsModifyResult" dataName="updtResult" visibility="hidden" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:button id="eca2_btnSubmit" type="submit" text="Submit" operationId="eca2Op" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:button id="eca2_btnReset" type="reset" text="Reset" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:button id="eca2_btnFocus" type="button" text="Focus" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:button id="eca2_btnDisable" type="button" text="Disabled" textWrap="false"/>
      </td>
      <td>
      </td>
      <td align="left" valign="middle">
        <bttdojo:button id="eca2_btnReadOnly" type="button" text="ReadOnly" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td>
      </td>
      <td align="left" valign="middle">
        <bttdojo:button id="eca2_btnVisible" type="button" text="Hidden" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:button id="eca2_btnHidden" type="button" text="Gone" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:button id="eca2_btnGone" type="button" text="Visible" textWrap="false"/>
      </td>
      <td>
      </td>
      <td align="left" valign="middle">
        <bttdojo:button id="eca2_btnIsFocusable" type="button" text="IsFocusable" textWrap="false"/>
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
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td colspan="6" align="left" valign="middle">
        <bttdojo:textArea id="eca2_txtareaInfo" dataName="frontOperationInfo" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td colspan="6">
      </td>
    </tr>
    <tr>
      <td colspan="6" rowspan="2">
        <bttdojo:group id="eca2_Group02" text="Test Focus --To test focus function of TextArea under different conditions" textWrap="false">
          <table>
            <tr>
              <td>
              </td>
              <td align="left" valign="middle">
                <bttdojo:textArea id="eca2_TextArea02" dataName="focusText" textWrap="false"/>
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
                <bttdojo:label id="eca2_Label04" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="eca2_Button03" type="button" text="isFocusable()" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="eca2_Button04" type="button" text="hidden" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="eca2_Button05" type="button" text="disabled" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="eca2_Button06" type="button" text="readOnly" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="eca2_Button07" type="button" text="gone" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="eca2_Button08" type="button" text="focus()" textWrap="false"/>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
    </tr>
  </table>
</bttdojo:form>

</body>
</html>