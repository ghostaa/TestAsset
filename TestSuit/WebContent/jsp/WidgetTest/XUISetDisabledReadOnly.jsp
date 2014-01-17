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
<!-- Generated from XUISetDisabledReadOnly.xui by mashuai, on Fri Jan 17 13:40:56 CST 2014 -->
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
<%request.setAttribute("dse_sessionId", session.getId()); %>
  <div id="XUISetDisabledReadOnly_panel" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:group id="XUISetDisabledReadOnly_group01" text="MultiSelect">
          <div class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:group id="XUISetDisabledReadOnly_group" text="disabled">
                  <div class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="XUISetDisabledReadOnly_label" text="true: "/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:multiSelect id="XUISetDisabledReadOnly_multiSelect" dataNameForList="TestMultiSelectList" labelField="FieldForLabel" valueField="FieldForValue" selectedField="FieldForSelect" disabledField="FieldForDisable" disabled="true"/>
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="XUISetDisabledReadOnly_label01" text="false: "/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:multiSelect id="XUISetDisabledReadOnly_multiSelect_01" dataNameForList="TestMultiSelectList" labelField="FieldForLabel" valueField="FieldForValue" selectedField="FieldForSelect" disabledField="FieldForDisable"/>
                      </div>
                    </div>
                  </div>
              </bttdojo:group>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:group id="XUISetDisabledReadOnly_group_copy" text="readOnly">
                  <div class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="XUISetDisabledReadOnly_label_copy" text="true: "/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:multiSelect id="XUISetDisabledReadOnly_multiSelect_copy" dataNameForList="TestMultiSelectList" labelField="FieldForLabel" valueField="FieldForValue" selectedField="FieldForSelect" disabledField="FieldForDisable" readOnly="true"/>
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="XUISetDisabledReadOnly_label01_copy" text="false: "/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:multiSelect id="XUISetDisabledReadOnly_multiSelect_01_copy" dataNameForList="TestMultiSelectList" labelField="FieldForLabel" valueField="FieldForValue" selectedField="FieldForSelect" disabledField="FieldForDisable"/>
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
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:group id="XUISetDisabledReadOnly_group02" text="CheckMultiSelect">
          <div class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:group id="XUISetDisabledReadOnly_group03" text="disabled">
                  <div class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="XUISetDisabledReadOnly_label02" text="true: "/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:checkedMultiSelect id="XUISetDisabledReadOnly_checkedMultiSelect" dataNameForList="TestMultiSelectList" labelField="FieldForLabel" valueField="FieldForValue" selectedField="FieldForSelect" disabledField="FieldForDisable" disabled="true"/>
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="XUISetDisabledReadOnly_label03" text="false :"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:checkedMultiSelect id="XUISetDisabledReadOnly_checkedMultiSelect_copy" dataNameForList="TestMultiSelectList" labelField="FieldForLabel" valueField="FieldForValue" selectedField="FieldForSelect" disabledField="FieldForDisable"/>
                      </div>
                    </div>
                  </div>
              </bttdojo:group>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:group id="XUISetDisabledReadOnly_group04" text="readOnly">
                  <div class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="XUISetDisabledReadOnly_label02_copy" text="true: "/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:checkedMultiSelect id="XUISetDisabledReadOnly_checkedMultiSelect_copy01" dataNameForList="TestMultiSelectList" labelField="FieldForLabel" valueField="FieldForValue" selectedField="FieldForSelect" disabledField="FieldForDisable" readOnly="true"/>
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="XUISetDisabledReadOnly_label03_copy" text="false :"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:checkedMultiSelect id="XUISetDisabledReadOnly_checkedMultiSelect_copy02" dataNameForList="TestMultiSelectList" labelField="FieldForLabel" valueField="FieldForValue" selectedField="FieldForSelect" disabledField="FieldForDisable"/>
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
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:group id="XUISetDisabledReadOnly_group02_copy" text="EnhancedMultiSelect">
          <div class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:group id="XUISetDisabledReadOnly_group03_copy" text="disabled">
                  <div class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="XUISetDisabledReadOnly_label02_copy01" text="true: "/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:enhancedMultiSelect id="XUISetDisabledReadOnly_checkedMultiSelectExt" dataNameForList="TestMultiSelectList" labelField="FieldForLabel" valueField="FieldForValue" selectedField="FieldForSelect" disabledField="FieldForDisable" disabled="true"/>
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="XUISetDisabledReadOnly_label03_copy01" text="false :"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:enhancedMultiSelect id="XUISetDisabledReadOnly_checkedMultiSelectExt_copy" dataNameForList="TestMultiSelectList" labelField="FieldForLabel" valueField="FieldForValue" selectedField="FieldForSelect" disabledField="FieldForDisable"/>
                      </div>
                    </div>
                  </div>
              </bttdojo:group>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:group id="XUISetDisabledReadOnly_group04_copy" text="readOnly">
                  <div class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="XUISetDisabledReadOnly_label02_copy_copy" text="true: "/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:enhancedMultiSelect id="XUISetDisabledReadOnly_checkedMultiSelectExt_copy01" dataNameForList="TestMultiSelectList" labelField="FieldForLabel" valueField="FieldForValue" selectedField="FieldForSelect" disabledField="FieldForDisable" readOnly="true"/>
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="XUISetDisabledReadOnly_label03_copy_copy" text="false :"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:enhancedMultiSelect id="XUISetDisabledReadOnly_checkedMultiSelectExt_copy02" dataNameForList="TestMultiSelectList" labelField="FieldForLabel" valueField="FieldForValue" selectedField="FieldForSelect" disabledField="FieldForDisable"/>
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
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
    </div>
  </div>

<!-- applet id="printApplet" name="printApplet" code="com.ibm.btt.print.applets.PrintrApplet" codebase="applets" archive="bttprint.jar,JSON4J.jar" style="width:0px; height:0px;"></applet-->
</body>
</html>