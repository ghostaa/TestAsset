<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from checkbox.xui by Administrator, on Mon Jan 28 14:33:42 CST 2013 -->
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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/checkbox.js"> </script>
  <table id="checkbox_null">
    <tr>
      <td>
        <bttdojo:form id="checkbox_form1" operationId="checkboxOp" errorPage="checkbox.jsp">
          <table>
            <tr>
              <td valign="top">
                <bttdojo:group id="checkbox_group1" text="CheckBox Group 1-to verify isChecked property" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="checkbox_Label01" text="CheckBox:" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:checkbox id="checkbox_chkJava" dataName="java" checkedValue="true" text="Java" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:checkbox id="checkbox_chkCpp" dataName="c++" checkedValue="true" text="C++" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="checkbox_Label02" text="Value:" width="52px" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="checkbox_Label03" text="Java" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="checkbox_Label04" dataName="java" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="checkbox_Label05" text="C++" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="checkbox_Label06" dataName="c++" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:button id="checkbox_btnToggleJava" type="button" text="toggle Java" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="checkbox_btnToggleCpp" type="button" text="toggle C++" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="checkbox_Button01" type="submit" text="Submit" operationId="CheckBoxOp" textWrap="false"/>
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
    <tr>
      <td>
        <bttdojo:form id="checkbox_form02" errorPage="checkbox.jsp">
          <table>
            <tr>
              <td>
                <bttdojo:group id="checkbox_Group01" text="Test set properties - to verify the  common property of CheckBox" textWrap="false">
                  <table>
                    <tr>
                      <td colspan="2" align="left" valign="middle">
                        <bttdojo:checkbox id="checkbox_CheckBox01" dataName="checkbox" checkedValue="true" text="Check Me" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:button id="checkbox_btnToggleDisable" type="button" text="toggle disable" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="checkbox_btnToggleReadonly" type="button" text="toggle readOnly" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:button id="checkbox_btnVisible" type="button" text="visibility=visible" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="checkbox_btnHidden" type="button" text="visibility=hidden" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:button id="checkbox_btnGone" type="button" text="visibility=gone" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="checkbox_btnSetFocus" type="button" text="set focus" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:button id="checkbox_btnSetTextAt" type="button" text="Set text=" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="checkbox_checkboxText" dataName="inputText" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:button id="checkbox_btnIsFocusable" type="button" text="isFocusable?" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="2" align="left" valign="middle">
                        <bttdojo:label id="checkbox_lblIsFocusable" text="display true if isFocusable, otherwise unchanged" textWrap="false"/>
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
    <tr>
      <td>
        <bttdojo:form id="checkbox_form01" errorPage="checkbox.jsp">
          <table>
            <tr>
              <td>
                <bttdojo:group id="checkbox_Group02" text="Test checkedValue and uncheckedValue" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:checkbox id="checkbox_CheckBox02" dataName="trueFalseValue" checkedValue="true" text="(true/false)" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:checkbox id="checkbox_CheckBox03" dataName="onOffValue" checkedValue="on" text="on/off" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:checkbox id="checkbox_CheckBox04" dataName="aaaBbbValue" checkedValue="AAA" text="AAA/BBB" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="checkbox_Button02" type="submit" text="submit" operationId="CheckBoxOp" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="checkbox_Label07" dataName="trueFalseValue" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="checkbox_Label08" dataName="onOffValue" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="checkbox_Label09" dataName="aaaBbbValue" textWrap="false"/>
                      </td>
                      <td>
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
    <tr>
      <td>
        <bttdojo:form id="checkbox_form" errorPage="checkbox.jsp">
          <table>
            <tr>
              <td>
                <bttdojo:group id="checkbox_Group03" text="Test submit when readonly/disable" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:button id="checkbox_toogleSubmitReadonly" type="button" text="toggleReadonly" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:checkbox id="checkbox_readonlySubmit" dataName="readonlySubmitValue" checkedValue="checked" text="checked/unchecked" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="checkbox_readonlySubmitValue" dataName="readonlySubmitValue2" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:button id="checkbox_toggleSubmitDisable" type="button" text="toggleDisable" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:checkbox id="checkbox_disabelSubmit" dataName="disableSubmitValue" checkedValue="checked" text="checked/uncheched" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="checkbox_disableSubmitValue" dataName="disableSubmitValue2" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:button id="checkbox_Button03" type="submit" text="submit" operationId="CheckBoxOp" textWrap="false"/>
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
                    </tr>
                  </table>
                </bttdojo:group>
              </td>
            </tr>
          </table>
        </bttdojo:form>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="checkbox_Group05" text="Hint test- set hint by ECA" textWrap="false">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:checkbox id="checkbox_CheckBox07" dataName="checkbox" checkedValue="true" text="Music" hint="Original hint for checkbox" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="checkbox_Button06" type="button" text="change hint" textWrap="false"/>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
  </table>

</body>
</html>