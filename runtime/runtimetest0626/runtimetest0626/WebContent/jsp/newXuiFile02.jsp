<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from newXuiFile02.xui by Administrator, on Tue Jan 29 11:41:02 CST 2013 -->
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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/newXuiFile02.js"> </script>
  <table id="newXuiFile02_panel">
    <tr>
      <td>
      </td>
      <td>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="top">
        <bttdojo:group id="newXuiFile02_group" text="tabIndex=-1" textWrap="false">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:textbox id="newXuiFile02_text" dataName="DisplayPageData" type="Number" minimumValue="1000000" maximumValue="9999999" tabIndex="-1" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="newXuiFile02_button" type="button" text="Button" tabIndex="-1" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:combo id="newXuiFile02_combo" tabIndex="-1" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:radio id="newXuiFile02_radio" text="Radio" tabIndex="-1" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:checkbox id="newXuiFile02_checkBox" checkedValue="true" text="CheckBox" tabIndex="-1" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:select id="newXuiFile02_selectList" tabIndex="-1" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:textArea id="newXuiFile02_textArea" tabIndex="-1" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="newXuiFile02_link" text="Link" operationId="DisplayPageOp" extraParams="pageName=newXuiFile03.jsp" tabIndex="-1" textWrap="false"/>
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
              <td>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
      <td align="left" valign="top">
        <bttdojo:group id="newXuiFile02_group_copy" text="tabIndex=0" textWrap="false">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:textbox id="newXuiFile02_text_copy" dataName="pageName" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="newXuiFile02_button_copy" type="button" text="Button" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:combo id="newXuiFile02_combo_copy" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:radio id="newXuiFile02_radio_copy" text="Radio" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:checkbox id="newXuiFile02_checkBox_copy" checkedValue="true" text="CheckBox" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:select id="newXuiFile02_selectList_copy" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:textArea id="newXuiFile02_textArea_copy" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="newXuiFile02_link_copy" text="Link" operationId="DisplayPageOp" extraParams="pageName=newXuiFile03.jsp" textWrap="false"/>
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
              <td>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
      <td align="left" valign="top">
        <bttdojo:group id="newXuiFile02_group_copy01" text="tabIndex>0" width="287px" height="400px" textWrap="false">
          <table style="width:287px;height:400px;">
            <tr>
              <td align="left" valign="middle">
                <bttdojo:textbox id="newXuiFile02_text_copy01" dataName="pageName" readOnly="true" tabIndex="10" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="newXuiFile02_label" text="Id:text_copy01 is readOnly,tabIndex is 1" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="newXuiFile02_button_copy01" type="button" text="Button" tabIndex="1" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="newXuiFile02_label01" text="Id:button_copy01 is not readOnly,tabIndex is 1" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:combo id="newXuiFile02_combo_copy01" readOnly="true" tabIndex="9" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="newXuiFile02_label02" text="Id:combo_copy01 is readOnly,tabIndex is 1" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:radio id="newXuiFile02_radio_copy01" text="Radio" tabIndex="8" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:checkbox id="newXuiFile02_checkBox_copy01" checkedValue="true" text="CheckBox" tabIndex="7" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:select id="newXuiFile02_selectList_copy01" readOnly="true" tabIndex="6" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="newXuiFile02_label03" text="Label" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:textArea id="newXuiFile02_textArea_copy01" readOnly="true" tabIndex="5" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="newXuiFile02_link_copy01" text="Link" action="#" tabIndex="5" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:textbox id="newXuiFile02_text01" disabled="true" tabIndex="4" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="newXuiFile02_label04" text="Id:text01 is disabled,tabIndex is 4" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:textbox id="newXuiFile02_text02" tabIndex="3" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="newXuiFile02_label05" text="Id:text02 is not disabled,tabIndex is 5" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:combo id="newXuiFile02_combo01" readOnly="true" tabIndex="2" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="newXuiFile02_button01" type="button" text="Button" tabIndex="1" textWrap="false"/>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
      <td align="left" valign="top">
        <bttdojo:group id="newXuiFile02_group_copy02" text="tabIndex=NULL" textWrap="false">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:textbox id="newXuiFile02_text_copy02" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="newXuiFile02_button_copy02" type="button" text="Button" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:combo id="newXuiFile02_combo_copy02" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:radio id="newXuiFile02_radio_copy02" text="Radio" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:checkbox id="newXuiFile02_checkBox_copy02" checkedValue="true" text="CheckBox" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:select id="newXuiFile02_selectList_copy02" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:textArea id="newXuiFile02_textArea_copy02" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="newXuiFile02_link_copy02" text="Link" action="#" textWrap="false"/>
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
      <td>
      </td>
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
      <td>
      </td>
      <td>
      </td>
    </tr>
  </table>

</body>
</html>