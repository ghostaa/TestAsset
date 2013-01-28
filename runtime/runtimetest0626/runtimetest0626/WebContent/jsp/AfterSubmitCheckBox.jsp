<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from AfterSubmitCheckBox.xui by Administrator, on Mon Jan 28 14:33:04 CST 2013 -->
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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/AfterSubmitCheckBox.js"> </script>
  <table id="AfterSubmitCheckBox_panel">
    <tr>
      <td>
        <bttdojo:form id="AfterSubmitCheckBox_form" errorPage="AfterSubmitCheckBox.jsp">
          <table>
            <tr>
              <td valign="top">
                <bttdojo:group id="AfterSubmitCheckBox_group1" text="CheckBox  to verify isChecked property in Flow" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="AfterSubmitCheckBox_Label01" text="CheckBox:" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:checkbox id="AfterSubmitCheckBox_chkJava" dataName="java" checkedValue="Java is Checked" text="Java" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:checkbox id="AfterSubmitCheckBox_chkCpp" dataName="c++" checkedValue="C++ is Checked" text="C++" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="AfterSubmitCheckBox_Label02" text="Value:" width="52px" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="AfterSubmitCheckBox_Label03" text="Java" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="AfterSubmitCheckBox_Label04" dataName="java" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="AfterSubmitCheckBox_Label05" text="C++" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="AfterSubmitCheckBox_Label06" dataName="c++" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:button id="AfterSubmitCheckBox_btnToggleJava" type="button" text="toggle Java" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="AfterSubmitCheckBox_btnToggleCpp" type="button" text="toggle C++" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="AfterSubmitCheckBox_Button01" type="submit" text="Back" flowEvent="back" textWrap="false"/>
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
  </table>

</body>
</html>