<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<%
	java.util.Locale locale = (java.util.Locale)utb.getValue("dse_locale");
	if(locale == null) {
		locale = request.getLocale();
	} 

	String language = locale.getLanguage();
%>

<html lang="<%=language %>">
<!-- Generated from X076_Widget.xui by mashuai, on  -->
<head>
<%@ taglib uri="/WEB-INF/bttdojo.tld" prefix="bttdojo"%>
<%@ page import="com.ibm.btt.cs.html.JSPUtil" %> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>"id","t":"w","id":"Widget_panel","n":"TitleName"}]</title>
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
@import "js/com/ibm/btt/dijit/templates/Ems.css";
@import "js/dojox/form/resources/CheckedMultiSelect.css";
@import "js/com/ibm/btt/dijit/templates/tableScrollbar.css";
@import "js/com/ibm/btt/dijit/templates/Keyboard.css";
@import "js/com/ibm/btt/dijit/templates/RepetitivePanel.css";


.dojoxGrid table { margin: 0; }
.dj_gecko .dijitTextBoxReadOnly INPUT.dijitInputInner {
    -moz-user-input: auto;
}
.dj_gecko .dijitTextBoxReadOnlyFocused INPUT.dijitInputInner {
	-moz-user-input: none;
}
/** override the default CSS(claro) of dojo, otherwise, 
	on Chrome, the value of disabled text box can't be told from its background
**/
.dj_webkit .dijitTextBoxDisabled INPUT {
	color: #777777;
}
html, body {
	height:100%;
}
.BTTTableStyle{
	display:table;
}
.BTTRowStyle{
	display:table-row;
}
.BTTCellStyle{
	display:table-cell;
	padding:1px;
}
.dojoxGridInvisible td{
	height:0px;
	padding-top:0px;
	padding-bottom:0px;
}
.dojoxGridInvisible th{
	height:0px;
	border:0px solid black;
	padding-top:0px;
	padding-bottom:0px;
}
.claro .dojoxGridInvisible .dojoxGridCell{
	padding-top:0px;
	padding-bottom:0px;
	border:0px;
}
</style>

<!--[if lt IE 9]>
<style type="text/css">
.bttMultiSelectReadOnly > option[selected=selected]{
	color: white;
	background-color: #3399FF;
}

.bttMultiSelectDisabled > option[selected=selected]{
	color: white;
	background-color: #3399FF;
}
</style>
<![endif]-->

<script>
	var djConfig =  {
		baseUrl:"js/dojo/",
		<bttdojo:locale/>,
		isDebug: true, 
		parseOnLoad: true
	};
</script>
<script type="text/javascript" src="js/dojo/dojo_BTT.js"></script>
<script type="text/javascript" src="js/com/ibm/btt/btt.js"></script>
<script type="text/javascript" src="js/config/globalConfiguration.js"></script>
<script type="text/javascript" >
dojo.addOnLoad(function(){
	dojo.style(document.body, "visibility", "");
	var head = document.getElementsByTagName('head')[0].innerHTML;
	var titles = head.match(/<title>(.*)<\/title>/i);
	if(titles){
		var newtitle = StringUtil.escapeEnterWrap(I18nUtil.getI18nString(titles[1]));
		document.title = newtitle;
	}	
});
</script>

<script type="text/javascript">
	if(!window.engine){
		<%if(utb.ajaxNavigationEnabled()){%>
			window.engine = Engine.getInstance();
			Engine.getInstance()._sessionId = "<%=request.getSession().getId()%>";
		<%}else{%>
			window.engine = new com.ibm.btt.event.Engine();
		<%}%>
		engine.setMonitor(new com.ibm.btt.event.BaseMonitor());
		engine.registerCond("js/condition/condition.js");
		/** Uncomment this to use Global Function Key **/
		/** load definition in global project if necessary **/
		// engine.registerKeys("<url to global project>js/keymap/globalKeyMap.js");
		/** load definition in this(local) project **/
		// engine.registerKeys("js/keymap/globalKeyMap.js");
		/** please note that the local definition will override the global definition with the same name **/
		//  register back/forward/refresh/leave event handler
		//	engine.registerHandler("js/config/navigationHandler.js");
		
	}
</script>
</head>
<body class="claro" style="visibility:hidden">
<%request.setAttribute("dse_sessionId", session.getId()); %>
  <div id="X076_Widget_panel" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:group id="X076_Widget_group" style="height:2316px;" text="Group" height="2316px">
          <div style="height:100%;" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="height:342px;vertical-align:top;">
                <bttdojo:group id="X076_Widget_WTC" style="height:305px;" text="%nls.bttsample/WTC" height="305px">
                  <div style="height:100%;" class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:group id="X076_Widget_text" style="height:131px;" text="WidgetProperty" height="131px">
                          <div style="height:100%;" class="BTTTableStyle">
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:textbox id="X076_Widget_text01" hint="%nls.bttsample/test_widgets_properties?[{\"t\":\"c\",\"v\":\"hint\",\"n\":\"property\"},{\"p\":\"id\",\"t\":\"w\",\"id\":\"X076_Widget_text01\",\"n\":\"widget\"}]" placeHolder="%nls.bttsample/test_widgets_properties?[{\"p\":\"value\",\"t\":\"c\",\"v\":\"placeHolder\",\"id\":\"Widget_text01\",\"n\":\"property\"},{\"p\":\"id\",\"t\":\"w\",\"id\":\"X076_Widget_text01\",\"n\":\"widget\"}]"/>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:label id="X076_Widget_label21" text="%nls.bttsample/different_mode?[{\"p\":\"id\",\"t\":\"w\",\"id\":\"Widget_label21\",\"n\":\"widget\"}]"/>
                              </div>
                            </div>
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                              </div>
                            </div>
                          </div>
                      </bttdojo:group>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:group id="X076_Widget_paraName principel" style="height:139px;" text="paraName principel" height="139px">
                          <div style="height:100%;" class="BTTTableStyle">
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:label id="X076_Widget_label03_copy" text="%nls.bttsample/Test_For_Something_symboled?[{\"t\":\"c\",\"v\":\"principal of paraName(with symbol \\\"*\\\" in paraName)\",\"n\":\"sth*\"}]"/>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:label id="X076_Widget_label14" text="%nls.bttsample/Test_For_Something?[{\"t\":\"c\",\"v\":\"\\\"Value with Quotation marks\\\"\",\"n\":\"sth\"}]"/>
                              </div>
                            </div>
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:label id="X076_Widget_label11" text="%nls.bttsample/Test_For_Something_symbolpoint?[{\"t\":\"c\",\"v\":\"principal of paraName\",\"n\":\"sth.\"}]"/>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:label id="X076_Widget_label15" text="%nls.bttsample/Test_For_Something?[{\"t\":\"c\",\"v\":\"*Value* with star* symbol*\",\"n\":\"sth\"}]"/>
                              </div>
                            </div>
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:label id="X076_Widget_label12" text="%nls.bttsample/Test_For_Something?[{\"t\":\"c\",\"v\":\"principal of paraName(only letters)\",\"n\":\"sth\"}]"/>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:label id="X076_Widget_label16" text="%nls.bttsample/Test_For_Something?[{\"t\":\"c\",\"v\":\"\\uff1f\\uff1f\\uff1f\\uff1fValue with ????question Marks\",\"n\":\"sth\"}]"/>
                              </div>
                            </div>
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:label id="X076_Widget_label" text="%nls.bttsample/Test_For_Something_symboled?[{\"t\":\"c\",\"v\":\"123\",\"n\":\"sth*\"}]"/>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:label id="X076_Widget_label17" text="%nls.bttsample/Test_For_Something?[{\"t\":\"c\",\"v\":\"\\u2026\\u2026\\u2026\\u2026%%#)*#(&^)\",\"n\":\"sth\"}]"/>
                              </div>
                            </div>
                          </div>
                      </bttdojo:group>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:group id="X076_Widget_Load Time" style="height:104px;" text="Case For Load Time" height="104px">
                          <div style="height:100%;" class="BTTTableStyle">
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:label id="X076_Widget_label09" text="%nls.bttsample/Text of Widget?[{\"t\":\"c\",\"v\":\"text\",\"n\":\"property\"},{\"p\":\"id\",\"t\":\"w\",\"id\":\"X076_Widget_button02\",\"n\":\"WidgetName\"},{\"p\":\"text\",\"t\":\"w\",\"id\":\"X076_Widget_button02\",\"n\":\"value\"}]"/>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                              </div>
                            </div>
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:button id="X076_Widget_button02" type="button" text="I am Button"/>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                              </div>
                            </div>
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:label id="X076_Widget_label10" text="%nls.bttsample/Text of Widget?[{\"t\":\"c\",\"v\":\"text\",\"n\":\"property\"},{\"p\":\"id\",\"t\":\"w\",\"id\":\"X076_Widget_button02\",\"n\":\"WidgetName\"},{\"p\":\"text\",\"t\":\"w\",\"id\":\"X076_Widget_button02\",\"n\":\"value\"}]"/>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                              </div>
                            </div>
                          </div>
                      </bttdojo:group>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                    </div>
                  </div>
              </bttdojo:group>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="height:387px;vertical-align:top;">
                <bttdojo:group id="X076_Widget_ETC" style="height:373px;" text="%nls.bttsample/ETC" height="373px">
                  <div style="height:100%;" class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="height:269px;vertical-align:top;">
                        <bttdojo:group id="X076_Widget_Action" width="1517px" style="height:346px;" text="Action" height="346px">
                          <div style="width:100%;height:100%;" class="BTTTableStyle">
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="width:403px;height:126px;vertical-align:top;">
                                <bttdojo:group id="X076_Widget_message_display_group" width="387px" style="height:110px;" text="%nls.bttsample/group?[{\"t\":\"c\",\"v\":\"Invoke Property Function\",\"n\":\"GoupeName\"}]" height="110px">
                                  <div style="width:100%;height:100%;" class="BTTTableStyle">
                                    <div class="BTTRowStyle">
                                      <div class="BTTCellStyle" align="left" style="width:163px;vertical-align:middle;">
                                        <bttdojo:a id="X076_Widget_link01" text="Click to showMessage" action="#"/>
                                      </div>
                                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                        <bttdojo:label id="X076_Widget_label13" text="I am Label"/>
                                      </div>
                                    </div>
                                    <div class="BTTRowStyle">
                                      <div class="BTTCellStyle" align="left" style="width:163px;vertical-align:middle;">
                                        <bttdojo:button id="X076_Widget_button03" type="button" text="Click to showMessage"/>
                                      </div>
                                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                        <bttdojo:message id="X076_Widget_message01" dataName="dse_errorMessages"/>
                                      </div>
                                    </div>
                                  </div>
                              </bttdojo:group>
                              </div>
                              <div class="BTTCellStyle" align="left" style="width:262px;height:126px;vertical-align:top;">
                                <bttdojo:group id="X076_Widget_showErrorMessage_group" width="383px" style="height:108px;" text="%nls.bttsample/group?[{\"t\":\"c\",\"v\":\"Invoke Widget Functions\",\"n\":\"GoupeName\"}]" height="108px">
                                  <div style="width:100%;height:100%;" class="BTTTableStyle">
                                    <div class="BTTRowStyle">
                                      <div class="BTTCellStyle" align="left" style="vertical-align:top;">
                                        <bttdojo:textbox id="X076_Widget_text07"/>
                                      </div>
                                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                      </div>
                                    </div>
                                    <div class="BTTRowStyle">
                                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                        <bttdojo:button id="X076_Widget_button01" type="button" text="Click to showErrorMessage"/>
                                      </div>
                                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                        <bttdojo:label id="X076_Widget_label08" dataName="sampleField03"/>
                                      </div>
                                    </div>
                                    <div class="BTTRowStyle">
                                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                      </div>
                                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                      </div>
                                    </div>
                                  </div>
                              </bttdojo:group>
                              </div>
                              <div class="BTTCellStyle" align="left" style="height:126px;vertical-align:middle;">
                              </div>
                              <div class="BTTCellStyle" align="left" style="width:713px;height:126px;vertical-align:middle;">
                              </div>
                            </div>
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="width:403px;vertical-align:top;">
                                <bttdojo:group id="X076_Widget_Set Widget Property" style="height:158px;" text="%nls.bttsample/group?[{\"t\":\"c\",\"v\":\"set Widget Property\",\"n\":\"GoupeName\"}]" height="158px">
                                  <div style="height:100%;" class="BTTTableStyle">
                                    <div class="BTTRowStyle">
                                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                        <bttdojo:label id="X076_Widget_label19" text="I am Label"/>
                                      </div>
                                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                        <bttdojo:label id="X076_Widget_label20" text="Label" hint="I am label"/>
                                      </div>
                                    </div>
                                    <div class="BTTRowStyle">
                                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                        <bttdojo:button id="X076_Widget_button06" type="button" text="%nls.bttsample/set property?[{\"t\":\"c\",\"v\":\"hint\",\"n\":\"property\"}]"/>
                                      </div>
                                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                        <bttdojo:button id="X076_Widget_button07" type="button" text="%nls.bttsample/set property?[{\"t\":\"c\",\"v\":\"text\",\"n\":\"property\"}]"/>
                                      </div>
                                    </div>
                                  </div>
                              </bttdojo:group>
                              </div>
                              <div class="BTTCellStyle" align="left" style="width:262px;vertical-align:top;">
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                              </div>
                              <div class="BTTCellStyle" align="left" style="width:713px;vertical-align:middle;">
                              </div>
                            </div>
                          </div>
                      </bttdojo:group>
                      </div>
                    </div>
                  </div>
              </bttdojo:group>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="height:128px;vertical-align:top;">
                <bttdojo:group id="X076_Widget_MTC" style="height:108px;" text="%nls.bttsample/MTC" height="108px">
                  <div style="height:100%;" class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="X076_Widget_label06" text="%nls.bttsample/Test_For_Something?[{\"p\":\"text\",\"t\":\"c\",\"v\":\"mapping constant\",\"id\":\"Widget_MTC\",\"n\":\"sth\"}]"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:textbox id="X076_Widget_text06" dataName="ForMappingTest_Constant"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="X076_Widget_label22" text="%nls.bttsample/MTC"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:textbox id="X076_Widget_text08" dataName="ForMappingTest_Expression"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:form id="X076_Widget_form" errorPage="X076/X076_Widget.jsp">
                          <div class="BTTTableStyle">
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:button id="X076_Widget_button09" type="submit" text="%nls.bttsample/Test_For_Something?[{\"t\":\"c\",\"v\":\"Mapping Globel function(Click me)\",\"n\":\"sth\"}]" flowEvent="test_mapping"/>
                              </div>
                            </div>
                          </div>
                      </bttdojo:form>
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="X076_Widget_label23" text="%nls.bttsample/Test_For_Something?[{\"t\":\"c\",\"v\":\"Globel function\",\"n\":\"sth\"}]"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:textbox id="X076_Widget_text03" dataName="ForMappingTest_globlefunction1"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="X076_Widget_label24" text="Label"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:textbox id="X076_Widget_text09" dataName="ForMappingTest_globlefunction2"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:a id="X076_Widget_link02" text="%nls.bttsample/Test_For_Something?[{\"t\":\"c\",\"v\":\"Globle function\",\"n\":\"sth\"}]" flowEvent="test_mapping"/>
                      </div>
                    </div>
                  </div>
              </bttdojo:group>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:top;">
                <bttdojo:group id="X076_Widget_GTC" style="height:233px;" text="%nls.bttsample/GTC" height="233px">
                  <div style="height:100%;" class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:table id="X076_Widget_table01" dataNameForList="sampleList" isPageable="false">
                          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="%nls.bttsample/Text of Widget?[{\"t\":\"c\",\"v\":\"columnIndex\",\"n\":\"property\"},{\"p\":\"id\",\"t\":\"w\",\"id\":\"Widget_table01\",\"n\":\"WidgetName\"},{\"p\":\"columnIndex\",\"t\":\"w\",\"id\":\"Widget_table01\",\"n\":\"value\"}]" dataName="sampleField01" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
                          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="%nls.bttsample/Text of Widget?[{\"t\":\"c\",\"v\":\"columnIndex\",\"n\":\"property\"},{\"p\":\"id\",\"t\":\"w\",\"id\":\"Widget_table01\",\"n\":\"WidgetName\"},{\"p\":\"columnIndex\",\"t\":\"w\",\"id\":\"Widget_table01\",\"n\":\"value\"}]" dataName="sampleField02" noresize="false" repeat="true" id="columnId1" headerVAlign="left"/>
                          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="%nls.bttsample/Text of Widget?[{\"t\":\"c\",\"v\":\"columnIndex\",\"n\":\"property\"},{\"p\":\"id\",\"t\":\"w\",\"id\":\"Widget_table01\",\"n\":\"WidgetName\"},{\"p\":\"columnIndex\",\"t\":\"w\",\"id\":\"Widget_table01\",\"n\":\"value\"}]" dataName="sampleField01" noresize="false" repeat="true" id="columnId2" headerVAlign="left"/>
                        </bttdojo:table>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:table id="X076_Widget_table02" dataNameForList="sampleList" isPageable="false">
                          <bttdojo:column level="1" rowSpan="1" widget="Button" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="column0" canSort="false" newWindow="false" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
                          <bttdojo:column level="1" rowSpan="1" widget="Link" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="column1" canSort="false" newWindow="false" noresize="false" renderMode="text" repeat="true" id="columnId1" headerVAlign="left"/>
                        </bttdojo:table>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:table id="X076_Widget_table03" dataNameForList="sampleList" isPageable="false">
                          <bttdojo:column tooltip="%nls.bttsample/Test_For_Something?[{\"t\":\"c\",\"v\":\"tooltip of Button in Cell\",\"n\":\"sth\"}]" level="1" rowSpan="1" widget="Button" align="left" width="80" linkText="aaa" dataName="sampleField01" repeat="true" id="columnId0" headerVAlign="left" colSpan="1" hidden="false" headerHAlign="left" text="column0" newWindow="false" noresize="false"/>
                          <bttdojo:column level="1" rowSpan="1" widget="Link" align="left" width="80" linkText="%nls.bttsample/Test_For_Something?[{\"t\":\"c\",\"v\":\"Menue\",\"n\":\"sth\"}]" colSpan="1" hidden="false" headerHAlign="left" text="column1" canSort="false" newWindow="false" noresize="false" renderMode="text" repeat="true" id="columnId1" headerVAlign="left"/>
                          <bttdojo:column level="1" rowSpan="1" widget="Content" align="left" width="300" colSpan="1" hidden="false" headerHAlign="left" text="column2" canSort="false" widgets="columnId2_widget0,columnId2_widget1" noresize="false" repeat="true" id="columnId2" headerVAlign="left">
                            <bttdojo:button type="button" text="%nls.bttsample/Test_For_Something?[{\"t\":\"c\",\"v\":\"Button text in cellgroup\",\"n\":\"sth\"}]" hint="%nls.bttsample/Test_For_Something_symbolpoint?[{\"t\":\"c\",\"v\":\"hint of button in cellgroup\",\"n\":\"sth.\"}]" cellWidgetId="columnId2_widget0"/>
                            <bttdojo:a text="%nls.bttsample/Test_For_Something?[{\"t\":\"c\",\"v\":\"Link text in cellgroup\",\"n\":\"sth\"}]" action="#" hint="%nls.bttsample/Test_For_Something?[{\"p\":\"width\",\"t\":\"w\",\"v\":\"Link hint of cellgroup\",\"id\":\"Widget_table03\",\"n\":\"sth\"}]" cellWidgetId="columnId2_widget1"/>
                          </bttdojo:column>
                          <bttdojo:column level="1" rowSpan="1" widget="Link" align="left" width="80" linkText="no NLS" colSpan="1" hidden="false" headerHAlign="left" text="column3" canSort="false" newWindow="false" noresize="false" renderMode="text" repeat="true" id="columnId3" headerVAlign="left"/>
                          <bttdojo:tableMenu hasCloseButton="false" leftClickToOpen="true" bindingCellWidgetId="columnId0" position="point">
                            <bttdojo:tableMenuItem type="noAction" id="menu0_item0" text="%nls.bttsample/Text of Widget?[{\"p\":\"dataNameForList\",\"t\":\"c\",\"v\":\"dataNameForList\",\"id\":\"Widget_table03\",\"n\":\"property\"},{\"p\":\"id\",\"t\":\"w\",\"id\":\"Widget_table03\",\"n\":\"WidgetName\"},{\"p\":\"dataNameForList\",\"t\":\"w\",\"id\":\"Widget_table03\",\"n\":\"value\"}]"/>
                            <bttdojo:tableMenuItem type="noAction" id="menu0_item1" text="%nls.bttsample/Text of Widget?[{\"t\":\"c\",\"v\":\"dataNameForList\",\"n\":\"property\"},{\"p\":\"id\",\"t\":\"w\",\"id\":\"Widget_table03\",\"n\":\"WidgetName\"},{\"p\":\"dataNameForList\",\"t\":\"w\",\"id\":\"Widget_table03\",\"n\":\"value\"}]"/>
                          </bttdojo:tableMenu>
                          <bttdojo:tableMenu hasCloseButton="false" leftClickToOpen="true" bindingCellWidgetId="columnId1" position="point">
                            <bttdojo:tableMenuItem type="noAction" id="menu1_item0" text="%nls.bttsample/Text of Widget?[{\"t\":\"c\",\"v\":\"headerRows\",\"n\":\"property\"},{\"p\":\"id\",\"t\":\"w\",\"id\":\"Widget_table03\",\"n\":\"WidgetName\"},{\"p\":\"headerRows\",\"t\":\"w\",\"id\":\"Widget_table03\",\"n\":\"value\"}]"/>
                            <bttdojo:tableMenuItem type="noAction" id="menu1_item1" text="menu1_item1"/>
                            <bttdojo:tableMenuItem type="noAction" id="menu1_item2" text="%nls.bttsample/Test_For_Something_symboled?[{\"t\":\"c\",\"v\":\"Menue\",\"n\":\"sth*\"}]"/>
                          </bttdojo:tableMenu>
                          <bttdojo:tableMenu hasCloseButton="false" leftClickToOpen="true" bindingCellWidgetId="columnId2" position="point">
                            <bttdojo:tableMenuItem type="noAction" id="menu2_item0" text="%nls.bttsample/Text of Widget?[{\"t\":\"c\",\"v\":\"visibility\",\"n\":\"property\"},{\"p\":\"id\",\"t\":\"w\",\"id\":\"Widget_table03\",\"n\":\"WidgetName\"},{\"p\":\"visibility\",\"t\":\"w\",\"id\":\"Widget_table03\",\"n\":\"value\"}]"/>
                            <bttdojo:tableMenuItem type="noAction" id="menu2_item1" text="%nls.bttsample/Text of Widget?[{\"t\":\"c\",\"v\":\"Height\",\"n\":\"property\"},{\"p\":\"id\",\"t\":\"w\",\"id\":\"Widget_table03\",\"n\":\"WidgetName\"},{\"p\":\"height\",\"t\":\"w\",\"id\":\"Widget_table03\",\"n\":\"value\"}]"/>
                          </bttdojo:tableMenu>
                        </bttdojo:table>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:table id="X076_Widget_table04" dataNameForList="sampleList" headerRows="2" isPageable="false">
                          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="%nls.bttsample/Text of Widget?[{\"t\":\"c\",\"v\":\"columnIndex\",\"n\":\"property\"},{\"p\":\"id\",\"t\":\"w\",\"id\":\"Widget_table04\",\"n\":\"WidgetName\"},{\"p\":\"columnIndex\",\"t\":\"w\",\"id\":\"Widget_table04\",\"n\":\"value\"}]" dataName="sampleField01" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
                          <bttdojo:column level="2" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="%nls.bttsample/Test_For_Something?[{\"t\":\"c\",\"v\":\"headerRows=2\",\"n\":\"sth\"}]" dataName="sampleField02" noresize="false" repeat="true" id="columnId1" headerVAlign="left"/>
                        </bttdojo:table>
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="X076_Widget_label02" text="%nls.bttsample/Test_For_Something?[{\"t\":\"c\",\"v\":\"Colunms\",\"n\":\"sth\"}]"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="X076_Widget_label03" text="%nls.bttsample/Text of Widget?[{\"t\":\"c\",\"v\":\"headerRows\",\"n\":\"property\"},{\"p\":\"id\",\"t\":\"w\",\"id\":\"Widget_table02\",\"n\":\"WidgetName\"},{\"p\":\"headerRows\",\"t\":\"w\",\"id\":\"Widget_table02\",\"n\":\"value\"}]"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="X076_Widget_label04" text="%nls.bttsample/Test_For_Something?[{\"t\":\"c\",\"v\":\"Menue\",\"n\":\"sth\"}]"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="X076_Widget_label05" text="%nls.bttsample/Test_For_Something?[{\"t\":\"c\",\"v\":\"hesderRows>1\",\"n\":\"sth\"}]"/>
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                    </div>
                  </div>
              </bttdojo:group>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:top;">
                <bttdojo:group id="X076_Widget_DCTC" style="height:99px;" text="%nls.bttsample/DCTC" height="99px">
                  <div style="height:100%;" class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="X076_Widget_label07" text="%nls.bttsample/Test_For_Something?[{\"t\":\"c\",\"v\":\"Double Click\",\"n\":\"sth\"}]"/>
                      </div>
                    </div>
                  </div>
              </bttdojo:group>
              </div>
            </div>
          </div>
      </bttdojo:group>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:group id="X076_Widget_group01" text="Group">
          <div class="BTTTableStyle">
          </div>
      </bttdojo:group>
      </div>
    </div>
  </div>

<div url="jsp/X076/X076_Widget.js" prefix="" dojoType="com.ibm.btt.event.ECALoader"></div>
<!-- applet id="printApplet" name="printApplet" code="com.ibm.btt.print.applets.PrintrApplet" codebase="applets" archive="bttprint.jar,JSON4J.jar" style="width:0px; height:0px;"></applet-->
</body>
</html>