<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from TabbedPane04.xui by Administrator, on Mon Jan 28 14:33:59 CST 2013 -->
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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/tabbedPane/TabbedPane04.js"> </script>
<bttdojo:form id="TabbedPane04_Form01" operationId="tabbedPaneOp1" errorPage="tabbedPane/TabbedPane04.jsp">
  <table>
    <tr>
      <td>
        <bttdojo:tabbedpane id="TabbedPane04_TabbedPane01" width="800px" height="600px" textWrap="false">
          <bttdojo:contentpane id="TabbedPane04_ContentPane01" title="Step1" selected="true">
            <table style="table-layout:fixed">
              <tr>
                <td align="left" valign="middle">
                  <bttdojo:label id="TabbedPane04_Label01" text="User Name" textWrap="false"/>
                </td>
                <td align="left" valign="middle">
                  <bttdojo:combo id="TabbedPane04_combo" dataName="userName" storeURL="listFiles/select/select.js" textWrap="false"/>
                </td>
                <td>
                </td>
              </tr>
              <tr>
                <td>
                </td>
                <td align="left" valign="middle">
                  <bttdojo:button id="TabbedPane04_Button01" type="button" text="SelectChildByIndex" textWrap="false"/>
                </td>
                <td>
                </td>
              </tr>
              <tr>
                <td align="left" valign="middle">
                  <bttdojo:radio id="TabbedPane04_radio" text="ABCDEFG" textWrap="false"/>
                </td>
                <td align="left" valign="middle">
                  <bttdojo:label id="TabbedPane04_label" text="ABCDEFG" textWrap="false"/>
                </td>
                <td align="left" valign="middle">
                  <bttdojo:checkbox id="TabbedPane04_checkBox" checkedValue="true" text="ABCDEFG" textWrap="false"/>
                </td>
              </tr>
              <tr>
                <td align="left" valign="middle">
                  <bttdojo:message id="TabbedPane04_message" dataName="Reveal" textWrap="false"/>
                </td>
                <td align="left" valign="middle">
                  <bttdojo:label id="TabbedPane04_label04" text="ABCDEFG" textWrap="false"/>
                </td>
                <td align="left" valign="middle">
                  <bttdojo:button id="TabbedPane04_button04" type="button" text="Click" textWrap="false"/>
                </td>
              </tr>
              <tr>
                <td align="left" valign="middle">
                  <bttdojo:label id="TabbedPane04_label06" text="Label" textWrap="false"/>
                </td>
                <td align="left" valign="middle">
                  <bttdojo:label id="TabbedPane04_label09" text="Label" textWrap="false"/>
                </td>
                <td align="left" valign="middle">
                  <bttdojo:label id="TabbedPane04_label10" text="Label" textWrap="false"/>
                </td>
              </tr>
              <tr>
                <td align="left" valign="middle">
                  <bttdojo:button id="TabbedPane04_button05" type="button" text="Condition:e.altKey==true" textWrap="false"/>
                </td>
                <td align="left" valign="middle">
                  <bttdojo:button id="TabbedPane04_button06" type="button" text="Condition:e.altKey==\"true\"" textWrap="false"/>
                </td>
                <td align="left" valign="middle">
                  <bttdojo:button id="TabbedPane04_button07" type="button" textWrap="false"/>
                </td>
              </tr>
            </table>
          </bttdojo:contentpane>
          <bttdojo:contentpane id="TabbedPane04_ContentPane02" title="Step2" selected="true">
            <table style="table-layout:fixed">
              <tr>
                <td align="left" valign="middle">
                  <bttdojo:label id="TabbedPane04_Label02" text="pls_select_card" textWrap="false"/>
                </td>
                <td align="left" valign="middle">
                  <bttdojo:select id="TabbedPane04_SelectList01" dataName="cardType" storeURL="listFiles/select/select.js" textWrap="false"/>
                </td>
                <td>
                </td>
              </tr>
              <tr>
                <td>
                </td>
                <td align="left" valign="middle">
                  <bttdojo:button id="TabbedPane04_Button02" type="button" text="SelectChildById" textWrap="false"/>
                </td>
                <td>
                </td>
              </tr>
            </table>
          </bttdojo:contentpane>
          <bttdojo:contentpane id="TabbedPane04_ContentPane03" title="Step3" selected="true">
            <table style="table-layout:fixed">
              <tr>
                <td align="left" valign="middle">
                  <bttdojo:label id="TabbedPane04_Label03" text="Name" textWrap="false"/>
                </td>
                <td align="left" valign="middle">
                  <bttdojo:label id="TabbedPane04_Label07" textWrap="false"/>
                </td>
                <td align="left" valign="middle">
                  <bttdojo:button id="TabbedPane04_button" type="button" text="Close ContentPane Step4 use closeChildByIndex" textWrap="false"/>
                </td>
                <td>
                </td>
              </tr>
              <tr>
                <td align="left" valign="middle">
                  <bttdojo:label id="TabbedPane04_Label05" text="CardType" textWrap="false"/>
                </td>
                <td align="left" valign="middle">
                  <bttdojo:label id="TabbedPane04_Label08" textWrap="false"/>
                </td>
                <td align="left" valign="middle">
                  <bttdojo:button id="TabbedPane04_button03" type="button" text="Close ContentPane Step5 use closeChildById" textWrap="false"/>
                </td>
                <td>
                </td>
              </tr>
              <tr>
                <td align="right" valign="middle">
                  <bttdojo:a id="TabbedPane04_link" text="Return" flowEvent="event0" textWrap="false"/>
                </td>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
              </tr>
            </table>
          </bttdojo:contentpane>
          <bttdojo:contentpane id="TabbedPane04_ContentPane04" title="Step4">
            <table style="table-layout:fixed">
            </table>
          </bttdojo:contentpane>
          <bttdojo:contentpane id="TabbedPane04_ContentPane05" title="Step5">
            <table style="table-layout:fixed">
            </table>
          </bttdojo:contentpane>
        </bttdojo:tabbedpane>
      </td>
    </tr>
  </table>
</bttdojo:form>

</body>
</html>