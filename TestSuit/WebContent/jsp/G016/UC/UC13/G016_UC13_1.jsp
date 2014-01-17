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
<!-- Generated from G016_UC13_1.xui by mashuai, on  -->
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
@import "css/G016/uc13.css";
@import "css/G016/gift.css";

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
  <table class="layoutCenter" id="G016_UC13_1_panel">
    <tr>
      <td colspan="3" align="left" valign="middle" style="vertical-align:middle;">
          <div class="headArea BTTTableStyle" id="G016_UC13_1_panel01">
          </div>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;" class="listLeft">
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;" class="listCenter">
          <div style="width:812px;height:609px;" id="G016_UC13_1_panel02" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="G016_UC13_1_label" text="UC13_1 - Edge cases (Empty collection case.Every widget's border-width=1px;)"/>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <table style="width:665px;height:545px;" id="G016_UC13_1_panel03">
                    <tr>
                      <td align="left" valign="middle" style="vertical-align:middle;">
                          <div id="G016_UC13_1_panel06" class="BTTTableStyle">
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:image id="G016_UC13_1_image" dataName="Image" tabIndex="-1"/>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="nombre setBorder">                                <bttdojo:label id="G016_UC13_1_label01" text="Test border (list size = 2)"/>
</div>                              </div>
                            </div>
                          </div>
                      </td>
                      <td rowspan="7" align="left" valign="middle" style="vertical-align:middle;" class="testBorder">
                      </td>
                      <td align="left" valign="middle" style="vertical-align:middle;">
                      </td>
                      <td align="left" valign="middle" style="vertical-align:middle;">
                          <div id="G016_UC13_1_panel07" class="BTTTableStyle">
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:image id="G016_UC13_1_image01" dataName="Image" tabIndex="-1"/>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="nombre setBorder">                                <bttdojo:label id="G016_UC13_1_label01_copy" text="Test border (list size = 0)"/>
</div>                              </div>
                            </div>
                          </div>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle" style="vertical-align:middle;">
                          <div id="G016_UC13_1_panel09" class="BTTTableStyle">
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:repetitivepanel id="G016_UC13_1_repetitivePanel" dataNameForList="products01" class="setBorder testBorder">
                                  <div class="BTTTableStyle">
                                    <div class="BTTRowStyle">
                                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                        <bttdojo:label id="G016_UC13_1_label03_${index}" dataName="products01.${index}.G016_UC_productList_Field" text="Label"/>
                                      </div>
                                    </div>
                                  </div>
                              </bttdojo:repetitivepanel>
                              </div>
                            </div>
                          </div>
                      </td>
                      <td align="left" valign="middle" style="vertical-align:middle;">
                      </td>
                      <td align="left" valign="middle" style="vertical-align:middle;">
                          <div id="G016_UC13_1_panel10" class="BTTTableStyle">
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:repetitivepanel id="G016_UC13_1_repetitivePanel_copy" dataNameForList="products02" class="setBorder testBorder">
                                  <div class="BTTTableStyle">
                                    <div class="BTTRowStyle">
                                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                        <bttdojo:label id="G016_UC13_1_label03_copy_${index}" dataName="products02.${index}.G016_UC_productList_Field" text="Label"/>
                                      </div>
                                    </div>
                                  </div>
                              </bttdojo:repetitivepanel>
                              </div>
                            </div>
                          </div>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle" style="vertical-align:middle;">
                          <div id="G016_UC13_1_panel08" class="BTTTableStyle">
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:image id="G016_UC13_1_image_copy" dataName="Image" tabIndex="-1"/>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="nombre setBorder">                                <bttdojo:label id="G016_UC13_1_label02" text="Test margin (list size = 2)"/>
</div>                              </div>
                            </div>
                          </div>
                      </td>
                      <td align="left" valign="middle" style="vertical-align:middle;">
                      </td>
                      <td align="left" valign="middle" style="vertical-align:middle;">
                          <div id="G016_UC13_1_panel08_copy" class="BTTTableStyle">
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:image id="G016_UC13_1_image_copy_copy" dataName="Image" tabIndex="-1"/>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="nombre setBorder">                                <bttdojo:label id="G016_UC13_1_label02_copy" text="Test margin (list size = 0)"/>
</div>                              </div>
                            </div>
                          </div>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle" style="vertical-align:middle;">
                          <div id="G016_UC13_1_panel04" class="BTTTableStyle">
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="setBorder">                                <bttdojo:label id="G016_UC13_1_label07" text="top 50px"/>
</div>                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                              </div>
                            </div>
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="setBorder">                                <bttdojo:label id="G016_UC13_1_label06" text="left 50px"/>
</div>                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:repetitivepanel id="G016_UC13_1_repetitivePanel01" dataNameForList="products01" class="setBorder testMargin">
                                  <div class="BTTTableStyle">
                                    <div class="BTTRowStyle">
                                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="setBorder">                                        <bttdojo:label id="G016_UC13_1_label04_${index}" dataName="products01.${index}.G016_UC_productList_Field" text="Label"/>
</div>                                      </div>
                                    </div>
                                  </div>
                              </bttdojo:repetitivepanel>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="setBorder">                                <bttdojo:label id="G016_UC13_1_label08" text="right 50px"/>
</div>                              </div>
                            </div>
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="setBorder">                                <bttdojo:label id="G016_UC13_1_label05" text="bottom 50px"/>
</div>                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                              </div>
                            </div>
                          </div>
                      </td>
                      <td align="left" valign="middle" style="vertical-align:middle;">
                      </td>
                      <td align="left" valign="middle" style="vertical-align:middle;">
                          <div id="G016_UC13_1_panel04_copy" class="BTTTableStyle">
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="setBorder">                                <bttdojo:label id="G016_UC13_1_label07_copy" text="top 50px"/>
</div>                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                              </div>
                            </div>
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="setBorder">                                <bttdojo:label id="G016_UC13_1_label06_copy" text="left 50px"/>
</div>                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:repetitivepanel id="G016_UC13_1_repetitivePanel01_copy" dataNameForList="products02" class="setBorder testMargin">
                                  <div class="BTTTableStyle">
                                    <div class="BTTRowStyle">
                                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="setBorder">                                        <bttdojo:label id="G016_UC13_1_label04_copy_${index}" dataName="products02.${index}.G016_UC_productList_Field" text="Label"/>
</div>                                      </div>
                                    </div>
                                  </div>
                              </bttdojo:repetitivepanel>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="setBorder">                                <bttdojo:label id="G016_UC13_1_label08_copy" text="right 50px"/>
</div>                              </div>
                            </div>
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="setBorder">                                <bttdojo:label id="G016_UC13_1_label05_copy" text="bottom 50px"/>
</div>                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                              </div>
                            </div>
                          </div>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle" style="vertical-align:middle;">
                          <div id="G016_UC13_1_panel08_copy01" class="BTTTableStyle">
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:image id="G016_UC13_1_image_copy_copy01" dataName="Image" tabIndex="-1"/>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="nombre setBorder">                                <bttdojo:label id="G016_UC13_1_label02_copy01" text="Test Padding(list size = 2)"/>
</div>                              </div>
                            </div>
                          </div>
                      </td>
                      <td align="left" valign="middle" style="vertical-align:middle;">
                      </td>
                      <td align="left" valign="middle" style="vertical-align:middle;">
                          <div id="G016_UC13_1_panel08_copy02" class="BTTTableStyle">
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:image id="G016_UC13_1_image_copy_copy02" dataName="Image" tabIndex="-1"/>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="nombre setBorder">                                <bttdojo:label id="G016_UC13_1_label02_copy02" text="Test Padding(list size =0 )"/>
</div>                              </div>
                            </div>
                          </div>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle" style="vertical-align:middle;">
                          <div id="G016_UC13_1_panel05" class="BTTTableStyle">
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="setBorder">                                <bttdojo:label id="G016_UC13_1_label10" text="top 50px"/>
</div>                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                              </div>
                            </div>
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="setBorder">                                <bttdojo:label id="G016_UC13_1_label11" text="left 50px"/>
</div>                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:repetitivepanel id="G016_UC13_1_repetitivePanel02" dataNameForList="products01" class="setBorder testPadding">
                                  <div class="BTTTableStyle">
                                    <div class="BTTRowStyle">
                                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="setBorder">                                        <bttdojo:label id="G016_UC13_1_label09_${index}" dataName="products01.${index}.G016_UC_productList_Field" text="Label"/>
</div>                                      </div>
                                    </div>
                                  </div>
                              </bttdojo:repetitivepanel>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="setBorder">                                <bttdojo:label id="G016_UC13_1_label13" text="right 50px"/>
</div>                              </div>
                            </div>
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="setBorder">                                <bttdojo:label id="G016_UC13_1_label12" text="botton 50px"/>
</div>                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                              </div>
                            </div>
                          </div>
                      </td>
                      <td align="left" valign="middle" style="vertical-align:middle;">
                      </td>
                      <td align="left" valign="middle" style="vertical-align:middle;">
                          <div id="G016_UC13_1_panel05_copy" class="BTTTableStyle">
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="setBorder">                                <bttdojo:label id="G016_UC13_1_label10_copy" text="top 50px"/>
</div>                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                              </div>
                            </div>
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="setBorder">                                <bttdojo:label id="G016_UC13_1_label11_copy" text="left 50px"/>
</div>                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:repetitivepanel id="G016_UC13_1_repetitivePanel02_copy" dataNameForList="products02" class="setBorder testPadding">
                                  <div class="BTTTableStyle">
                                    <div class="BTTRowStyle">
                                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="setBorder">                                        <bttdojo:label id="G016_UC13_1_label09_copy_${index}" dataName="products02.${index}.G016_UC_productList_Field" text="Label"/>
</div>                                      </div>
                                    </div>
                                  </div>
                              </bttdojo:repetitivepanel>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="setBorder">                                <bttdojo:label id="G016_UC13_1_label13_copy" text="right 50px"/>
</div>                              </div>
                            </div>
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="setBorder">                                <bttdojo:label id="G016_UC13_1_label12_copy" text="botton 50px"/>
</div>                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                              </div>
                            </div>
                          </div>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle" style="vertical-align:middle;">
                      </td>
                      <td align="left" valign="middle" style="vertical-align:middle;">
                      </td>
                      <td align="left" valign="middle" style="vertical-align:middle;">
                      </td>
                    </tr>
                  </table>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
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