<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from msgDijitPage2.xui by Administrator, on Mon Jan 28 14:33:48 CST 2013 -->
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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/msgDijitPage2.js"> </script>
<bttdojo:form id="msgDijitPage2_Form01" validateOnSubmit="false" errorPage="msgDijitPage2.jsp">
  <table>
    <tr>
      <td>
        <bttdojo:group id="msgDijitPage2_Group01" text="Message Ajax Request - show message after ajax request" textWrap="false">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="msgDijitPage2_Label01" text="Display Approach:" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:radio id="msgDijitPage2_Radio01" dataName="mrKColl.displayApproach" value="normal" text="Normal" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:radio id="msgDijitPage2_Radio02" dataName="mrKColl.displayApproach" value="popup" text="Popup" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:textbox id="msgDijitPage2_msgLevel" dataName="mrKColl.messageLevel" visibility="hidden" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="msgDijitPage2_Label02" text="Fetch message from server:" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="msgDijitPage2_Button01" type="button" text="AjaxReq" width="81px" height="29px" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:message id="msgDijitPage2_mr01" dataName="mrKColl.messageContents" visibility="gone" level="INFO" textWrap="false"/>
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
              <td align="right" valign="middle">
                <bttdojo:button id="msgDijitPage2_Button02" type="submit" text="Finish" flowEvent="ok" width="81px" height="29px" textWrap="false"/>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
  </table>
</bttdojo:form>

</body>
</html>