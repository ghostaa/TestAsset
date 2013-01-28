<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from multiSelectResultWithoutPagination.xui by Administrator, on Mon Jan 28 14:33:48 CST 2013 -->
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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/multiSelectResultWithoutPagination.js"> </script>
  <table id="multiSelectResultWithoutPagination_null">
    <tr>
      <td>
        <bttdojo:form id="multiSelectResultWithoutPagination_Form01" operationId="tableValidationString" errorPage="multiSelectResultWithoutPagination.jsp">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="multiSelectResultWithoutPagination_Label01" text="Select Result" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="multiSelectResultWithoutPagination_Link01" text="back" operationId="tableValidationStringOp" extraParams="st=stringInit" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:table id="multiSelectResultWithoutPagination_Table01" dataName="StringTableRow" dataNameForList="selectTableDate" textWrap="false" isPageable="false">
                  <bttdojo:column align="left" dataName="requiredBasicField" width="80" text="requiredBasicField"/>
                  <bttdojo:column align="left" dataName="lengthofStringTestField" width="80" text="length"/>
                  <bttdojo:column align="left" dataName="NumberInString" width="80" text="number"/>
                  <bttdojo:column align="left" dataName="hiddenString" width="80" text="hiddenString"/>
                  <bttdojo:column align="left" dataName="hiddenCurrency" width="80" text="hiddenCurrency"/>
                  <bttdojo:column align="left" dataName="hiddenDate" width="80" text="hiddenDate"/>
                  <bttdojo:column align="left" dataName="hiddenNumber" width="80" text="hiddenNumber"/>
                </bttdojo:table>
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
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:button id="multiSelectResultWithoutPagination_button02" type="button" text="Button" textWrap="false"/>
      </td>
    </tr>
  </table>

</body>
</html>