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
<!-- Generated from TreeAlignment.xui by mashuai, on  -->
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
  <div id="TreeAlignment_panel" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:top;">
        <bttdojo:form id="TreeAlignment_form" errorPage="TreeAlignment.jsp">
          <div class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:button id="TreeAlignment_button" type="submit" text="homepage" flowEvent="homepage"/>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="TreeAlignment_label" text="Horizaontal"/>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:tree id="TreeAlignment_tree_copy03_copy" dataNameForTreeContent="root" width="248px"/>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="center" style="vertical-align:top;">
                <table><tr><td align="left">
                  <bttdojo:tree id="TreeAlignment_tree_copy03_copy_copy" dataNameForTreeContent="root" width="264px" height="109px"/>
                </td></tr></table>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="right" style="vertical-align:bottom;">
                <table><tr><td align="left">
                  <bttdojo:tree id="TreeAlignment_tree_copy03_copy_copy_copy" dataNameForTreeContent="root" width="279px"/>
                </td></tr></table>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="TreeAlignment_label01" text="TabbedPane"/>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:top;">
                <bttdojo:tabbedpane id="TreeAlignment_tabbedPane">
                  <bttdojo:contentpane id="TreeAlignment_ContentPane01" title="Tab01">
                    <div style="height:100%;" class="BTTTableStyle">
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:top;">
                            <div style="height:403px;" id="TreeAlignment_panel02" class="BTTTableStyle">
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:top;">
                                  <bttdojo:tree id="TreeAlignment_tree" dataNameForTreeContent="root"/>
                                </div>
                              </div>
                            </div>
                        </div>
                        <div class="BTTCellStyle" align="left" style="vertical-align:top;">
                            <div style="height:449px;" id="TreeAlignment_panel03" class="BTTTableStyle">
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:tree id="TreeAlignment_tree_copy04" dataNameForTreeContent="root" height="122px"/>
                                </div>
                              </div>
                            </div>
                        </div>
                        <div class="BTTCellStyle" align="left" style="vertical-align:top;">
                            <div style="height:453px;" id="TreeAlignment_panel04" class="BTTTableStyle">
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:bottom;">
                                  <bttdojo:tree id="TreeAlignment_tree_copy05" dataNameForTreeContent="root"/>
                                </div>
                              </div>
                            </div>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:top;">
                            <div id="TreeAlignment_panel01" class="BTTTableStyle">
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" style="vertical-align:">
                                </div>
                                <div class="BTTCellStyle" style="vertical-align:">
                                </div>
                              </div>
                            </div>
                        </div>
                        <div class="BTTCellStyle" style="vertical-align:">
                        </div>
                        <div class="BTTCellStyle" style="vertical-align:">
                        </div>
                      </div>
                    </div>
                </bttdojo:contentpane>
                  <bttdojo:contentpane id="TreeAlignment_ContentPane02" title="Tab02">
                    <table style="table-layout:fixed">
                      <tr>
                        <td align="left" valign="middle" style="vertical-align:middle;">
                            <div style="width:599px;" id="TreeAlignment_Panel01" class="BTTTableStyle">
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:tree id="TreeAlignment_tree_copy_copy" dataNameForTreeContent="root" width="50%" height="50%"/>
                                </div>
                              </div>
                            </div>
                        </td>
                        <td colspan="2" rowspan="2" align="center" valign="middle" style="vertical-align:middle;">
                          <table><tr><td align="left">
                            <bttdojo:tree id="TreeAlignment_tree_copy01" dataNameForTreeContent="root" width="50%" height="50%"/>
                          </td></tr></table>
                        </td>
                        <td rowspan="2" align="left" valign="middle" style="vertical-align:middle;">
                            <div id="TreeAlignment_panel06" class="BTTTableStyle">
                            </div>
                        </td>
                      </tr>
                      <tr>
                        <td align="center" valign="middle" style="vertical-align:middle;">
                          <table><tr><td align="left">
                            <bttdojo:tree id="TreeAlignment_tree_copy" dataNameForTreeContent="root" width="50%" height="50%"/>
                          </td></tr></table>
                        </td>
                      </tr>
                      <tr>
                        <td colspan="4" align="center" valign="middle" style="vertical-align:middle;">
                            <div style="width:661px;" id="TreeAlignment_panel05" class="BTTTableStyle">
                            </div>
                        </td>
                      </tr>
                    </table>
                </bttdojo:contentpane>
                  <bttdojo:contentpane id="TreeAlignment_ContentPane03" title="Tab03">
                    <div class="BTTTableStyle">
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="right" style="vertical-align:middle;">
                            <div style="width:179px;height:272px;" id="TreeAlignment_panel07" class="BTTTableStyle">
                            </div>
                        </div>
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                            <div style="width:645px;height:284px;" id="TreeAlignment_panel09" class="BTTTableStyle">
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                </div>
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                </div>
                              </div>
                            </div>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        </div>
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                            <div style="width:752px;" id="TreeAlignment_panel08" class="BTTTableStyle">
                            </div>
                        </div>
                      </div>
                    </div>
                </bttdojo:contentpane>
                  <bttdojo:contentpane id="TreeAlignment_ContentPane04" title="Tab04">
                    <div class="BTTTableStyle">
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:top;">
                          <bttdojo:tree id="TreeAlignment_tree_copy02" dataNameForTreeContent="root"/>
                        </div>
                      </div>
                    </div>
                </bttdojo:contentpane>
                  <bttdojo:contentpane id="TreeAlignment_ContentPane05" title="Tab05">
                    <div class="BTTTableStyle">
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:tree id="TreeAlignment_tree_copy03" dataNameForTreeContent="root"/>
                        </div>
                      </div>
                    </div>
                </bttdojo:contentpane>
                  <bttdojo:contentpane id="TreeAlignment_ContentPane06" title="Tab06">
                    <div class="BTTTableStyle">
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="right" style="vertical-align:bottom;">
                          <table><tr><td align="left">
                            <bttdojo:tree id="TreeAlignment_tree_copy03_copy_copy01" dataNameForTreeContent="root"/>
                          </td></tr></table>
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
  </div>

<!-- applet id="printApplet" name="printApplet" code="com.ibm.btt.print.applets.PrintrApplet" codebase="applets" archive="bttprint.jar,JSON4J.jar" style="width:0px; height:0px;"></applet-->
</body>
</html>