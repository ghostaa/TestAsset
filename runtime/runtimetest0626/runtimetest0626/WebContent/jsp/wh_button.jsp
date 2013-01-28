<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from wh_button.xui by Administrator, on Mon Jan 28 14:34:27 CST 2013 -->
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
  <table id="wh_button_panel">
    <tr>
      <td>
        <bttdojo:group id="wh_button_Group01" text="Button" width="373px" height="271px" textWrap="false">
          <table style="width:373px;height:271px;">
            <tr>
              <td>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="wh_button_Label02" text="150*40 submit" width="78px" height="12px" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="wh_button_Button02" type="submit" text="submit with size" operationId="displayPageOp" width="150px" height="40px" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="wh_button_Label04" text="150*40 button" width="80px" height="19px" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="wh_button_Button04" type="button" text="button with size" width="150px" height="40px" textWrap="false"/>
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
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="wh_button_Label06" text="150*40 reset" width="80px" height="19px" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="wh_button_Button06" type="reset" text="reset with size" width="150px" height="40px" textWrap="false"/>
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
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="wh_button_Group02" text="autosize" width="373px" height="83px" textWrap="false">
          <table style="width:373px;height:83px;">
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="wh_button_Button07" type="submit" text="submit" operationId="displayPageOp" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="wh_button_Button08" type="button" text="button" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="wh_button_Button09" type="reset" text="reset autosize" textWrap="false"/>
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

</body>
</html>