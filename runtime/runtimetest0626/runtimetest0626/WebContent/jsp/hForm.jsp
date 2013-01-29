<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from hForm.xui by Administrator, on Tue Jan 29 10:56:49 CST 2013 -->
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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/hForm.js"> </script>
  <table id="hForm_null">
    <tr>
      <td>
        <bttdojo:group id="hForm_Group01" text="Select List Form - ajax cascading combo" width="699px" height="117px" textWrap="false">
          <table style="width:699px;height:117px;">
            <tr>
              <td>
                <bttdojo:form id="hForm_Form01" operationId="hFormInitOp" errorPage="hForm.jsp" style="width:587px;">
                  <table style="width:587px;">
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="hForm_Label01" text="Province:" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:select id="hForm_SelectList01" dataName="provice" dataNameForList="iProvinceList" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="hForm_Label02" text="City:" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:select id="hForm_SelectList02" dataName="city" dataNameForList="iCityList" textWrap="false"/>
                      </td>
                    </tr>
                  </table>
                </bttdojo:form>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="hForm_Group02" text="Combo Box Form -ajax cascading select" width="710px" height="117px" textWrap="false">
          <table style="width:710px;height:117px;">
            <tr>
              <td>
                <bttdojo:form id="hForm_Form02" operationId="hFormInitOp" errorPage="hForm.jsp" style="width:592px;">
                  <table style="width:592px;">
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="hForm_Label03" text="Province:" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:combo id="hForm_Combo01" dataName="provice" dataNameForList="iProvinceList" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="hForm_Label04" text="City:" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:combo id="hForm_Combo02" dataName="city" dataNameForList="iCityList" textWrap="false"/>
                      </td>
                    </tr>
                  </table>
                </bttdojo:form>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="hForm_Group03" text="Rich Text, Text Field, Text Area Form-ajax request and filter" width="626px" height="203px" textWrap="false">
          <table style="width:626px;height:203px;">
            <tr>
              <td>
                <bttdojo:form id="hForm_Form03" operationId="hFormInitOp" errorPage="hForm.jsp" style="width:600px;height:177px;">
                  <table style="width:600px;height:177px;">
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="hForm_Label05" text="Input text in left text, and \'gcd\' will be filtered." textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="hForm_Text01" dataName="inputText" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="hForm_Text02" dataName="filterText" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:textArea id="hForm_TextArea01" dataName="inputTextArea" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textArea id="hForm_TextArea02" dataName="filterTextArea" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:richTextEditor id="hForm_RichText01" dataName="inputRichText" width="268px" height="40px" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:richTextEditor id="hForm_RichText02" dataName="filterRichText" width="270px" height="40px" textWrap="false"/>
                      </td>
                    </tr>
                  </table>
                </bttdojo:form>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="hForm_Group04" text="Form onload event test - after form is loaded ,some text will be shown in this zone" textWrap="false">
          <table>
            <tr>
              <td>
                <bttdojo:form id="hForm_onLoadForm" operationId="hFormInitOp" errorPage="hForm.jsp">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="hForm_txtOnLoadMsg" textWrap="false"/>
                      </td>
                    </tr>
                  </table>
                </bttdojo:form>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:a id="hForm_link" text="Return Index" operationId="DisplayPageOp" extraParams="pageName=Index.jsp" textWrap="false"/>
      </td>
    </tr>
  </table>

</body>
</html>