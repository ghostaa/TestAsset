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
<!-- Generated from CopyFromTableToDIVExistCombine.xui by mashuai, on  -->
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
  <div id="CopyFromTableToDIVExistCombine_panel" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:form id="CopyFromTableToDIVExistCombine_form" errorPage="CopyFromTableToDIVExistCombine.jsp">
          <table>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="CopyFromTableToDIVExistCombine_label" text="The Form is 2*4"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:image id="CopyFromTableToDIVExistCombine_image" tabIndex="-1"/>
              </td>
              <td rowspan="2" align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:image id="CopyFromTableToDIVExistCombine_image01" tabIndex="-1"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:a id="CopyFromTableToDIVExistCombine_link" text="Link" flowEvent="viewEvt"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:button id="CopyFromTableToDIVExistCombine_button01" type="button" text="Button"/>
              </td>
            </tr>
          </table>
      </bttdojo:form>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:button id="CopyFromTableToDIVExistCombine_button" type="button" text="Button"/>
      </div>
    </div>
    <div class="BTTRowStyle">
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:group id="CopyFromTableToDIVExistCombine_group" style="height:90px;" text="Group" width="329px" height="90px">
          <div style="width:100%;height:100%;" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:image id="CopyFromTableToDIVExistCombine_image02" tabIndex="-1"/>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:button id="CopyFromTableToDIVExistCombine_button02" type="button" text="Button"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:a id="CopyFromTableToDIVExistCombine_link01" text="Link" action="#"/>
              </div>
            </div>
          </div>
      </bttdojo:group>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:tabbedpane id="CopyFromTableToDIVExistCombine_tabbedPane">
          <bttdojo:contentpane id="CopyFromTableToDIVExistCombine_ContentPane01" title="Tab01">
            <div class="BTTTableStyle">
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:a id="CopyFromTableToDIVExistCombine_link02" text="Link" action="#"/>
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
                  <bttdojo:a id="CopyFromTableToDIVExistCombine_link03" text="Link" action="#"/>
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
                  <bttdojo:a id="CopyFromTableToDIVExistCombine_link04" text="Link" action="#"/>
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
                  <bttdojo:a id="CopyFromTableToDIVExistCombine_link05" text="Link" action="#"/>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                </div>
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                </div>
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:a id="CopyFromTableToDIVExistCombine_link06" text="Link" action="#"/>
                </div>
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                </div>
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:a id="CopyFromTableToDIVExistCombine_link07" text="Link" action="#"/>
                </div>
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                </div>
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:a id="CopyFromTableToDIVExistCombine_link08" text="Link" action="#"/>
                </div>
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                </div>
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                </div>
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                </div>
              </div>
            </div>
        </bttdojo:contentpane>
      </bttdojo:tabbedpane>
      </div>
    </div>
  </div>

<!-- applet id="printApplet" name="printApplet" code="com.ibm.btt.print.applets.PrintrApplet" codebase="applets" archive="bttprint.jar,JSON4J.jar" style="width:0px; height:0px;"></applet-->
</body>
</html>