<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from sample28855InFlow.xui by Administrator, on Tue Jan 29 10:57:00 CST 2013 -->
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
  <table id="sample28855InFlow_panel">
    <tr>
      <td>
        <bttdojo:form id="sample28855InFlow_form" errorPage="sample28855InFlow.jsp">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="sample28855InFlow_label" text="TextBox" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:textbox id="sample28855InFlow_text" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="sample28855InFlow_button" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
              </td>
            </tr>
          </table>
        </bttdojo:form>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:form id="sample28855InFlow_form01" errorPage="sample28855InFlow.jsp">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="sample28855InFlow_label01" text="Combo" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:combo id="sample28855InFlow_combo" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="sample28855InFlow_button01" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
              </td>
            </tr>
          </table>
        </bttdojo:form>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:form id="sample28855InFlow_form02" errorPage="sample28855InFlow.jsp">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="sample28855InFlow_label02" text="Radio" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:radio id="sample28855InFlow_radio" text="radio" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="sample28855InFlow_button02" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
              </td>
            </tr>
          </table>
        </bttdojo:form>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:form id="sample28855InFlow_form03" errorPage="sample28855InFlow.jsp">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="sample28855InFlow_label03" text="CheckBox" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:checkbox id="sample28855InFlow_checkBox" checkedValue="true" text="CheckBox" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="sample28855InFlow_button03" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
              </td>
            </tr>
          </table>
        </bttdojo:form>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:form id="sample28855InFlow_form04" errorPage="sample28855InFlow.jsp">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="sample28855InFlow_label04" text="SelectList" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:select id="sample28855InFlow_selectList" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="sample28855InFlow_button04" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
              </td>
            </tr>
          </table>
        </bttdojo:form>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:form id="sample28855InFlow_form05" errorPage="sample28855InFlow.jsp">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="sample28855InFlow_label05" text="RichText" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:richTextEditor id="sample28855InFlow_richText" dataName="TID" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="sample28855InFlow_button05" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
              </td>
            </tr>
          </table>
        </bttdojo:form>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:form id="sample28855InFlow_form06" errorPage="sample28855InFlow.jsp">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="sample28855InFlow_label06" text="TextArea" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:textArea id="sample28855InFlow_textArea" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="sample28855InFlow_button06" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
              </td>
            </tr>
          </table>
        </bttdojo:form>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:form id="sample28855InFlow_form07" errorPage="sample28855InFlow.jsp">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="sample28855InFlow_label07" text="Image" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="sample28855InFlow_image" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="sample28855InFlow_button07" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
              </td>
            </tr>
          </table>
        </bttdojo:form>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:form id="sample28855InFlow_form08" errorPage="sample28855InFlow.jsp">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="sample28855InFlow_label08" text="Table" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:table id="sample28855InFlow_table" dataNameForList="Select1Options" textWrap="false" isPageable="false">
                </bttdojo:table>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="sample28855InFlow_button08" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
              </td>
            </tr>
          </table>
        </bttdojo:form>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:form id="sample28855InFlow_form10" errorPage="sample28855InFlow.jsp">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="sample28855InFlow_label09" text="Error Messages" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:message id="sample28855InFlow_message" dataName="dse_errorMessages" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="sample28855InFlow_button10" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
              </td>
            </tr>
          </table>
        </bttdojo:form>
      </td>
    </tr>
  </table>

</body>
</html>