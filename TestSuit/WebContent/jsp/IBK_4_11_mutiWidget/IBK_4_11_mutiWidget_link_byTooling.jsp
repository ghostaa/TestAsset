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
<!-- Generated from IBK_4_11_mutiWidget_link_byTooling.xui by mashuai, on  -->
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
<script type="text/javascript" data-btt-eca="true" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/IBK_4_11_mutiWidget/IBK_4_11_mutiWidget_link_byTooling.js"> </script>
<%request.setAttribute("dse_sessionId", session.getId()); %>
  <div id="IBK_4_11_mutiWidget_link_byTooling_panel" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="IBK_4_11_mutiWidget_link_byTooling_panel01" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
              </div>
            </div>
          </div>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="IBK_4_11_mutiWidget_link_byTooling_panel02" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="IBK_4_11_mutiWidget_link_byTooling_RowIndex" text="RowIndex:"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="IBK_4_11_mutiWidget_link_byTooling_RowIdResult" text="Label"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="IBK_4_11_mutiWidget_link_byTooling_label" text="MenuId:"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="IBK_4_11_mutiWidget_link_byTooling_MenuIdResult" text="Label"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="IBK_4_11_mutiWidget_link_byTooling_WidgetId" text="WidgetId:" height="13px"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="IBK_4_11_mutiWidget_link_byTooling_WidgetIdResult" text="Label"/>
              </div>
            </div>
          </div>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="IBK_4_11_mutiWidget_link_byTooling_label03" text="Label"/>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="IBK_4_11_mutiWidget_link_byTooling_panel03" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:form id="IBK_4_11_mutiWidget_link_byTooling_form" errorPage="IBK_4_11_mutiWidget/IBK_4_11_mutiWidget_link_byTooling.jsp">
                  <div class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:table id="IBK_4_11_mutiWidget_link_byTooling_table" dataName="singleResult" dataNameForList="TestMutiWidgetList" isPageable="false">
                          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="column0" dataName="Field1" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
                          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="column1" dataName="Field2" noresize="false" repeat="true" id="columnId1" headerVAlign="left"/>
                          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="column2" dataName="Field3" noresize="false" repeat="true" id="columnId2" headerVAlign="left"/>
                          <bttdojo:column level="1" rowSpan="1" widget="Content" align="left" width="180" colSpan="1" hidden="false" headerHAlign="left" text="link" widgets="columnId3_link1,columnId3_link2" dataName="Field3" noresize="false" repeat="true" id="columnId3" headerVAlign="left">
                            <bttdojo:a text="ECA1(Left click)" action="#" cellWidgetId="columnId3_link1"/>
                            <bttdojo:a text="ECA2(Right click)" action="#" cellWidgetId="columnId3_link2"/>
                          </bttdojo:column>
                          <bttdojo:column level="1" rowSpan="1" widget="Content" align="left" width="350" colSpan="1" hidden="false" headerHAlign="left" text="submit" widgets="columnId4_widget0,columnId4_widget1,columnId4_widget2,columnId4_widget3" dataName="Field3" noresize="false" repeat="true" id="columnId4" headerVAlign="left">
                            <bttdojo:a text="change flow event" flowEvent="evtLink" cellWidgetId="columnId4_widget0"/>
                            <bttdojo:a text="launch new flow" flowId="IBK_4_11_mutiWidget_newFlow" cellWidgetId="columnId4_widget1"/>
                            <bttdojo:a text="launch new operation" operationId="IBK_4_11_MutiWidgetNewOp" cellWidgetId="columnId4_widget2"/>
                            <bttdojo:a text="url" action="http://www.baidu.com" cellWidgetId="columnId4_widget3"/>
                          </bttdojo:column>
                          <bttdojo:tableMenu hasCloseButton="false" leftClickToOpen="true" bindingCellWidgetId="columnId3_link1" position="point">
                            <bttdojo:tableMenuItem type="noAction" id="menu0_item0" text="menu0_item0"/>
                            <bttdojo:tableMenuItem type="noAction" id="menu0_item1" text="menu0_item1"/>
                          </bttdojo:tableMenu>
                          <bttdojo:tableMenu hasCloseButton="false" leftClickToOpen="false" bindingCellWidgetId="columnId3_link2" position="point">
                            <bttdojo:tableMenuItem type="noAction" id="menu1_item0" text="menu1_item0"/>
                            <bttdojo:tableMenuItem type="noAction" id="menu1_item1" text="menu1_item1"/>
                          </bttdojo:tableMenu>
                        </bttdojo:table>
                      </div>
                    </div>
                  </div>
              </bttdojo:form>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
              </div>
            </div>
          </div>
      </div>
    </div>
  </div>

<!-- applet id="printApplet" name="printApplet" code="com.ibm.btt.print.applets.PrintrApplet" codebase="applets" archive="bttprint.jar,JSON4J.jar" style="width:0px; height:0px;"></applet-->
</body>
</html>