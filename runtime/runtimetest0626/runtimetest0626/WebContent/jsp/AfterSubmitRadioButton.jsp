<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from AfterSubmitRadioButton.xui by Administrator, on Tue Jan 29 10:56:06 CST 2013 -->
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
  <table id="AfterSubmitRadioButton_panel">
    <tr>
      <td align="left" valign="middle">
        <bttdojo:form id="AfterSubmitRadioButton_form" errorPage="AfterSubmitRadioButton.jsp" style="width:411px;height:80px;">
          <table style="width:411px;height:80px;">
            <tr>
              <td valign="middle">
                <bttdojo:group id="AfterSubmitRadioButton_group1" text="RadioButton 1- check the selected radio value in Flow" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="AfterSubmitRadioButton_Label01" text="RadioButton:" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:radio id="AfterSubmitRadioButton_Radio01" dataName="radiobutton" value="male" text="male" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:radio id="AfterSubmitRadioButton_Radio02" dataName="radiobutton" value="female" text="female" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="AfterSubmitRadioButton_Label03" text="value:" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="AfterSubmitRadioButton_Label04" dataName="radiobutton" width="80px" height="21px" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="AfterSubmitRadioButton_Button01" type="submit" text="Back" flowEvent="back" textWrap="false"/>
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
        <bttdojo:form id="AfterSubmitRadioButton_form01" errorPage="AfterSubmitRadioButton.jsp">
          <table>
            <tr>
              <td valign="middle">
                <bttdojo:group id="AfterSubmitRadioButton_group2" text="RadioButton 2- check when value is different with text" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="AfterSubmitRadioButton_Label05" text="RadioButton:" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:radio id="AfterSubmitRadioButton_Radio03" dataName="agespan" value="Childhood" text="<10" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:radio id="AfterSubmitRadioButton_Radio04" dataName="agespan" value="Teenage" text="10-20" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:radio id="AfterSubmitRadioButton_Radio05" dataName="agespan" value="Younth" text="20-30" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:radio id="AfterSubmitRadioButton_Radio06" dataName="agespan" value="Middle Age" text="30-40" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="AfterSubmitRadioButton_Label06" text="value:" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="AfterSubmitRadioButton_Label07" dataName="agespan" width="80px" height="21px" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="AfterSubmitRadioButton_Button02" type="submit" text="Back" flowEvent="back" textWrap="false"/>
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
  </table>

</body>
</html>