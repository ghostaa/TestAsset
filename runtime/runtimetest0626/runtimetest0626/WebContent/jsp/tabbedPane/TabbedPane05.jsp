<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from TabbedPane05.xui by Administrator, on Tue Jan 29 10:57:03 CST 2013 -->
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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/tabbedPane/TabbedPane05.js"> </script>
  <table id="TabbedPane05_null">
    <tr>
      <td align="left" valign="middle">
        <bttdojo:tabbedpane id="TabbedPane05_TabbedPane01" tabPosition="left" textWrap="false">
          <bttdojo:contentpane id="TabbedPane05_ContentPane01" title="transfer" selected="true">
            <table style="table-layout:fixed">
              <tr>
                <td>
                  <bttdojo:form id="TabbedPane05_Form01" operationId="tabbedPaneTransferOp" errorPage="tabbedPane/TabbedPane05.jsp" style="width:333px;height:214px;">
                    <table style="width:333px;height:214px;">
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:label id="TabbedPane05_Label01" text="transfer_from" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:combo id="TabbedPane05_Combo02" dataName="transfer_from" storeURL="listFiles/select/i18n.js" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:label id="TabbedPane05_Label02" text="transfer_to" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:combo id="TabbedPane05_Combo01" dataName="transfer_to" storeURL="listFiles/select/gender.js" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:label id="TabbedPane05_Label03" text="amount" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="TabbedPane05_Text01" dataName="amount" required="true" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:button id="TabbedPane05_button" type="button" text="hideTabByIndex" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:button id="TabbedPane05_Button01" type="button" text="......" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:button id="TabbedPane05_button03" type="button" text="showTabByIndex" textWrap="false"/>
                        </td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:button id="TabbedPane05_button02" type="button" text="hideTabByID" textWrap="false"/>
                        </td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:button id="TabbedPane05_button04" type="button" text="showTabByID" textWrap="false"/>
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
                        <td>
                        </td>
                        <td>
                        </td>
                      </tr>
                    </table>
                  </bttdojo:form>
                </td>
              </tr>
              <tr>
                <td align="left" valign="middle">
                  <bttdojo:button id="TabbedPane05_button05" type="button" text="set ContentPane03.closable is true" textWrap="false"/>
                </td>
              </tr>
              <tr>
                <td align="left" valign="middle">
                  <bttdojo:button id="TabbedPane05_button06" type="button" text="set ContentPane04.disabled is true" textWrap="false"/>
                </td>
              </tr>
              <tr>
                <td>
                </td>
              </tr>
            </table>
          </bttdojo:contentpane>
          <bttdojo:contentpane id="TabbedPane05_ContentPane02" title="deposit">
            <table style="table-layout:fixed">
              <tr>
                <td>
                  <bttdojo:form id="TabbedPane05_Form02" operationId="tabbedPaneDepositOp" errorPage="tabbedPane/TabbedPane05.jsp" style="width:325px;height:85px;">
                    <table style="width:325px;height:85px;">
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:label id="TabbedPane05_Label04" text="select_account" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:select id="TabbedPane05_SelectList01" dataName="selectOp" storeURL="listFiles/select/gender.js" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:label id="TabbedPane05_Label05" text="amount" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="TabbedPane05_Text02" dataName="deposit_amount" required="true" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td>
                        </td>
                        <td>
                        </td>
                      </tr>
                    </table>
                  </bttdojo:form>
                </td>
                <td>
                </td>
              </tr>
            </table>
          </bttdojo:contentpane>
          <bttdojo:contentpane id="TabbedPane05_ContentPane03" title="ByIndex">
            <table style="table-layout:fixed">
            </table>
          </bttdojo:contentpane>
          <bttdojo:contentpane id="TabbedPane05_ContentPane04" title="ByID">
            <table style="table-layout:fixed">
            </table>
          </bttdojo:contentpane>
          <bttdojo:contentpane id="TabbedPane05_ContentPane05" title="Tab01" disabled="true">
            <table style="table-layout:fixed">
            </table>
          </bttdojo:contentpane>
        </bttdojo:tabbedpane>
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
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:a id="TabbedPane05_link" text="Return" flowEvent="event0" textWrap="false"/>
      </td>
    </tr>
  </table>

</body>
</html>