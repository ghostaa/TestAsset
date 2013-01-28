<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>
<html>
<!-- Generated from checkboxTest.xui by Administrator, on Thu Aug 23 11:13:41 CST 2012 -->
<head>
<%@ taglib uri="/WEB-INF/bttdojo.tld" prefix="bttdojo"%>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
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
@import "js/com/ibm/btt/dijit/templates/Label.css";
@import "js/com/ibm/btt/dijit/templates/Group.css";
@import "css/main.css";

.dojoxGrid table { margin: 0; }
.dj_gecko .dijitTextBoxReadOnly INPUT.dijitInputInner {
    -moz-user-input: auto;
}
.dj_gecko .dijitTextBoxReadOnlyFocused INPUT.dijitInputInner {
	-moz-user-input: none;
}
body{
	padding:20px;
}
</style>
<script type="text/javascript" src="js/dojo/dojo.js" djConfig="<bttdojo:locale/>,isDebug: false, parseOnLoad: true"></script>

<script type="text/javascript">
	dojo.require("dojo.parser");
	dojo.require("com.ibm.btt.dijit.Anchor");
	dojo.require("com.ibm.btt.dijit.Button");
	dojo.require("com.ibm.btt.dijit.CheckBox");	
	dojo.require("com.ibm.btt.dijit.ComboBox");	
	dojo.require("com.ibm.btt.dijit.CurrencyTextBox"); 
	dojo.require("com.ibm.btt.dijit.DateTextBox"); 
	dojo.require("com.ibm.btt.dijit.Form");
	dojo.require("com.ibm.btt.dijit.Image");
	dojo.require("com.ibm.btt.dijit.Label"); 
	dojo.require("com.ibm.btt.dijit.NumberTextBox");
	dojo.require("com.ibm.btt.dijit.RadioButton");
	dojo.require("com.ibm.btt.dijit.RichTextEditor");
	dojo.require("com.ibm.btt.dijit.Select"); 
	dojo.require("com.ibm.btt.dijit.StringTextBox");
	dojo.require("com.ibm.btt.dijit.TextArea");
	dojo.require("com.ibm.btt.dijit.Tree"); 
	dojo.require("com.ibm.btt.dijit.ValidationTextBox");
	dojo.require("com.ibm.btt.dijit.GridComparer");
	dojo.require("com.ibm.btt.event.Engine");  	
	dojo.require("com.ibm.btt.dijit.GridDijit");
	dojo.require("com.ibm.btt.dijit.Grid"); 
	dojo.require("com.ibm.btt.dijit.Message");
	dojo.require("com.ibm.btt.dijit.FileUpload");
	dojo.require("com.ibm.btt.dijit.Group"); 
	dojo.require("com.ibm.btt.dijit.TabbedPane");
	dojo.require("com.ibm.btt.dijit.ContentPane"); 
	dojo.require("com.ibm.btt.dijit.Hidden");
	dojo.require("com.ibm.btt.dijit.ScreenCover");  
	dojo.require("com.ibm.btt.dijit.Dialog");   
	dojo.require("com.ibm.btt.dijit.plugins.Pagination"); 		
	dojo.require("com.ibm.btt.event.BaseMonitor");
	dojo.require("com.ibm.btt.event.NavigationEngine");
	dojo.require("com.ibm.btt.util.GlobalFunctions");
	dojo.require("dojox.grid.enhanced.plugins.Pagination");
	dojo.require("dojox.grid.enhanced.plugins.IndirectSelection");
	dojo.require("dojox.grid.enhanced.plugins.NestedSorting");
	dojo.require("dojox.data.QueryReadStore");
</script>
<script type="text/javascript">
	if(!window.engine){
		<%if(utb.ajaxNavigationEnabled()){%>
			window.engine = new com.ibm.btt.event.NavigationEngine();
		<%}else{%>
			window.engine = new com.ibm.btt.event.Engine();
		<%}%>
		engine.setMonitor(new com.ibm.btt.event.BaseMonitor());
	}
</script>
</head>
<body class="claro">
<script type="text/javascript" src="jsp/checkbox.js"></script>
  <table id="checkboxTest_null">
    <tr>
      <td>
        <bttdojo:form id="checkboxTest_form1" operationId="checkboxOp" errorPage="checkboxTest.jsp">
          <table id="checkboxTest_form1">
            <tr>
              <td valign="top">
                <bttdojo:group id="checkboxTest_group1" text="CheckBox Group 1-to verify isChecked property">
                  <table id="checkboxTest_group1">
                    <tr>
                      <td>
                        <bttdojo:label id="checkboxTest_Label01" text="CheckBox:"/>
                      </td>
                      <td>
                        <bttdojo:checkbox id="checkboxTest_chkJava" dataName="java" checkedValue="true" uncheckedValue="false" text="Java"/>
                      </td>
                      <td>
                        <bttdojo:checkbox id="checkboxTest_chkCpp" dataName="c++" checkedValue="true" uncheckedValue="false" text="C++"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <bttdojo:label id="checkboxTest_Label02" text="Value:" width="52" textWrap="false"/>
                      </td>
                      <td>
                        <bttdojo:label id="checkboxTest_Label03" text="Java"/>
                      </td>
                      <td>
                      </td>
                      <td>
                        <bttdojo:label id="checkboxTest_Label04" dataName="java"/>
                      </td>
                    </tr>
                    <tr>
                      <td>
                      </td>
                      <td>
                        <bttdojo:label id="checkboxTest_Label05" text="C++"/>
                      </td>
                      <td>
                      </td>
                      <td>
                        <bttdojo:label id="checkboxTest_Label06" dataName="c++"/>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <bttdojo:button id="checkboxTest_btnToggleJava" type="button" text="toggle Java"/>
                      </td>
                      <td>
                        <bttdojo:button id="checkboxTest_btnToggleCpp" type="button" text="toggle C++"/>
                      </td>
                      <td>
                      </td>
                      <td>
                        <bttdojo:button id="checkboxTest_Button01" type="submit" text="Submit" operationId="CheckBoxOp"/>
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
        <bttdojo:form id="checkboxTest_form02" errorPage="checkboxTest.jsp">
          <table id="checkboxTest_form02">
            <tr>
              <td>
                <bttdojo:group id="checkboxTest_Group01" text="Test set properties - to verify the  common property of CheckBox">
                  <table id="checkboxTest_Group01">
                    <tr>
                      <td colspan="2">
                        <bttdojo:checkbox id="checkboxTest_CheckBox01" dataName="checkbox" checkedValue="true" uncheckedValue="false" text="Check Me"/>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <bttdojo:button id="checkboxTest_btnToggleDisable" type="button" text="toggle disable"/>
                      </td>
                      <td>
                        <bttdojo:button id="checkboxTest_btnToggleReadonly" type="button" text="toggle readOnly"/>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <bttdojo:button id="checkboxTest_btnVisible" type="button" text="visibility=visible"/>
                      </td>
                      <td>
                        <bttdojo:button id="checkboxTest_btnHidden" type="button" text="visibility=hidden"/>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <bttdojo:button id="checkboxTest_btnGone" type="button" text="visibility=gone"/>
                      </td>
                      <td>
                        <bttdojo:button id="checkboxTest_btnSetFocus" type="button" text="set focus"/>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <bttdojo:button id="checkboxTest_btnSetTextAt" type="button" text="Set text="/>
                      </td>
                      <td>
                        <bttdojo:textbox id="checkboxTest_checkboxText" dataName="inputText"/>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <bttdojo:button id="checkboxTest_btnIsFocusable" type="button" text="isFocusable?"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="2">
                        <bttdojo:label id="checkboxTest_lblIsFocusable" text="display true if isFocusable, otherwise unchanged"/>
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
        <bttdojo:form id="checkboxTest_form01" errorPage="checkboxTest.jsp">
          <table id="checkboxTest_form01">
            <tr>
              <td>
                <bttdojo:group id="checkboxTest_Group02" text="Test checkedValue and uncheckedValue">
                  <table id="checkboxTest_Group02">
                    <tr>
                      <td>
                        <bttdojo:checkbox id="checkboxTest_CheckBox02" dataName="trueFalseValue" checkedValue="true" uncheckedValue="false" text="(true/false)"/>
                      </td>
                      <td>
                        <bttdojo:checkbox id="checkboxTest_CheckBox03" dataName="onOffValue" checkedValue="on" uncheckedValue="off" text="on/off"/>
                      </td>
                      <td>
                        <bttdojo:checkbox id="checkboxTest_CheckBox04" dataName="aaaBbbValue" checkedValue="AAA" uncheckedValue="BBB" text="AAA/BBB"/>
                      </td>
                      <td>
                        <bttdojo:button id="checkboxTest_Button02" type="submit" text="submit" operationId="CheckBoxOp"/>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <bttdojo:label id="checkboxTest_Label07" dataName="trueFalseValue"/>
                      </td>
                      <td>
                        <bttdojo:label id="checkboxTest_Label08" dataName="onOffValue"/>
                      </td>
                      <td>
                        <bttdojo:label id="checkboxTest_Label09" dataName="aaaBbbValue"/>
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
        <bttdojo:form id="checkboxTest_form" errorPage="checkboxTest.jsp">
          <table id="checkboxTest_form">
            <tr>
              <td>
                <bttdojo:group id="checkboxTest_Group03" text="Test submit when readonly/disable">
                  <table id="checkboxTest_Group03">
                    <tr>
                      <td>
                        <bttdojo:button id="checkboxTest_toogleSubmitReadonly" type="button" text="toggleReadonly"/>
                      </td>
                      <td>
                        <bttdojo:checkbox id="checkboxTest_readonlySubmit" dataName="readonlySubmitValue" checkedValue="checked" uncheckedValue="unchecked" text="checked/unchecked"/>
                      </td>
                      <td>
                        <bttdojo:label id="checkboxTest_readonlySubmitValue" dataName="readonlySubmitValue2"/>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <bttdojo:button id="checkboxTest_toggleSubmitDisable" type="button" text="toggleDisable"/>
                      </td>
                      <td>
                        <bttdojo:checkbox id="checkboxTest_disabelSubmit" dataName="disableSubmitValue" checkedValue="checked" uncheckedValue="unchecked" text="checked/uncheched"/>
                      </td>
                      <td>
                        <bttdojo:label id="checkboxTest_disableSubmitValue" dataName="disableSubmitValue2"/>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <bttdojo:button id="checkboxTest_Button03" type="submit" text="submit" operationId="CheckBoxOp"/>
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
        <bttdojo:group id="checkboxTest_Group05" text="Hint test- set hint by ECA">
          <table id="checkboxTest_Group05">
            <tr>
              <td>
                <bttdojo:checkbox id="checkboxTest_CheckBox07" dataName="checkbox" checkedValue="true" uncheckedValue="false" text="Music" hint="Original hint for checkbox"/>
              </td>
              <td>
                <bttdojo:button id="checkboxTest_Button06" type="button" text="change hint"/>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
  </table>

</body>
</html>