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
<!-- Generated from index.xui by mashuai, on Fri Jan 17 15:18:05 CST 2014 -->
<head>
<%@ taglib uri="/WEB-INF/bttdojo.tld" prefix="bttdojo"%>
<%@ page import="com.ibm.btt.cs.html.JSPUtil" %> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>%nls.bttsample/Welcome_To_Btt_Sample</title>
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

@import "css/dijit/buttonTextVerticalAlign.css";
@import "css/w006/image.css";
@import "css/w006/panel,form.css";
@import "css/cell/border_styles.css";
@import "css/w006/G019_panel,form,image.css";
@import "css/G016/G016.css";
@import "css/w006/w006.css";
@import "css/testGridEnhancement.css";
@import "css/main.css";
@import "css/test.css";

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
  <div id="index_null" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:top;">
        <bttdojo:form id="index_form" errorPage="index.jsp">
          <div class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="height:100px;padding-left:50px;border:solid 1px #E8FFFF;background-color:#E2F8FA;vertical-align:middle;">
                <bttdojo:label id="index_label" text="%nls.bttsample/Welcome_To_Btt_Sample"/>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <div id="index_panel" class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="padding-left:20px;vertical-align:middle;">
                        <bttdojo:a id="index_Link01" text="%nls.bttsample/lang_ch" operationId="IBK_F_007_setLocale01Op"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="padding-left:20px;vertical-align:middle;">
                        <bttdojo:a id="index_link13" text="%nls.bttsample/lang_English" operationId="IBK_F_007_setLocale02Op"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="padding-left:20px;vertical-align:middle;">
                        <bttdojo:a id="index_link14" text="%nls.bttsample/lang_Korean" operationId="IBK_F_007_setLocale_Ko_Op"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="padding-left:20px;vertical-align:middle;">
                        <bttdojo:a id="index_link15" text="%nls.bttsample/lang_sp" operationId="IBK_F_007_setLocale_Sp_Op"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                    </div>
                  </div>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:tabbedpane id="index_tabbedPane">
                  <bttdojo:contentpane id="index_ContentPane01" title="IBK-FVT">
                    <div class="BTTTableStyle">
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_link01" text="Click link to launch test case for IBK4-11( muti-Widget )" flowId="IBK_4_11_mutiWidgetFlow"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_link01_copy01" text="Click link to launch test case for IBK_F_001&IBK_F_017" flowId="IBK_F_001_IBK_F_007_TitleFlow"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_link12" text="Click link to launch test case for IBK_F_006:Date Picker" flowId="IBK_F_006_datePickerFlow"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_link16" text="Click link to launch test case for IBK_F_007:multilanguage switch" flowId="IBK_F_007_1Flow"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_link17" text="Click link to launch test case for F003: header merge and body cell merge" flowId="F003_IndexFlow"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_link18" text="Click link to launch test case for IBK_F_013: indirect selection" flowId="F013_IndexFlow"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_link18_copy" text="Click link to launch test case for IBK_F_018: Table data append" flowId="IBK_F_018_TableDataAppendFlow"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_link07_copy01" text="Click link to launch test case for IBK19 and 21 for sub folder" flowId="IBK_SubFolder_19_21PopupWindow"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_link07_copy01_copy" text="Click link to launch test case for IBK19 and 21 for inner sub folder" flowId="IBK_inner_SubFolder_19_21PopupWindow"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_IBK15_19And21" text="Click link to launch test case for IBK 19 and 21 (Popup Window)" flowId="req19_21"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_link07" text="Click link to launch test case for IBK19 and 21(Popup window size, position and close box)" flowId="IBK_19_21PopupWindow" flowEvent="start"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_link04" text="Click link to launch test case for IBK 1&3 multiple Css & Css detail" flowId="widgetCssFlow" flowEvent="start"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_IBK25" text="Click link to launch test case for IBK 25 Button Text Vertical Alignment" flowId="IBK_25_Button_VAlignFlow"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_link05" text="Click link to launch test case for IBK 26&14 Cell's Css(use InlineStyle&Css file)" flowId="CellCssFlow" flowEvent="start"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_link01_copy" text="Click link to launch test case for IBK4-12( Table Widget Extension : Context menu support )" flowId="nonEditableTableFlow"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_IBK20And6" text="Click link to launch test case for IBK20 (new line character in table) and IBK6 (Combox supports disabling edit)" flowId="IBK_testFlow1"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_link11_copy" text="Click link to launch test case for IBK 31 (Changing Table/Grid Structure with DIV layout)" flowId="G018Flow"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_link09_copy01" text="Click link to launch test case for IBK 28 : Script widget" flowId="G030_scriptWidgetFlow" flowEvent="start"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_IBK18" text="Click link to launch test case for IBK18 Table Scrollbar" flowId="IBK_18_Table_Scrollbar_Flow"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_IBK30" text="Click link to launch test case for IBK 30 XHTML support" flowId="IBK_30_Test_XHTML_Index_Flow"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_link06" text="Click link to launch test case for IBK 25 Text's alignment of button" flowId="ButtonTextAlignmentFlow" flowEvent="start"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_link08_copy" text="Click link to launch test case for IBK 6: Support Label/Value field on Combo widget" flowId="TestComboWidgetR6Flow"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_link09_copy02" text="Click link to launch test case for IBK 15: Set the relative width for certain column in a table widget" flowId="ColumnSize_And_Scrollbar"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_link07_copy" text="Click link to launch test case for IBK 9/34: \"onClick\" event for image" flowId="TestImageActionFlow"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_link04_copy" text="Click link to launch test case for IBK 7: three new multi-select widget" flowId="TestMultiSelectFlow" flowEvent="start"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_link_mainpage" text="Click link to launch My Pages sample implementation" operationId="mainPageOp"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_link21" text="Click link to launch IBK33683&IBK33643&IBK33690" flowId="PMR_FeatureFlow"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        </div>
                      </div>
                    </div>
                </bttdojo:contentpane>
                  <bttdojo:contentpane id="index_ContentPane02" title="Banco Popular-FVT" selected="true">
                    <div class="BTTTableStyle">
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:group id="index_group01" text="8104">
                            <div class="BTTTableStyle">
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:a id="index_link33" text="B004 Chart" flowId="B004_main_Flow"/>
                                </div>
                              </div>
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:a id="index_link32" text="X075 isMandatory" flowId="X075_Mandatory_FVT_Flow"/>
                                </div>
                              </div>
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:a id="index_link29" text="Q009 div flow" flowId="Q009_mainFlow"/>
                                </div>
                              </div>
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:a id="index_link34" text="X076 Dynamic NLS flow" flowId="X076_NLSFlow"/>
                                </div>
                              </div>
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:a id="index_link35" text="B001 Enhencement in repetitive panel" flowId="B001_QueryCreditCardFlow"/>
                                </div>
                              </div>
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:a id="index_link36" text="B002 Aspect flow for error handling" flowId="B002_IndexFlow"/>
                                </div>
                              </div>
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:a id="index_link37" text="B003 & B006 TabbedPane enhance and Style enhance" flowId="B003_UC1Flow"/>
                                </div>
                              </div>
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:a id="index_link38" text="Test Silder in Mexico bank" flowId="mybankFlow"/>
                                </div>
                              </div>
                            </div>
                        </bttdojo:group>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:group id="index_group" text="8103">
                            <div class="BTTTableStyle">
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:a id="index_link23" text="Q002 include page" flowId="Q002_test_Flow"/>
                                </div>
                              </div>
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:a id="index_link30" text="Q006 Server push" flowId="webMessageFlow"/>
                                </div>
                              </div>
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:a id="index_link27" text="Q007 Ajax Test ShowCover" operationId="DisplayPageOp" extraParams="pageName=AjaxValue.jsp"/>
                                </div>
                              </div>
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:a id="index_link28" text="Q008 Popup Flow" flowId="Q008_MainPopupFlow"/>
                                </div>
                              </div>
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:a id="index_link24" text="X070: Table sorting enhancements" flowId="X070_IndexFlow"/>
                                </div>
                              </div>
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:a id="index_link25" text="X-072: Provide details in mapping errors" flowId="X072_IndexFlow"/>
                                </div>
                              </div>
                            </div>
                        </bttdojo:group>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_link22" text="Click link to launch test case for X073 " flowId="X073_test_Flow"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_link09" text="Click link to launch test case for G030(External JavaScript support)" flowId="G030_scriptWidgetFlow" flowEvent="start"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_link08" text="Click link to launch test case for X061(  retrieve the typed data from table)" flowId="X061_indexFlow"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_link10" text="Click link to launch test case for G003(Checkbox & radio table row selection)" flowId="G003_Index_Flow"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_link" text="Click link to launch test case for G017(clickModeForDropDown)" flowId="G017_indexFlow"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_link02" text="Click link to launch test case for G028( table column filtering)" flowId="G028_indexFlow"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_link11" text="Click link to launch test case for G018: DIV-based widget layout" flowId="G018Flow"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_link09_copy" text="Click link to launch test case for G019" flowId="g019Flow" flowEvent="start"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_link19" text="Click link to launch test case for G016 (Repetitive Panel)" flowId="G016_UC_productList_Flow"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_link19_copy" text="Click link to launch test case for G021" flowId="G021_Test_Flow"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_link20" text="Click link to launch test case for G001" flowId="G001_IndexFlow"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        </div>
                      </div>
                    </div>
                </bttdojo:contentpane>
                  <bttdojo:contentpane id="index_ContentPane03" title="%nls.bttsample/TBK_Index_Tab03">
                    <div class="BTTTableStyle">
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_link31" text="8104 SVT" flowId="SVT_8104_mainFlow"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_link26" text="8103 SVT" flowId="SVT_8103_main_Flow"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="index_link03" text="Click to launch end to end test flow" flowId="IBKE2E_TestFlowFlow"/>
                        </div>
                      </div>
                    </div>
                </bttdojo:contentpane>
              </bttdojo:tabbedpane>
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

<!-- applet id="printApplet" name="printApplet" code="com.ibm.btt.print.applets.PrintrApplet" codebase="applets" archive="bttprint.jar,JSON4J.jar" style="width:0px; height:0px;"></applet-->
</body>
</html>