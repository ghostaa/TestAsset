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
<!-- Generated from mybank_index.xui by mashuai, on Fri Jan 17 15:18:05 CST 2014 -->
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

@import "css/mybank/mybankMain.css";

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
<div style="width:100%;height:100%;;padding:0.0px;" id="mybank_index_dijit_layout_BorderContainer" data-dojo-type="dijit.layout.BorderContainer">
  <div class="mainFrameTop" id="mybank_index_dijit_layout_BorderContainer_topPanel" data-dojo-props="region:'top',ioArgs:{content:{dse_sessionId:'${dse_sessionId}'}}" style="text-align:left;;border:none 0px #000000;padding:0.0px;" data-dojo-type="dijit.layout.ContentPane">
    <div style="width:100%;" class="BTTTableStyle">
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="left" style="height:168px;vertical-align:middle;">
            <div style="width:100%;height:100%;" id="mybank_index_panel06" class="BTTTableStyle">
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="center" style="vertical-align:middle;">
                    <div style="width:1024px;" id="mybank_index_panel07" class="BTTTableStyle">
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="padding-top:20.0px;vertical-align:top;">
                            <table style="width:100%;" id="mybank_index_panel08">
                              <tr>
                                <td align="left" valign="middle" style="vertical-align:middle;">
                                  <bttdojo:label id="mybank_index_label" class="titleMain" text="Welcom Back, Carlos"/>
                                </td>
                                <td rowspan="2" align="right" valign="bottom" style="vertical-align:bottom;">
                                  <bttdojo:textbox id="mybank_index_text"/>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle" style="vertical-align:middle;">
                                  <bttdojo:label id="mybank_index_label04" class="subtitle" text="Platinum Relationship - Member since 2007"/>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle" style="height:20px;vertical-align:middle;">
                                </td>
                                <td align="left" valign="middle" style="height:20px;vertical-align:middle;">
                                </td>
                              </tr>
                            </table>
                        </div>
                      </div>
                    </div>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle splitter" align="center" style="height:70px;vertical-align:top;">
                    <div style="width:1024px;" id="mybank_index_panel09" class="BTTTableStyle">
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="width:100px;vertical-align:bottom;">
                          <bttdojo:a id="mybank_index_link13" class="menuItem" text="Dashboard" action="#"/>
                        </div>
                        <div class="BTTCellStyle" align="center" style="width:100px;vertical-align:bottom;">
                          <bttdojo:a id="mybank_index_link10" class="menuItem" text="Transactions" action="#"/>
                        </div>
                        <div class="BTTCellStyle" align="center" style="width:100px;vertical-align:bottom;">
                          <bttdojo:a id="mybank_index_link09" class="menuItem" text="Goals" action="#"/>
                        </div>
                        <div class="BTTCellStyle" align="center" style="width:100px;vertical-align:bottom;">
                          <bttdojo:a id="mybank_index_link11" class="menuItem" text="Advice" action="#"/>
                        </div>
                        <div class="BTTCellStyle" align="center" style="width:100px;vertical-align:bottom;">
                          <bttdojo:a id="mybank_index_link12" class="menuItem" text="Network" action="#"/>
                        </div>
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        </div>
                        <div class="BTTCellStyle" align="right" style="vertical-align:bottom;">
                            <div id="mybank_index_panel10" class="BTTTableStyle">
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:bottom;">
                                  <bttdojo:label id="mybank_index_label10" text="Contact Us"/>
                                </div>
                                <div class="BTTCellStyle" align="left" style="vertical-align:bottom;">
                                  <bttdojo:image id="mybank_index_image04" location="img/mybank/setting.png" tabIndex="-1"/>
                                </div>
                              </div>
                            </div>
                        </div>
                      </div>
                    </div>
                </div>
              </div>
            </div>
        </div>
      </div>
    </div>
</div>
  <div id="mybank_index_dijit_layout_BorderContainer_centerPanel" data-dojo-props="errorMessage:'&lt;span class=\'dijitContentPaneError\'&gt;' + 'test\' \\error message\\' + '&lt;/span&gt;',loadingMessage:'&lt;span class=\'dijitContentPaneLoading\'&gt;' + I18nUtil.getI18nString('%nls.bttsample/Final_Page_Flow') + '&lt;/span&gt;',region:'center',ioMethod:dojo.xhrPost,ioArgs:{content:{dse_sessionId:'${dse_sessionId}'},timeout:3000}" style="text-align:left;;border:none 0px #000000;padding:0.0px;" data-dojo-type="dijit.layout.ContentPane">
    <div style="width:100%;height:100%;" class="BTTTableStyle">
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="center" style="height:100%;vertical-align:top;">
          <div style="width:1024px;height:100%;;padding:0.0px;" id="mybank_index_borderContainer" data-dojo-type="dijit.layout.BorderContainer">
            <div id="mybank_index_borderContainer_leftPanel" data-dojo-props="region:'left',ioArgs:{content:{dse_sessionId:'${dse_sessionId}'}}" style="text-align:left;width:150px;;border:none 0px #000000;" data-dojo-type="dijit.layout.ContentPane">
                <div id="mybank_index_panel" class="BTTTableStyle">
                  <div class="BTTRowStyle">
                    <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      <bttdojo:a id="mybank_index_link14" class="menuItem" text="Loan Offer" action="#"/>
                    </div>
                  </div>
                </div>
            </div>
            <div id="mybank_index_centerPanel" data-dojo-props="region:'center',ioMethod:dojo.xhrPost,ioArgs:{content:{dse_sessionId:'${dse_sessionId}'}}" style="text-align:left;;border:none 0px #000000;" data-dojo-type="dijit.layout.ContentPane">
            </div>
          </div>
        </div>
      </div>
    </div>
</div>
  <div class="mainFrameBottom" id="mybank_index_dijit_layout_BorderContainer_bottomPanel" data-dojo-props="region:'bottom',ioArgs:{content:{dse_sessionId:'${dse_sessionId}'}}" style="text-align:left;height:190px;;border:none 0px #000000;padding:0.0px;" data-dojo-type="dijit.layout.ContentPane">
    <div style="width:100%;height:190px;" class="BTTTableStyle">
      <div class="BTTRowStyle">
        <div class="BTTCellStyle" align="center" style="height:190px;vertical-align:middle;">
            <div style="width:1024px;height:100%;" id="mybank_index_panel01" class="BTTTableStyle">
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="height:100%;vertical-align:middle;">
                    <div style="width:679px;height:100%;" id="mybank_index_panel01_copy" class="BTTTableStyle">
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="padding-top:20.0px;vertical-align:top;">
                            <div style="width:386px;" id="mybank_index_panel02" class="BTTTableStyle">
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:a id="mybank_index_link" class="linkStyle" text="ATM / BRANCH LOCATOR" action="#"/>
                                </div>
                                <div class="BTTCellStyle" align="left" style="width:78px;vertical-align:middle;">
                                </div>
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:a id="mybank_index_link04" class="linkStyle" text="MORTGAGES" action="#"/>
                                </div>
                              </div>
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:a id="mybank_index_link01" class="linkStyle" text="LET US CALL YOU" action="#"/>
                                </div>
                                <div class="BTTCellStyle" align="left" style="width:78px;vertical-align:middle;">
                                </div>
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:a id="mybank_index_link05" class="linkStyle" text="CREDIT CARDS" action="#"/>
                                </div>
                              </div>
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:a id="mybank_index_link02" class="linkStyle" text="SCHEDULE A BRANCH VISIT" action="#"/>
                                </div>
                                <div class="BTTCellStyle" align="left" style="width:78px;vertical-align:middle;">
                                </div>
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:a id="mybank_index_link06" class="linkStyle" text="PRODUCT NAME" action="#"/>
                                </div>
                              </div>
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                </div>
                                <div class="BTTCellStyle" align="left" style="width:78px;vertical-align:middle;">
                                </div>
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:a id="mybank_index_link07" class="linkStyle" text="OTHER PRODUCTS" action="#"/>
                                </div>
                              </div>
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:a id="mybank_index_link03" class="linkStyle" text="CONNECT WITH US" action="#"/>
                                </div>
                                <div class="BTTCellStyle" align="left" style="width:78px;vertical-align:middle;">
                                </div>
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <bttdojo:a id="mybank_index_link08" class="linkStyle" text="ADD A SERVICE" action="#"/>
                                </div>
                              </div>
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                    <div style="width:150px;height:30px;" id="mybank_index_panel03" class="BTTTableStyle">
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:image id="mybank_index_image" location="img/mybank/fb.png" tabIndex="-1"/>
                                        </div>
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:image id="mybank_index_image01" location="img/mybank/tt.png" tabIndex="-1"/>
                                        </div>
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:image id="mybank_index_image02" location="img/mybank/in.png" tabIndex="-1"/>
                                        </div>
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:image id="mybank_index_image03" location="img/mybank/at.png" tabIndex="-1"/>
                                        </div>
                                      </div>
                                    </div>
                                </div>
                                <div class="BTTCellStyle" align="left" style="width:78px;vertical-align:middle;">
                                </div>
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                </div>
                              </div>
                            </div>
                        </div>
                        <div class="BTTCellStyle" align="left" style="width:220px;height:100%;vertical-align:middle;">
                          <div class="bottomPanel" id="mybank_index_bottomContentPane" data-dojo-props="href:'jsp/mybank/bottom_others.jsp',ioArgs:{content:{dse_sessionId:'${dse_sessionId}'}}" style="text-align:left;height:100%;" data-dojo-type="dijit.layout.ContentPane">
                        </div>
                        </div>
                      </div>
                    </div>
                </div>
              </div>
            </div>
        </div>
      </div>
    </div>
</div>
</div>

<div url="jsp/mybank/mybank_index.js" prefix="" dojoType="com.ibm.btt.event.ECALoader"></div>
<!-- applet id="printApplet" name="printApplet" code="com.ibm.btt.print.applets.PrintrApplet" codebase="applets" archive="bttprint.jar,JSON4J.jar" style="width:0px; height:0px;"></applet-->
</body>
</html>