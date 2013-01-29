<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from wh_table.xui by Administrator, on Tue Jan 29 10:57:29 CST 2013 -->
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
  <table id="wh_table_panel">
    <tr>
      <td>
        <bttdojo:group id="wh_table_Group04" text="Table" width="695px" height="605px" textWrap="false">
          <table style="width:695px;height:605px;">
            <tr>
              <td>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="wh_table_Label29" text="500*300 Grid" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:table id="wh_table_table" dataName="a" dataNameForList="b" selectionMode="single" width="500px" height="300px" textWrap="false" isPageable="false">
                  <bttdojo:column widget="Select" align="left" dataName="ref_sampleNumber011" width="80" text="DataNumber"/>
                  <bttdojo:column widget="TextBox" align="left" dataName="ref_sampleString011" width="80" type="String" text="DataString"/>
                  <bttdojo:column widget="TextBox" align="left" dataName="ref_sampleField011" width="80" text="Field"/>
                  <bttdojo:column align="left" dataName="ref_sampleCurrency011" width="80" text="Currency"/>
                  <bttdojo:column pattern="yyyy-MM-dd" widget="TextBox" align="left" dataName="ref_sampleDate011" width="80" type="Date" text="Date"/>
                </bttdojo:table>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="wh_table_Label01" text="autoszie" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:table id="wh_table_table01" dataName="a" dataNameForList="b" selectionMode="single" textWrap="false" isPageable="false">
                  <bttdojo:column widget="Select" align="left" dataName="ref_sampleNumber011" width="80" text="DataNumber"/>
                  <bttdojo:column widget="TextBox" align="left" dataName="ref_sampleString011" width="80" type="String" text="DataString"/>
                  <bttdojo:column widget="TextBox" align="left" dataName="ref_sampleField011" width="80" text="Field"/>
                  <bttdojo:column align="left" dataName="ref_sampleCurrency011" width="80" text="Currency"/>
                  <bttdojo:column pattern="yyyy-MM-dd" widget="TextBox" align="left" dataName="ref_sampleDate011" width="80" type="Date" text="Date"/>
                </bttdojo:table>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
  </table>

</body>
</html>