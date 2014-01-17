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
<!-- Generated from TabbedPaneTesting.xui by mashuai, on Fri Jan 17 15:17:33 CST 2014 -->
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
  <div id="TabbedPaneTesting_panel" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="center" style="vertical-align:middle;">
        <table><tr><td align="left">
          <bttdojo:tabbedpane id="TabbedPaneTesting_tabbedPane" hint="tabPosition in top --hint" width="300px" height="150px">
            <bttdojo:contentpane id="TabbedPaneTesting_ContentPane01" title="tabPosition in top">
              <div class="BTTTableStyle">
                <div class="BTTRowStyle">
                  <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                    <bttdojo:label id="TabbedPaneTesting_label06" text="Label"/>
                  </div>
                </div>
              </div>
          </bttdojo:contentpane>
            <bttdojo:contentpane id="TabbedPaneTesting_ContentPane03" title="Tab02">
              <div class="BTTTableStyle">
                <div class="BTTRowStyle">
                  <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                    <bttdojo:label id="TabbedPaneTesting_label07" text="Label"/>
                  </div>
                  <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  </div>
                </div>
                <div class="BTTRowStyle">
                  <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  </div>
                  <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                    <bttdojo:label id="TabbedPaneTesting_label08" text="Label"/>
                  </div>
                </div>
              </div>
          </bttdojo:contentpane>
            <bttdojo:contentpane id="TabbedPaneTesting_ContentPane04" title="Tab03">
              <div class="BTTTableStyle">
                <div class="BTTRowStyle">
                  <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                    <bttdojo:label id="TabbedPaneTesting_label09" text="Label"/>
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
                    <bttdojo:label id="TabbedPaneTesting_label10" text="Label"/>
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
                    <bttdojo:label id="TabbedPaneTesting_label11" text="Label"/>
                  </div>
                </div>
              </div>
          </bttdojo:contentpane>
        </bttdojo:tabbedpane>
        </td></tr></table>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="center" style="vertical-align:top;">
        <table><tr><td align="left">
          <bttdojo:tabbedpane id="TabbedPaneTesting_tabbedPane01" tabPosition="bottom">
            <bttdojo:contentpane id="TabbedPaneTesting_ContentPane02" title="tabPosition in bottom">
              <div class="BTTTableStyle">
                <div class="BTTRowStyle">
                  <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                    <bttdojo:label id="TabbedPaneTesting_label12" text="Label"/>
                  </div>
                </div>
              </div>
          </bttdojo:contentpane>
            <bttdojo:contentpane id="TabbedPaneTesting_ContentPane05" title="Tab02">
              <div class="BTTTableStyle">
                <div class="BTTRowStyle">
                  <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                    <bttdojo:label id="TabbedPaneTesting_label13" text="Label"/>
                  </div>
                  <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  </div>
                </div>
                <div class="BTTRowStyle">
                  <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  </div>
                  <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                    <bttdojo:label id="TabbedPaneTesting_label14" text="Label"/>
                  </div>
                </div>
              </div>
          </bttdojo:contentpane>
        </bttdojo:tabbedpane>
        </td></tr></table>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:tabbedpane id="TabbedPaneTesting_tabbedPane02" tabPosition="right">
          <bttdojo:contentpane id="TabbedPaneTesting_ContentPane08" title="tabPosition in right">
            <div class="BTTTableStyle">
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:label id="TabbedPaneTesting_label15" text="Label"/>
                </div>
              </div>
            </div>
        </bttdojo:contentpane>
          <bttdojo:contentpane id="TabbedPaneTesting_ContentPane09" title="Tab02">
            <div class="BTTTableStyle">
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:label id="TabbedPaneTesting_label16" text="Label"/>
                </div>
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                </div>
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:label id="TabbedPaneTesting_label17" text="Label"/>
                </div>
              </div>
            </div>
        </bttdojo:contentpane>
          <bttdojo:contentpane id="TabbedPaneTesting_ContentPane10" title="Tab03">
            <div class="BTTTableStyle">
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:label id="TabbedPaneTesting_label18" text="Label"/>
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
                  <bttdojo:label id="TabbedPaneTesting_label19" text="Label"/>
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
                  <bttdojo:label id="TabbedPaneTesting_label20" text="Label"/>
                </div>
              </div>
            </div>
        </bttdojo:contentpane>
      </bttdojo:tabbedpane>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:tabbedpane id="TabbedPaneTesting_tabbedPane04" visibility="gone">
          <bttdojo:contentpane id="TabbedPaneTesting_ContentPane20" title="Tab01">
            <div class="BTTTableStyle">
            </div>
        </bttdojo:contentpane>
      </bttdojo:tabbedpane>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:tabbedpane id="TabbedPaneTesting_tabbedPane03" tabPosition="left">
          <bttdojo:contentpane id="TabbedPaneTesting_ContentPane13" title="tabPosition in left">
            <div class="BTTTableStyle">
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:label id="TabbedPaneTesting_label" text="Label"/>
                </div>
              </div>
            </div>
        </bttdojo:contentpane>
          <bttdojo:contentpane id="TabbedPaneTesting_ContentPane14" title="selected=true" selected="true">
            <div class="BTTTableStyle">
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:label id="TabbedPaneTesting_label01" text="Label"/>
                </div>
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                </div>
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:label id="TabbedPaneTesting_label02" text="Label"/>
                </div>
              </div>
            </div>
        </bttdojo:contentpane>
          <bttdojo:contentpane id="TabbedPaneTesting_ContentPane15" title="closable=true" closable="true">
            <div class="BTTTableStyle">
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:label id="TabbedPaneTesting_label03" text="Label"/>
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
                  <bttdojo:label id="TabbedPaneTesting_label04" text="Label"/>
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
                  <bttdojo:label id="TabbedPaneTesting_label05" text="Label"/>
                </div>
              </div>
            </div>
        </bttdojo:contentpane>
          <bttdojo:contentpane id="TabbedPaneTesting_ContentPane16" title="disabled=true" disabled="true">
            <div class="BTTTableStyle">
            </div>
        </bttdojo:contentpane>
          <bttdojo:contentpane id="TabbedPaneTesting_ContentPane17" title="FillHorizontal=true">
            <div style="width:100%;" class="BTTTableStyle">
            </div>
        </bttdojo:contentpane>
          <bttdojo:contentpane id="TabbedPaneTesting_ContentPane18" title="FillVertical=true">
            <div style="height:100%;" class="BTTTableStyle">
            </div>
        </bttdojo:contentpane>
          <bttdojo:contentpane id="TabbedPaneTesting_ContentPane19" title="layoutSytle=block">
            <div class="BTTTableStyle">
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                </div>
              </div>
            </div>
        </bttdojo:contentpane>
      </bttdojo:tabbedpane>
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