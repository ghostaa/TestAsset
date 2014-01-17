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
<!-- Generated from cellInlineStyleFile.xui by mashuai, on Fri Jan 17 15:16:11 CST 2014 -->
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
  <div id="cellInlineStyleFile_cpnl" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="width:100%;vertical-align:middle;">
        <bttdojo:group id="cellInlineStyleFile_cgrp" text="Cell's border-style">
          <div class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle testBorderStyle1" align="left" style="width:200px;border-top:solid 3px #FF0000;border-right:solid 3px #000000;border-bottom:solid 3px #008000;border-left:solid 3px #FFFF00;vertical-align:middle;">
                <bttdojo:label id="cellInlineStyleFile_label"/>
              </div>
              <div class="BTTCellStyle" align="left" style="width:50px;vertical-align:middle;">
              </div>
              <div class="BTTCellStyle testBorderStyle3" align="left" style="width:200px;border-top:dotted 6px #FF0000;border-right:dotted 6px #000000;border-bottom:dotted 6px #008000;border-left:dotted 6px #FFFF00;vertical-align:middle;">
                <bttdojo:label id="cellInlineStyleFile_label02"/>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="width:200px;height:20px;vertical-align:middle;">
              </div>
              <div class="BTTCellStyle" align="left" style="width:50px;height:20px;vertical-align:middle;">
              </div>
              <div class="BTTCellStyle" align="left" style="width:200px;height:20px;vertical-align:middle;">
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle testBorderStyle2" align="left" style="width:200px;border-top:dashed 3px #FF0000;border-right:dashed 3px #000000;border-bottom:dashed 3px #008000;border-left:dashed 3px #FFFF00;vertical-align:middle;">
                <bttdojo:label id="cellInlineStyleFile_label03"/>
              </div>
              <div class="BTTCellStyle" align="left" style="width:50px;vertical-align:middle;">
              </div>
              <div class="BTTCellStyle testBorderStyle4" align="left" style="width:200px;border-top:double 6px #FF0000;border-right:double 6px #000000;border-bottom:double 3px #008000;border-left:double 6px #FFFF00;vertical-align:middle;">
                <bttdojo:label id="cellInlineStyleFile_label04"/>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="width:200px;height:20px;vertical-align:middle;">
              </div>
              <div class="BTTCellStyle" align="left" style="width:50px;height:20px;vertical-align:middle;">
              </div>
              <div class="BTTCellStyle" align="left" style="width:200px;height:20px;vertical-align:middle;">
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle testBorderStyle5" align="left" style="width:200px;height:50px;border-top:solid 8px #FF0000;border-right:double 6px #000000;border-bottom:dashed 8px #008000;border-left:double 6px #FFFF00;vertical-align:middle;">
                <bttdojo:label id="cellInlineStyleFile_label05"/>
              </div>
              <div class="BTTCellStyle" align="left" style="width:50px;height:50px;vertical-align:middle;">
              </div>
              <div class="BTTCellStyle testBorderStyle6" align="left" style="width:200px;height:50px;border-top:solid 8px #FF0000;border-right:hidden 0px #000000;border-bottom:dashed 8px #008000;vertical-align:middle;">
                <bttdojo:label id="cellInlineStyleFile_label06"/>
              </div>
            </div>
          </div>
      </bttdojo:group>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="width:100%;height:50px;vertical-align:middle;">
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="width:100%;vertical-align:middle;">
        <bttdojo:group id="cellInlineStyleFile_cgrp01" text="Cell's padding-style">
          <div class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle testPaddingStyle1" align="left" style="width:200px;height:50px;border:solid 3px #000000;padding-top:30.0px;vertical-align:top;">
                <bttdojo:label id="cellInlineStyleFile_wetq" text="Label"/>
              </div>
              <div class="BTTCellStyle" align="left" style="width:50px;height:50px;vertical-align:middle;">
              </div>
              <div class="BTTCellStyle testPaddingStyle2" align="left" style="width:200px;height:50px;border:solid 3px #000000;padding-bottom:30.0px;vertical-align:bottom;">
                <bttdojo:label id="cellInlineStyleFile_wetq01_copy" text="Label"/>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="width:200px;vertical-align:middle;">
              </div>
              <div class="BTTCellStyle" align="left" style="width:50px;vertical-align:middle;">
              </div>
              <div class="BTTCellStyle" align="left" style="width:200px;vertical-align:middle;">
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle testPaddingStyle3" align="left" style="width:200px;height:50px;border:solid 3px #000000;padding-left:30.0px;vertical-align:top;">
                <bttdojo:label id="cellInlineStyleFile_wetq01" text="Label"/>
              </div>
              <div class="BTTCellStyle" align="left" style="width:50px;height:50px;vertical-align:middle;">
              </div>
              <div class="BTTCellStyle testPaddingStyle4" align="right" style="width:200px;height:50px;border:solid 3px #000000;padding-right:30.0px;vertical-align:bottom;">
                <bttdojo:label id="cellInlineStyleFile_wetq01_copy01" text="Label"/>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="width:200px;vertical-align:middle;">
              </div>
              <div class="BTTCellStyle" align="left" style="width:50px;vertical-align:middle;">
              </div>
              <div class="BTTCellStyle" align="left" style="width:200px;vertical-align:middle;">
              </div>
            </div>
          </div>
      </bttdojo:group>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="width:100%;height:50px;vertical-align:middle;">
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="width:100%;vertical-align:middle;">
        <bttdojo:group id="cellInlineStyleFile_cgrp02" text="Cell's background-color" width="458px">
          <div style="width:100%;" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle testBackgroundColorStyle1" align="left" style="background-color:#FFFF00;vertical-align:middle;">
                <bttdojo:label id="cellInlineStyleFile_wetq02" text="Label"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
              </div>
              <div class="BTTCellStyle testBackgroundColorStyle2" align="left" style="background-color:#FF0000;vertical-align:middle;">
                <bttdojo:label id="cellInlineStyleFile_wetq04" text="Label"/>
              </div>
            </div>
          </div>
      </bttdojo:group>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="width:100%;height:50px;vertical-align:middle;">
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="width:100%;vertical-align:middle;">
        <bttdojo:group id="cellInlineStyleFile_cgrp03" text="Cell's all-style">
          <div class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle testAllStyle1" align="left" style="width:200px;border-top:solid 6px #FF0000;border-right:dotted 7px #000000;border-bottom:double 6px #008000;border-left:dashed 7px #0000FF;padding-top:30.0px;background-color:#FFFF00;vertical-align:middle;">
                <bttdojo:label id="cellInlineStyleFile_Label01" text="Label"/>
              </div>
              <div class="BTTCellStyle" align="left" style="width:100px;vertical-align:middle;">
              </div>
              <div class="BTTCellStyle" align="left" style="width:200px;vertical-align:middle;">
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="width:200px;vertical-align:middle;">
              </div>
              <div class="BTTCellStyle" align="left" style="width:100px;vertical-align:middle;">
              </div>
              <div class="BTTCellStyle" align="left" style="width:200px;vertical-align:middle;">
              </div>
            </div>
          </div>
      </bttdojo:group>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="width:100%;vertical-align:middle;">
        <bttdojo:a id="cellInlineStyleFile_link" text="return" flowEvent="return"/>
      </div>
    </div>
  </div>

<!-- applet id="printApplet" name="printApplet" code="com.ibm.btt.print.applets.PrintrApplet" codebase="applets" archive="bttprint.jar,JSON4J.jar" style="width:0px; height:0px;"></applet-->
</body>
</html>