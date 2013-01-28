<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from message.xui by BTT, on Mon Dec 03 17:39:19 CST 2012 -->
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
@import "css/dijit/main.css";
@import "css/dijit/dijit.css";
@import "css/dijit/FileUpload.css";
@import "css/dijit/Grid.css";
@import "css/dijit/Group.css";
@import "css/dijit/Label.css";
@import "css/dijit/message.css";
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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/message.js"> </script>
  <table id="message_null">
    <tr>
      <td>
        <bttdojo:group id="message_Group01" text="Bind to context">
          <table>
            <tr>
              <td>
                <bttdojo:label id="message_Label01" text="bind to field"/>
              </td>
              <td>
                <bttdojo:message id="message_Message01" dataName="msgField"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td>
                <bttdojo:label id="message_Label03" text="bind to kColl"/>
              </td>
              <td>
                <bttdojo:message id="message_Message02" dataName="msgKColl.msg1" level="INFO"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td>
                <bttdojo:label id="message_Label04" text="bind to iColl"/>
              </td>
              <td>
                <bttdojo:message id="message_Message03" dataName="msgIColl.0.msg" level="WARN"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td>
                <bttdojo:label id="message_Label07" text="field is empty"/>
              </td>
              <td>
                <bttdojo:message id="message_Message04" dataName="msgEmptyField"/>
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
      <td>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="message_Group02" text="ECA Message">
          <table>
            <tr>
              <td colspan="6">
                <bttdojo:message id="message_ecaMessage" dataName="tempField"/>
              </td>
              <td>
                <bttdojo:button id="message_btnCloseMessage" type="button" text="close message" width="136" height="29" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td colspan="6">
                <bttdojo:label id="message_Label06" text="input message you\'d like to display, input i18n like this: %nls.Resource/KEY"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td colspan="2" rowspan="3">
                <bttdojo:textArea id="message_txtMessage" dataName="inputMsg"/>
              </td>
              <td colspan="4">
                <bttdojo:button id="message_btnSetDefaultI18N" type="button" text="set default i18n message"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td colspan="4">
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td colspan="4">
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td colspan="3">
                <bttdojo:group id="message_Group04" text="Message type">
                  <table>
                    <tr>
                      <td>
                        <bttdojo:radio id="message_rdError" dataName="radioMsgType" value="ERROR" text="ERROR"/>
                      </td>
                      <td>
                        <bttdojo:radio id="message_rdWarn" dataName="radioMsgType" value="WARN" text="WARN"/>
                      </td>
                      <td>
                        <bttdojo:radio id="message_rdInfo" dataName="radioMsgType" value="INFO" text="INFO"/>
                      </td>
                      <td>
                      </td>
                      <td align="right">
                        <bttdojo:label id="message_lblMessageType"/>
                      </td>
                    </tr>
                  </table>
                </bttdojo:group>
              </td>
              <td colspan="2">
                <bttdojo:group id="message_Group05" text="Widget Type">
                  <table>
                    <tr>
                      <td>
                        <bttdojo:radio id="message_rdNormal" dataName="radioWidgetType" value="Normal" text="Normal"/>
                      </td>
                      <td>
                        <bttdojo:radio id="message_rdPopup" dataName="radioWidgetType" value="Popup" text="Popup"/>
                      </td>
                    </tr>
                  </table>
                </bttdojo:group>
              </td>
              <td>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td>
                <bttdojo:button id="message_btnShowDefaultType" type="button" text="Default type" width="135" height="29" textWrap="false"/>
              </td>
              <td>
                <bttdojo:button id="message_btnShowCustomType" type="button" text="Custom type" width="141" height="29" textWrap="false"/>
              </td>
              <td colspan="3">
              </td>
              <td>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td>
                <bttdojo:label id="message_Label02" text="Template param1"/>
              </td>
              <td>
                <bttdojo:textbox id="message_txtParam1" dataName="tempField" width="142" height="21" textWrap="false"/>
              </td>
              <td colspan="2">
                <bttdojo:label id="message_Label08" text="Template param2"/>
              </td>
              <td>
                <bttdojo:textbox id="message_txtParam2" dataName="tempField" width="157" height="21" textWrap="false"/>
              </td>
              <td>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td>
                <bttdojo:button id="message_btnShowTemplate" type="button" text="Show template message"/>
              </td>
              <td colspan="4">
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
        <bttdojo:group id="message_Group06" text="Set Style">
          <table>
            <tr>
              <td>
                <bttdojo:message id="message_Message104" class="customStyle" dataName="msgField"/>
              </td>
              <td>
                <bttdojo:label id="message_Label09"/>
              </td>
              <td>
                <bttdojo:button id="message_Button02" type="button" text="Set style"/>
              </td>
              <td>
                <bttdojo:button id="message_Button03" type="button" text="default"/>
              </td>
            </tr>
            <tr>
              <td>
                <bttdojo:message id="message_Message05" dataName="msgField"/>
              </td>
              <td>
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
        </bttdojo:group>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="message_Group03" text="ajax message">
          <table>
            <tr>
              <td>
                <bttdojo:form id="message_Form01" operationId="messageOp" errorPage="message.jsp">
                  <table>
                    <tr>
                      <td>
                        <bttdojo:button id="message_Button01" type="submit" text="submit" operationId="DisplayPageOp"/>
                      </td>
                      <td>
                        <bttdojo:label id="message_Label05"/>
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
  </table>

</body>
</html>