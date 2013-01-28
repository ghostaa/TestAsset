<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from setStyle.xui by Administrator, on Mon Jan 28 14:33:59 CST 2013 -->
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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/setStyle.js"> </script>
<bttdojo:form id="setStyle_Form01" errorPage="setStyle.jsp">
  <table>
    <tr>
      <td>
        <bttdojo:group id="setStyle_Group01" text="Test- test setting external css style to dijit" textWrap="false">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="setStyle_Label01" text="Label" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:textbox id="setStyle_Text01" dataName="field1" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:combo id="setStyle_Combo01" dataName="field2" dataNameForList="comboboxOption" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:select id="setStyle_SelectList01" dataName="field3" dataNameForList="comboboxOption" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:radio id="setStyle_Radio01" dataName="field3" text="dog" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:checkbox id="setStyle_CheckBox01" dataName="field4" checkedValue="true" text="god" textWrap="false"/>
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
                <bttdojo:table id="setStyle_Table01" dataName="tableRowDateName" dataNameForList="tableData" textWrap="false" isPageable="false">
                  <bttdojo:column align="left" dataName="index" width="80" text="index"/>
                  <bttdojo:column align="left" dataName="name" width="80" text="name"/>
                  <bttdojo:column align="left" dataName="gender" width="80" text="gender"/>
                  <bttdojo:column align="left" width="80" hidden="false" id="columnId0" text="column0"/>
                </bttdojo:table>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
<div style="display:block;" class="customStyle">                <bttdojo:tree id="setStyle_Tree01" dataName="field5" dataNameForTreeContent="treeData" textWrap="false"/>
</div>              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:message id="setStyle_Message01" dataName="erro" textWrap="false"/>
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
                <bttdojo:textArea id="setStyle_TextArea01" dataName="field7" textWrap="false"/>
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
                <bttdojo:richTextEditor id="setStyle_RichText01" dataName="field8" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td>
                <bttdojo:tabbedpane id="setStyle_TabbedPane01" textWrap="false">
                  <bttdojo:contentpane id="setStyle_ContentPane01" title="Tab0">
                    <table style="table-layout:fixed">
                      <tr>
                        <td>
                        </td>
                      </tr>
                    </table>
                  </bttdojo:contentpane>
                  <bttdojo:contentpane id="setStyle_ContentPane02" title="Tab1">
                    <table style="table-layout:fixed">
                    </table>
                  </bttdojo:contentpane>
                  <bttdojo:contentpane id="setStyle_ContentPane03" title="Tab2">
                    <table style="table-layout:fixed">
                    </table>
                  </bttdojo:contentpane>
                </bttdojo:tabbedpane>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
<div style="display:inline-block;" class="customStyle">                <bttdojo:button id="setStyle_Button01" type="button" text="Set All Style" textWrap="false"/>
</div>              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="setStyle_Link01" text="Link" operationId="DisplayPageOp" extraParams="pageName=setStyle.jsp" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
<div style="display:inline-block;width:auto;height:auto;" class="customStyle">                <bttdojo:label id="setStyle_label" text="I  am a label testing the css styles  ~~~" textWrap="false"/>
</div>              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="setStyle_Button02" type="button" text="Default" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="setStyle_button" type="button" text="SetStyle-qiong" textWrap="false"/>
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
</bttdojo:form>

</body>
</html>