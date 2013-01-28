<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from editTable.xui by Administrator, on Mon Jan 28 14:33:45 CST 2013 -->
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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/editTable.js"> </script>
  <table id="editTable_null">
    <tr>
      <td>
        <bttdojo:form id="editTable_Form01" errorPage="editTable.jsp">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="editTable_Label01" text="Test editing table data" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:table id="editTable_Table01" dataName="singleTableRowName" dataNameForList="tableData" selectionMode="single" width="841px" height="300px" textWrap="false" isPageable="false">
                  <bttdojo:column unCheckedValue="false" widget="CheckBox" align="center" dataName="index" width="80" checkedValue="true" text="CheckBox"/>
                  <bttdojo:column widget="TextBox" align="left" dataName="Num" width="80" type="Number" text="Num" required="true"/>
                  <bttdojo:column widget="TextBox" align="left" dataName="name" width="80" text="Name"/>
                  <bttdojo:column pattern="MM-dd-yyyy" widget="TextBox" align="left" dataName="birth" width="80" type="Date" minimumDate="today-7d" text="Birth" maximumDate="today+7d" required="true"/>
                  <bttdojo:column widget="ComboBox" align="left" dataName="gender" width="80" text="Gender" storeURL="listFiles/select/gender.js"/>
                  <bttdojo:column dataNameForList="positionSelect" widget="Select" align="left" dataName="position" width="80" text="Position"/>
                  <bttdojo:column currency="USD" numberType="bigDecimal" widget="TextBox" align="left" dataName="salary" width="80" type="Currency" text="Salary" required="true"/>
                  <bttdojo:column widget="Image" align="left" dataName="imageField" width="120" text="Image"/>
                </bttdojo:table>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="editTable_Button01" type="submit" text="Submit" flowEvent="back" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="editTable_Button04" type="reset" text="Reset" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="editTable_AjaxButton" type="button" text="Select Row by ajax and change table" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="editTable_Button05" type="button" text="Set ReadOnly is true" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="editTable_Button06" type="button" text="Set ReadOnly is false" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td>
              </td>
              <td align="left" valign="middle">
                <bttdojo:label id="editTable_Label02" dataName="tableRowDateName.index" text="Label08" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="editTable_Label21" text="Display the error: " textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:label id="editTable_Label14" dataName="tableRowDateName.salary" text="Label08" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="editTable_Button03" type="button" text="ajax without operation id" textWrap="false"/>
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

</body>
</html>