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
<!-- Generated from G016_UC5.xui by mashuai, on Fri Jan 17 15:16:35 CST 2014 -->
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

@import "css/G016/gbp-mult-pa_a.css";

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
  <table class="layoutCenter" id="G016_UC5_panel">
    <tr>
      <td colspan="3" align="left" valign="middle" style="vertical-align:middle;">
          <div class="headArea BTTTableStyle" id="G016_UC5_panel01">
          </div>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;" class="listLeft">
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;" class="listCenter">
          <div style="width:464px;height:249px;" id="G016_UC5_panel02" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="G016_UC5_label" text="UC5 - the repetitive panel widget can contain any BTT widget except another repetitive panel widget"/>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="G016_UC5_label01"/>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="G016_UC5_label02" text="NOTE:UC2 has contains Group containers,UC3 has contains Form and Panel containers,so UC5 will test TabbedPane containers mainly"/>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:repetitivepanel id="G016_UC5_repetitivePanel" dataNameForList="products" style="width:635px;height:292px;">
                  <div style="width:635px;height:292px;" class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:tabbedpane id="G016_UC5_tabbedPane_${index}" height="272px">
                          <bttdojo:contentpane id="G016_UC5_ContentPane01_${index}" title="Tab01">
                            <table style="table-layout:fixed">
                              <tr>
                                <td align="left" valign="middle" style="vertical-align:middle;">
                                  <bttdojo:label id="G016_UC5_label03_${index}" dataName="products.${index}.ProductName" text="Label"/>
                                </td>
                                <td rowspan="3" align="left" valign="middle" style="vertical-align:middle;">
                                    <div id="G016_UC5_panel05_${index}" class="BTTTableStyle">
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:checkedMultiSelect id="G016_UC5_checkedMultiSelect_${index}" dataNameForList="products.${index}.Countrys" labelField="CountryName"/>
                                        </div>
                                      </div>
                                    </div>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle" style="vertical-align:middle;">
                                    <div id="G016_UC5_panel03_${index}" class="BTTTableStyle">
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:radio id="G016_UC5_radio01_${index}" dataName="products.${index}.RequiredPoints" value="1" text="Radio"/>
                                        </div>
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:radio id="G016_UC5_radio_${index}" dataName="products.${index}.RequiredPoints" value="0" text="Radio"/>
                                        </div>
                                      </div>
                                    </div>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle" style="vertical-align:middle;">
                                    <div id="G016_UC5_panel04_${index}" class="BTTTableStyle">
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:checkbox id="G016_UC5_checkBox_${index}" dataName="products.${index}.RequiredPoints" checkedValue="true" text="CheckBox"/>
                                        </div>
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:checkbox id="G016_UC5_checkBox01_${index}" dataName="products.${index}.RequiredPoints" checkedValue="true" text="CheckBox"/>
                                        </div>
                                      </div>
                                    </div>
                                </td>
                              </tr>
                            </table>
                        </bttdojo:contentpane>
                          <bttdojo:contentpane id="G016_UC5_ContentPane02_${index}" title="Tab02">
                            <div class="BTTTableStyle">
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:image id="G016_UC5_image_${index}" dataName="products.${index}.ProductImageURL" tabIndex="-1"/>
                                </div>
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:enhancedMultiSelect id="G016_UC5_checkedMultiSelectExt_${index}" dataNameForList="products.${index}.Countrys" labelField="CountryName"/>
                                </div>
                              </div>
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:message id="G016_UC5_message_${index}" dataName="products.${index}.RequiredPoints"/>
                                </div>
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                </div>
                              </div>
                            </div>
                        </bttdojo:contentpane>
                          <bttdojo:contentpane id="G016_UC5_ContentPane03_${index}" title="Tab03">
                            <div class="BTTTableStyle">
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                </div>
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:textbox id="G016_UC5_text_${index}" dataName="products.${index}.ProductName" type="String" width="306px"/>
                                </div>
                              </div>
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                </div>
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:textArea id="G016_UC5_textArea_${index}" dataName="products.${index}.ProductName" type="String" isMandatory="true"/>
                                </div>
                              </div>
                            </div>
                        </bttdojo:contentpane>
                          <bttdojo:contentpane id="G016_UC5_ContentPane04_${index}" title="Tab04">
                            <div class="BTTTableStyle">
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:richTextEditor id="G016_UC5_richText_${index}" dataName="products.${index}.ProductName"/>
                                </div>
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                </div>
                              </div>
                            </div>
                        </bttdojo:contentpane>
                          <bttdojo:contentpane id="G016_UC5_ContentPane05_${index}" title="Tab05">
                            <div class="BTTTableStyle">
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:table id="G016_UC5_table_${index}" dataNameForList="products.${index}.ForTableTest" isPageable="false">
                                    <bttdojo:column level="1" rowSpan="1" widget="TextBox" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="A" dataName="A" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
                                    <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="B" dataName="B" noresize="false" repeat="true" id="columnId1" headerVAlign="left"/>
                                  </bttdojo:table>
                                </div>
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                </div>
                              </div>
                            </div>
                        </bttdojo:contentpane>
                          <bttdojo:contentpane id="G016_UC5_ContentPane07_${index}" title="Tab06">
                            <div class="BTTTableStyle">
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:fileupload id="G016_UC5_fileUpload_${index}" dataName="products.${index}.fileUpload"/>
                                </div>
                              </div>
                            </div>
                        </bttdojo:contentpane>
                      </bttdojo:tabbedpane>
                      </div>
                    </div>
                  </div>
              </bttdojo:repetitivepanel>
              </div>
            </div>
          </div>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;" class="listRight">
      </td>
    </tr>
    <tr>
      <td colspan="3" align="left" valign="middle" style="vertical-align:middle;" class="footArea">
      </td>
    </tr>
  </table>

<!-- applet id="printApplet" name="printApplet" code="com.ibm.btt.print.applets.PrintrApplet" codebase="applets" archive="bttprint.jar,JSON4J.jar" style="width:0px; height:0px;"></applet-->
</body>
</html>