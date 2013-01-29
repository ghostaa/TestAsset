<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from table.xui by Administrator, on Tue Jan 29 10:57:04 CST 2013 -->
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



@import "css/dijit/main.css";

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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/table.js"> </script>
  <table id="table_null">
    <tr>
      <td>
        <bttdojo:form id="table_Form01" errorPage="table.jsp">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="table_Label02" text="selectedItem" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:label id="table_Label06" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td colspan="2" align="left" valign="middle">
                <bttdojo:table id="table_Table01" dataName="singleTableRowName" dataNameForList="tableData" disabled="true" hint="this is a hint for table" selectionMode="single" textWrap="false" isPageable="false">
                  <bttdojo:column unCheckedValue="false" widget="CheckBox" align="center" dataName="index" width="80" checkedValue="true" text="CheckBox"/>
                  <bttdojo:column align="left" dataName="Num" width="40" text="Num"/>
                  <bttdojo:column align="left" dataName="name" width="80" text="Name"/>
                  <bttdojo:column align="left" dataName="position" width="80" text="Position"/>
                  <bttdojo:column align="left" dataName="salary" width="80" text="Salary"/>
                  <bttdojo:column pattern="MM-dd-yyyy" widget="TextBox" align="left" dataName="birth" width="80" type="Date" minimumDate="today-7d" text="Birth" maximumDate="today+7d" required="true"/>
                  <bttdojo:column widget="Image" align="left" dataName="imageField" width="160" text="Image"/>
                  <bttdojo:column widget="ComboBox" align="left" dataName="gender" width="80" text="Gender" storeURL="listFiles/select/gender.js"/>
                </bttdojo:table>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="table_button" type="submit" text="Edit" flowEvent="edit" textWrap="false"/>
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
                <bttdojo:label id="table_Label01" text="Test Case for table properties:" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="table_visibleButton" type="button" text="visible" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="table_hiddenButton" type="button" text="hidden" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="table_goneButton" type="button" text="gone" textWrap="false"/>
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
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="table_Label03" text="Test case for fire event:" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="table_EventTrack" text="wait" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="table_beginTrack" type="button" text="begin" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="table_stopTrack" type="button" text="stop" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="table_Label04" text="test case for ECA function" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="table_isFocusable" type="button" text="isFocusable" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:label id="table_Label05" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="table_Button02" type="button" text="focus" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
          </table>
        </bttdojo:form>
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
        <bttdojo:group id="table_Group01" text="Test style/hint" textWrap="false">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:table id="table_Table02" dataName="tableRowDateName" dataNameForList="tableData" hint="Hint for table" textWrap="false" isPageable="false">
                  <bttdojo:column align="left" dataName="index" width="80" text="Select"/>
                  <bttdojo:column align="left" dataName="Num" width="80" text="Number"/>
                  <bttdojo:column align="left" dataName="name" width="80" text="Name"/>
                  <bttdojo:column align="left" dataName="birth" width="80" text="Birthday"/>
                  <bttdojo:column align="left" dataName="gender" width="80" text="Gender"/>
                  <bttdojo:column align="left" dataName="position" width="80" text="Position"/>
                  <bttdojo:column align="left" dataName="salary" width="80" text="Salary"/>
                  <bttdojo:column widget="Image" align="left" dataName="imageField" width="160" text="Image"/>
                </bttdojo:table>
              </td>
              <td>
              </td>
              <td>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="table_Button05" type="button" text="change hint" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="table_Label07" text="Label" textWrap="false"/>
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
    </tr>
    <tr>
      <td>
      </td>
    </tr>
  </table>

</body>
</html>