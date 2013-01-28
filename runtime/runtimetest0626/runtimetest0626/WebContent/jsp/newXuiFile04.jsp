<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from newXuiFile04.xui by Administrator, on Mon Jan 28 14:33:48 CST 2013 -->
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
  <table id="newXuiFile04_panel">
    <tr>
      <td align="left" valign="top">
        <bttdojo:group id="newXuiFile04_group" text="tabIndex=-1" textWrap="false">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:textbox id="newXuiFile04_text" dataName="TextKColl.txtPlainField" tabIndex="-1" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="newXuiFile04_button" type="button" text="Button" tabIndex="-1" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:combo id="newXuiFile04_combo" tabIndex="-1" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:radio id="newXuiFile04_radio" text="Radio" tabIndex="-1" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:checkbox id="newXuiFile04_checkBox" checkedValue="true" text="CheckBox" tabIndex="-1" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:select id="newXuiFile04_selectList" tabIndex="-1" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:textArea id="newXuiFile04_textArea" tabIndex="-1" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="newXuiFile04_link" text="Link" action="#" tabIndex="-1" textWrap="false"/>
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
        <bttdojo:group id="newXuiFile04_group_copy" text="tabIndex=0" textWrap="false">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:textbox id="newXuiFile04_text_copy" dataName="pageName" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="newXuiFile04_button_copy" type="button" text="Button" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:combo id="newXuiFile04_combo_copy" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:radio id="newXuiFile04_radio_copy" text="Radio" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:checkbox id="newXuiFile04_checkBox_copy" checkedValue="true" text="CheckBox" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:select id="newXuiFile04_selectList_copy" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:textArea id="newXuiFile04_textArea_copy" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="newXuiFile04_link_copy" text="Link" action="#" textWrap="false"/>
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
        <bttdojo:group id="newXuiFile04_group_copy01" text="tabIndex>0" textWrap="false">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:textbox id="newXuiFile04_text_copy01" dataName="pageName" tabIndex="1" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="newXuiFile04_button_copy01" type="button" text="Button" tabIndex="1" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:combo id="newXuiFile04_combo_copy01" tabIndex="1" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:radio id="newXuiFile04_radio_copy01" text="Radio" tabIndex="1" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:checkbox id="newXuiFile04_checkBox_copy01" checkedValue="true" text="CheckBox" tabIndex="1" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:select id="newXuiFile04_selectList_copy01" tabIndex="1" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:textArea id="newXuiFile04_textArea_copy01" tabIndex="1" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="newXuiFile04_link_copy01" text="Link" action="#" tabIndex="1" textWrap="false"/>
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
        <bttdojo:group id="newXuiFile04_group_copy02" text="tabIndex=NULL" textWrap="false">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:textbox id="newXuiFile04_text_copy02" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="newXuiFile04_button_copy02" type="button" text="Button" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:combo id="newXuiFile04_combo_copy02" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:radio id="newXuiFile04_radio_copy02" text="Radio" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:checkbox id="newXuiFile04_checkBox_copy02" checkedValue="true" text="CheckBox" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:select id="newXuiFile04_selectList_copy02" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:textArea id="newXuiFile04_textArea_copy02" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="newXuiFile04_link_copy02" text="Link" action="#" textWrap="false"/>
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
      <td align="left" valign="middle">
        <bttdojo:richTextEditor id="newXuiFile04_richText" dataName="pageName" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:table id="newXuiFile04_table" dataName="pageName" dataNameForList="DisplayPageList" textWrap="false" isPageable="false">
        </bttdojo:table>
      </td>
      <td align="left" valign="middle">
        <bttdojo:tree id="newXuiFile04_tree" textWrap="false"/>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td>
      </td>
      <td align="left" valign="middle">
        <bttdojo:fileupload id="newXuiFile04_fileUpload" dataName="pageName" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
  </table>

</body>
</html>