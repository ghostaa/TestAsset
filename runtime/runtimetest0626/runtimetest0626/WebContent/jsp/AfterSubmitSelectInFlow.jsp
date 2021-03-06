<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from AfterSubmitSelectInFlow.xui by Administrator, on Tue Jan 29 10:56:06 CST 2013 -->
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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/AfterSubmitSelectInFlow.js"> </script>
  <table id="AfterSubmitSelectInFlow_panel">
    <tr>
      <td>
        <bttdojo:form id="AfterSubmitSelectInFlow_form" errorPage="AfterSubmitSelectInFlow.jsp">
          <table>
            <tr>
              <td>
                <bttdojo:group id="AfterSubmitSelectInFlow_group" text="Functional Scenario" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="AfterSubmitSelectInFlow_label01_copy" text="Select from dataName" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:select id="AfterSubmitSelectInFlow_selectList" dataName="selectData.selectName" storeURL="listFiles/select/normal.js" dataNameForList="selectDataList" labelField="labelselect" valueField="valueselect" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="AfterSubmitSelectInFlow_label" text="Select from dataName,no default" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:select id="AfterSubmitSelectInFlow_selectList01" dataName="selectData.selectName5" storeURL="listFiles/select/normal.js" dataNameForList="selectDataList" labelField="labelselect" valueField="valueselect" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="AfterSubmitSelectInFlow_label01" text="Select from normal js" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:select id="AfterSubmitSelectInFlow_selectList02" dataName="selectData.selectName2" storeURL="listFiles/select/normal.js" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="AfterSubmitSelectInFlow_label02" text="Select from NLS js" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:select id="AfterSubmitSelectInFlow_wslst" dataName="selectData.selectName3" storeURL="listFiles/select/i18n.js" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="AfterSubmitSelectInFlow_label03" text="Select from abnormal JS" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:select id="AfterSubmitSelectInFlow_wslst_1" dataName="selectData.selectName4" storeURL="listFiles/select/gender.js" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="AfterSubmitSelectInFlow_button" type="submit" text="Back" flowEvent="back" textWrap="false"/>
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