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
<!-- Generated from X073_Function_Test.xui by mashuai, on Fri Jan 17 15:17:58 CST 2014 -->
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
<script type="text/javascript" data-btt-eca="true" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/X073/X073_Function_Test.js"> </script>
<%request.setAttribute("dse_sessionId", session.getId()); %>
  <div id="X073_Function_Test_panel" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="X073_Function_Test_panel01" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
              </div>
            </div>
          </div>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="X073_Function_Test_panel02" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="X073_Function_Test_label01" text="RowIndex:"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="X073_Function_Test_RowIndexResult" text="Label"/>
              </div>
              <div class="BTTCellStyle" align="left" style="width:50px;vertical-align:middle;">
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="X073_Function_Test_MenuId" text="MenuId:"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="X073_Function_Test_MenuIdResult" text="Label"/>
              </div>
              <div class="BTTCellStyle" align="left" style="width:50px;vertical-align:middle;">
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="X073_Function_Test_label" text="WidgetId:"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="X073_Function_Test_WidgetIdResult" text="Label"/>
              </div>
            </div>
          </div>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="X073_Function_Test_panel03" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:form id="X073_Function_Test_form" errorPage="X073/X073_Function_Test.jsp">
                  <div class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <div id="X073_Function_Test_panel04" class="BTTTableStyle">
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:label id="X073_Function_Test_label03" text="test validation(Must input number)"/>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:textbox id="X073_Function_Test_text" dataName="testValidation" type="Number"/>
                              </div>
                            </div>
                          </div>
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:table id="X073_Function_Test_table" dataName="TestMutiWidgetListResult" dataNameForList="TestMutiWidgetList" selectionMode="multiple" isPageable="false">
                          <bttdojo:column level="1" rowSpan="1" widget="Content" align="left" width="300" colSpan="1" hidden="false" headerHAlign="left" text="text" widgets="t_label,t_button,t_image,t_link" dataName="Field1" noresize="false" repeat="true" id="columnId0" headerVAlign="left">
                            <bttdojo:label text="number" hint="number" cellWidgetId="t_label"/>
                            <bttdojo:button type="submit" text="event" flowEvent="submit" hint="event" cellWidgetId="t_button"/>
                            <bttdojo:image alt="alt" hint="pic" tabIndex="-1" cellWidgetId="t_image" cellWidgetDataName="Image"/>
                            <bttdojo:a text="event" flowEvent="submit" hint="event" cellWidgetId="t_link"/>
                          </bttdojo:column>
                          <bttdojo:column level="1" rowSpan="1" widget="Content" align="left" width="300" colSpan="1" hidden="false" headerHAlign="left" text="NLS" canSort="false" widgets="nls_image,nls_button,nls_label,nls_link" noresize="false" repeat="true" id="columnId4" headerVAlign="left">
                            <bttdojo:image alt="%nls.bttsample/pic_alt" hint="%nls.bttsample/hint_test" tabIndex="-1" cellWidgetId="nls_image" cellWidgetDataName="Image"/>
                            <bttdojo:button type="cancel" text="%nls.bttsample/nls_test_sample" flowId="X073_test_Flow" hint="%nls.bttsample/hint_test" cellWidgetId="nls_button"/>
                            <bttdojo:label text="%nls.bttsample/Welcome_To_Btt_Sample" hint="%nls.bttsample/hint_test" cellWidgetId="nls_label"/>
                            <bttdojo:a text="%nls.bttsample/nls_test_sample" target="_blank" flowId="X073_test_Flow" extraParams="testValidation=13579" hint="%nls.bttsample/hint_test" cellWidgetId="nls_link"/>
                          </bttdojo:column>
                          <bttdojo:column level="1" rowSpan="1" widget="Content" align="left" width="300" colSpan="1" hidden="false" headerHAlign="left" text="DataName" canSort="false" widgets="testButton,testLink,testLabel,testImage,testLink2" noresize="false" repeat="true" id="columnId3" headerVAlign="left">
                            <bttdojo:button type="button" text="ECA" accesskey="b" icon="img/GIF.gif" tabIndex="1" cellWidgetId="testButton"/>
                            <bttdojo:a text="baidu" accesskey="l" target="_blank" action="http://www.baidu.com" tabIndex="3" cellWidgetId="testLink"/>
                            <bttdojo:label text="label" hint="label" cellWidgetId="testLabel" cellWidgetDataName="Field3"/>
                            <bttdojo:image location="img/7days.jpg" alt="%nls.bttsample/lang_English" hint="image" tabIndex="2" cellWidgetId="testImage" cellWidgetDataName="Image"/>
                            <bttdojo:a text="ECA" action="#" cellWidgetId="testLink2"/>
                          </bttdojo:column>
                          <bttdojo:column level="1" rowSpan="1" widget="Content" align="left" width="200" colSpan="1" hidden="false" headerHAlign="left" text="disable" widgets="d_image,d_link,d_button" dataName="Field1" noresize="false" repeat="true" id="columnId5" headerVAlign="left">
                            <bttdojo:image location="img/Arrow.jpg" disabled="true" tabIndex="-1" cellWidgetId="d_image"/>
                            <bttdojo:a text="disable" disabled="true" flowEvent="submit" cellWidgetId="d_link"/>
                            <bttdojo:button type="submit" text="disable" inValid="true" flowEvent="submit" cellWidgetId="d_button"/>
                          </bttdojo:column>
                          <bttdojo:column level="1" rowSpan="1" widget="Content" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="hidden" widgets="columnId1_button,columnId1_label,columnId1_link,columnId1_image" dataName="Field2" noresize="false" repeat="true" id="columnId1" headerVAlign="left">
                            <bttdojo:button type="button" text="hidden" visibility="hidden" cellWidgetId="columnId1_button"/>
                            <bttdojo:label text="hidden" visibility="hidden" cellWidgetId="columnId1_label"/>
                            <bttdojo:a text="hidden" visibility="hidden" action="#" cellWidgetId="columnId1_link"/>
                            <bttdojo:image location="img/7days.jpg" visibility="hidden" tabIndex="-1" cellWidgetId="columnId1_image"/>
                          </bttdojo:column>
                          <bttdojo:column level="1" rowSpan="1" widget="Content" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="gone" widgets="gone_button,gone_label,gone_link,gone_image" dataName="Field3" noresize="false" repeat="true" id="columnId2" headerVAlign="left">
                            <bttdojo:button type="button" text="gone" visibility="gone" flowEvent="submit" cellWidgetId="gone_button"/>
                            <bttdojo:label text="gone" visibility="gone" cellWidgetId="gone_label"/>
                            <bttdojo:a text="gone" visibility="gone" action="#" cellWidgetId="gone_link"/>
                            <bttdojo:image location="img/Arrow.jpg" visibility="gone" tabIndex="-1" cellWidgetId="gone_image"/>
                          </bttdojo:column>
                          <bttdojo:tableMenu hasCloseButton="true" leftClickToOpen="true" bindingCellWidgetId="testButton" position="point">
                            <bttdojo:tableMenuItem type="noAction" id="menu0_item0" text="menu0_item0"/>
                            <bttdojo:tableMenuItem type="noAction" id="menu0_item1" text="menu0_item1"/>
                          </bttdojo:tableMenu>
                          <bttdojo:tableMenu hasCloseButton="false" leftClickToOpen="false" bindingCellWidgetId="testLink2" position="point">
                            <bttdojo:tableMenuItem type="noAction" id="menu1_item0" text="menu1_item0"/>
                            <bttdojo:tableMenuItem type="noAction" id="menu1_item1" text="menu1_item1"/>
                          </bttdojo:tableMenu>
                        </bttdojo:table>
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
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