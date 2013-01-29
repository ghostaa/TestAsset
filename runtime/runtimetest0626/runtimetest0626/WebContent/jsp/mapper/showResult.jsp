<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from showResult.xui by Administrator, on Tue Jan 29 10:56:50 CST 2013 -->
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
<bttdojo:form id="showResult_Form01" errorPage="mapper/showResult.jsp">
  <table>
    <tr>
      <td align="left" valign="middle">
<div style="display:inline-block;width:auto;height:auto;" class="title">        <bttdojo:label id="showResult_Label01" text="Test kcoll->icoll->kcoll" textWrap="false"/>
</div>      </td>
      <td align="left" valign="middle">
        <bttdojo:table id="showResult_table" dataName="table" dataNameForList="tableData.myTable" textWrap="false" isPageable="false">
          <bttdojo:column align="left" dataName="name" width="80" text="column0"/>
          <bttdojo:column align="left" dataName="position" width="80" text="column1"/>
          <bttdojo:column align="left" dataName="age" width="80" text="column2"/>
        </bttdojo:table>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td>
      </td>
      <td align="left" valign="middle">
<div style="display:inline-block;width:auto;height:auto;" class="title">        <bttdojo:label id="showResult_Label04" text="username" textWrap="false"/>
</div>      </td>
      <td align="left" valign="middle">
<div style="display:inline-block;width:auto;height:auto;" class="title">        <bttdojo:label id="showResult_Label05" text="password" textWrap="false"/>
</div>      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
<div style="display:inline-block;width:auto;height:auto;" class="title">        <bttdojo:label id="showResult_Label02" text="Test kcoll->bcoll" textWrap="false"/>
</div>      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="showResult_Text01" dataName="beanData.myBean.username" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="showResult_Text02" dataName="beanData.myBean.password" textWrap="false"/>
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
    <tr>
      <td align="left" valign="middle">
<div style="display:inline-block;width:auto;height:auto;" class="title">        <bttdojo:label id="showResult_Label03" text="Test kcoll->4 type data" textWrap="false"/>
</div>      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="showResult_Text03" dataName="typeData.stringData" type="String" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
<div style="display:inline-block;width:auto;height:auto;" class="title">        <bttdojo:label id="showResult_Label06" text="String" textWrap="false"/>
</div>      </td>
    </tr>
    <tr>
      <td>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="showResult_Text04" dataName="typeData.dateData" type="Date" pattern="yyyy-MM-dd" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
<div style="display:inline-block;width:auto;height:auto;" class="title">        <bttdojo:label id="showResult_Label07" text="Date" textWrap="false"/>
</div>      </td>
    </tr>
    <tr>
      <td>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="showResult_Text05" dataName="typeData.numberData" type="Number" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
<div style="display:inline-block;width:auto;height:auto;" class="title">        <bttdojo:label id="showResult_Label08" text="Number" textWrap="false"/>
</div>      </td>
    </tr>
    <tr>
      <td>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="showResult_Text06" dataName="typeData.currencyData" type="Currency" currency="EUR" numberType="bigDecimal" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
<div style="display:inline-block;width:auto;height:auto;" class="title">        <bttdojo:label id="showResult_Label09" text="Currency" textWrap="false"/>
</div>      </td>
    </tr>
    <tr>
      <td>
      </td>
      <td align="left" valign="middle">
<div style="display:inline-block;" class="title">        <bttdojo:button id="showResult_Button01" type="submit" text="next page" flowEvent="next" textWrap="false"/>
</div>      </td>
      <td>
      </td>
    </tr>
  </table>
</bttdojo:form>

</body>
</html>