<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from accessKey.xui by Administrator, on Mon Jan 28 14:33:40 CST 2013 -->
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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/accessKey.js"> </script>
<bttdojo:form id="accessKey_Form01" errorPage="accessKey.jsp">
  <table>
    <tr>
      <td colspan="2" rowspan="2" align="left" valign="middle">
        <bttdojo:label id="accessKey_label10" text="Shortcut character : a-z 0-9 , . / ; \' [ ] \\ = -" textWrap="false"/>
      </td>
    </tr>
    <tr>
    </tr>
    <tr>
      <td>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="accessKey_Label06" text="ALT+SHIT+(key) in firefox, ALT+(key) in IE" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="accessKey_Label01" text="Text       AccessKey:K" for="accessKey_Text01" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="accessKey_Text01" dataName="selectData.selectName" accesskey="k" tabIndex="1" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="accessKey_Label02" text="Button    AccessKey:1" for="accessKey_Button01" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:button id="accessKey_Button01" type="button" text="button" accesskey="1" tabIndex="1" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="accessKey_Label03" text="Link        AccessKey:=" for="accessKey_Link01" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:a id="accessKey_Link01" text="123" accesskey="=" action="#" tabIndex="1" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="accessKey_Label04" text="CheckBox AccessKey:Y" for="accessKey_CheckBox01" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:checkbox id="accessKey_CheckBox01" dataName="selectName6" checkedValue="true" text="CheckBox01" accesskey="y" tabIndex="1" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="accessKey_Label05" text="Radio       AccessKey:H" for="accessKey_Radio01" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:radio id="accessKey_Radio01" dataName="selectData.selectKColl.select1" text="Radio01" accesskey="h" tabIndex="1" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="accessKey_Label05_copy" text="SelectList AccessKey:G" for="accessKey_SelectList01" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:select id="accessKey_SelectList01" dataName="selectData.selectName" readOnly="true" accesskey="g" tabIndex="1" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="accessKey_Label05_copy01" text="Combo    AccessKey:N" for="accessKey_Combo01" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:combo id="accessKey_Combo01" dataName="selectName6" accesskey="n" tabIndex="2" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="accessKey_Label05_copy02" text="TextArea AccessKey:L" for="accessKey_TextArea01" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textArea id="accessKey_TextArea01" dataName="selectName6" accesskey="l" tabIndex="3" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="accessKey_label12" text="ShortCut support single Number or letter" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="accessKey_label13" text="Alt,Shift,Ctrl those key of combination is made to the browser" textWrap="false"/>
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
        <bttdojo:label id="accessKey_label08" text="Those Widgets exist ShortCut:---->" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="accessKey_label09" text="Text,Button,Link,CheckBox,Radio,SelectList,Combo,TextArea" textWrap="false"/>
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
        <bttdojo:label id="accessKey_label" text="RichText,Image,Table,Tree,Message,FileUpload" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="accessKey_label07" text="is not exist AccessKey" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:a id="accessKey_link" text="Link" operationId="DisplayPageOp" extraParams="pageName=newXuiFile02.jsp" textWrap="false"/>
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
      <td>
      </td>
      <td>
      </td>
    </tr>
  </table>
</bttdojo:form>

</body>
</html>