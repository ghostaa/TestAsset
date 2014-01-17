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
<!-- Generated from IBK_4_11_mutiWidget_formatter.xui by mashuai, on Fri Jan 17 13:40:19 CST 2014 -->
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
<script type="text/javascript" data-btt-eca="true" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/IBK_4_11_mutiWidget/IBK_4_11_mutiWidget_formatter.js"> </script>
<%request.setAttribute("dse_sessionId", session.getId()); %>
  <div id="IBK_4_11_mutiWidget_formatter_panel" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <div id="IBK_4_11_mutiWidget_formatter_panel01" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="IBK_4_11_mutiWidget_formatter_label" text="IBK33658"/>
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
          <div id="IBK_4_11_mutiWidget_formatter_panel03" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:form id="IBK_4_11_mutiWidget_formatter_form" errorPage="IBK_4_11_mutiWidget/IBK_4_11_mutiWidget_formatter.jsp">
                  <div class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <div id="IBK_4_11_mutiWidget_formatter_panel04" class="BTTTableStyle">
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:label id="IBK_4_11_mutiWidget_formatter_label03" text="test validation(Must input number)"/>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:textbox id="IBK_4_11_mutiWidget_formatter_text" dataName="testValidation" type="Number"/>
                              </div>
                            </div>
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:label id="IBK_4_11_mutiWidget_formatter_label01" text="LabelOne"/>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:textbox id="IBK_4_11_mutiWidget_formatter_text01"/>
                              </div>
                            </div>
                          </div>
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:table id="IBK_4_11_mutiWidget_formatter_table" dataName="singleResult" dataNameForList="TestMutiWidgetList" isPageable="false">
                          <bttdojo:column level="1" rowSpan="1" align="left" width="30" colSpan="1" hidden="false" headerHAlign="left" text="A" dataName="Field1" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
                          <bttdojo:column level="1" rowSpan="1" align="left" width="30" colSpan="1" hidden="false" headerHAlign="left" text="B" dataName="Field2" noresize="false" repeat="true" id="columnId1" headerVAlign="left"/>
                          <bttdojo:column level="1" rowSpan="1" align="left" width="30" colSpan="1" hidden="false" headerHAlign="left" text="C" dataName="Field3" noresize="false" repeat="true" id="columnId2" headerVAlign="left"/>
                          <bttdojo:column level="1" rowSpan="1" align="left" width="10" colSpan="1" hidden="false" headerHAlign="left" text="D" dataName="flag" noresize="false" repeat="true" id="columnId4" headerVAlign="left"/>
                          <bttdojo:column level="1" rowSpan="1" widget="Content" align="left" width="320" colSpan="1" hidden="false" headerHAlign="left" formatter="function(data, rowIndex, grid) {
console.log('column data:' + data); 

addEvent(rowIndex, 'button1', 'onClick', function(index, widgetId, widget, rowWidgets) {
 for(var i = 0; i < rowWidgets.length; i ++ ) {
  if(rowWidgets[i].cellWidgetId == 'button2') {
   if(rowWidgets[i].get('visibility') == 'visible') {
    rowWidgets[i].set('visibility', 'gone');
    setState(index, 'button2', 'visibility', 'gone');
   } else if(rowWidgets[i].get('visibility') == 'gone') {
    rowWidgets[i].set('visibility', 'visible');
    setState(index, 'button2', 'visibility', 'visible');
   }
  }
 }
});

addStateInit(rowIndex, 'button2', function(index, widgetId, widget, widgets, state) {
 if(state['visibility']) {
  widget.set('visibility', state['visibility']);
 }
});

addEvent(rowIndex, 'button2', 'onClick', function(index, widgetId, widget, rowWidgets) {
 for(var i = 0; i < rowWidgets.length; i ++ ) {
  if(rowWidgets[i].cellWidgetId == 'button1') {
   console.log(rowWidgets[i].get('disabled'));
   if(rowWidgets[i].get('disabled') == true) {
    rowWidgets[i].set('disabled', false);
    setState(index, 'button1', 'disabled', false);
   } else if(rowWidgets[i].get('disabled') == false) {
    rowWidgets[i].set('disabled', true);
    setState(index, 'button1', 'disabled', true);
   }
  }
 }
});

addStateInit(rowIndex, 'button1', function(index, widgetId, widget, widgets, state) {
 if(state['disabled']) {
  widget.set('disabled', state['disabled']);
 }
});

addEvent(rowIndex, 'button3', 'onClick', function(index, widgetId, widget, rowWidgets) {
 for(var i = 0; i < rowWidgets.length; i ++ ) {
  if(rowWidgets[i].cellWidgetId == 'link1') {
   if(rowWidgets[i].get('visibility') == 'visible') {
    rowWidgets[i].set('visibility', 'gone');
    setState(index, 'link1', 'visibility', 'gone');
   } else if(rowWidgets[i].get('visibility') == 'gone') {
    rowWidgets[i].set('visibility', 'visible');
    setState(index, 'link1', 'visibility', 'visible');
   }
  }
 }
});

addStateInit(rowIndex, 'link1', function(index, widgetId, widget, widgets, state) {
 if(state['visibility']) {
  widget.set('visibility', state['visibility']);
 }
});


var flagValue = parseInt(grid.store.getValue(grid.getItem(rowIndex), 'flag'));
console.log(flagValue);
if(flagValue % 4 == 0) {
return 
'<div cellWidgetId=\\\"button1\\\" type=\\\"button\\\" dojoType=\\\"com.ibm.btt.dijit.Button\\\" style=\\\"margin:0px;\\\" text=\\\"visibility\\\"></div>' +
'<div cellWidgetId=\\\"button2\\\" type=\\\"button\\\" dojoType=\\\"com.ibm.btt.dijit.Button\\\" style=\\\"margin:0px;\\\" text=\\\"disabled\\\" ></div>' +
'<div cellWidgetId=\\\"button3\\\" type=\\\"button\\\" dojoType=\\\"com.ibm.btt.dijit.Button\\\" style=\\\"margin:0px;\\\" text=\\\"hidden \\'visibility\\' link\\\" ></div>' +
'<div cellWidgetId=\\\"button4\\\" type=\\\"button\\\" dojoType=\\\"com.ibm.btt.dijit.Button\\\" style=\\\"margin:0px;\\\" text=\\\"hidden LabelOne\\\" ></div>';

}
else if (flagValue % 4 == 1){
return  

'<div cellWidgetId=\\\"submitButton1\\\" type=\\\"submit\\\" dojoType=\\\"com.ibm.btt.dijit.Button\\\" style=\\\"margin:0px;\\\" text=\\\"changeEvt\\\" bttParams=\\\"' + getBTTParamsStr({'type':'submit','flowEvent':'next' })  +'\\\"></div>' +
'<div cellWidgetId=\\\"submitButton2\\\" type=\\\"submit\\\" dojoType=\\\"com.ibm.btt.dijit.Button\\\" style=\\\"margin:0px;\\\" text=\\\"new flow\\\" bttParams=\\\"' + getBTTParamsStr({'type':'submit','flowId':'IBK_4_11_mutiWidget_newFlow' })  +'\\\"></div>' +
'<div cellWidgetId=\\\"submitButton3\\\" type=\\\"submit\\\" dojoType=\\\"com.ibm.btt.dijit.Button\\\" style=\\\"margin:0px;\\\" text=\\\"new operation\\\" bttParams=\\\"' + getBTTParamsStr({'type':'submit','operationId':'IBK_4_11_MutiWidgetNewOp' })  +'\\\"></div>' +
'submit ';
} else if (flagValue % 4 == 2){
return  

'<div cellWidgetId=\\\"saveButton1\\\" type=\\\"save\\\" dojoType=\\\"com.ibm.btt.dijit.Button\\\" style=\\\"margin:0px;\\\" text=\\\"changeEvt\\\" bttParams=\\\"' + getBTTParamsStr({'type':'save','flowEvent':'next' })  +'\\\"></div>' +
'<div cellWidgetId=\\\"saveButton2\\\" type=\\\"save\\\" dojoType=\\\"com.ibm.btt.dijit.Button\\\" style=\\\"margin:0px;\\\" text=\\\"new flow\\\" bttParams=\\\"' + getBTTParamsStr({'type':'save','flowId':'IBK_4_11_mutiWidget_newFlow' })  +'\\\"></div>' +
'<div cellWidgetId=\\\"saveButton3\\\" type=\\\"save\\\" dojoType=\\\"com.ibm.btt.dijit.Button\\\" style=\\\"margin:0px;\\\" text=\\\"new operation\\\" bttParams=\\\"' + getBTTParamsStr({'type':'save','operationId':'IBK_4_11_MutiWidgetNewOp' })  +'\\\"></div>' +
'submit without validation ';
}else if (flagValue % 4 == 3){
return  

'<div cellWidgetId=\\\"cancelButton1\\\" type=\\\"cancel\\\" dojoType=\\\"com.ibm.btt.dijit.Button\\\" style=\\\"margin:0px;\\\" text=\\\"changeEvt\\\" bttParams=\\\"' + getBTTParamsStr({'type':'submit','flowEvent':'next' })  +'\\\"></div>' +
'<div cellWidgetId=\\\"cancelButton2\\\" type=\\\"cancel\\\" dojoType=\\\"com.ibm.btt.dijit.Button\\\" style=\\\"margin:0px;\\\" text=\\\"new flow\\\" bttParams=\\\"' + getBTTParamsStr({'type':'submit','flowId':'IBK_4_11_mutiWidget_newFlow' })  +'\\\"></div>' +
'<div cellWidgetId=\\\"cancelButton3\\\" type=\\\"cancel\\\" dojoType=\\\"com.ibm.btt.dijit.Button\\\" style=\\\"margin:0px;\\\" text=\\\"new operation\\\" bttParams=\\\"' + getBTTParamsStr({'type':'submit','operationId':'IBK_4_11_MutiWidgetNewOp' })  +'\\\"></div>' +
'submit no data ' ;
}    
}" text="ButtonFormatter" canSort="false" noresize="false" repeat="true" id="columnId3" headerVAlign="left"/>
                          <bttdojo:column level="1" rowSpan="1" widget="Content" align="left" width="300" colSpan="1" hidden="false" headerHAlign="left" formatter="function(data, rowIndex, grid) {
console.log('column data:' + data); 

addEvent(rowIndex, 'link1', 'onClick', function(index, widgetId, widget, rowWidgets) {
 for(var i = 0; i < rowWidgets.length; i ++ ) {
  if(rowWidgets[i].cellWidgetId == 'link2') {
   if(rowWidgets[i].get('visibility') == 'visible') {
    rowWidgets[i].set('visibility', 'gone');
    setState(index, 'link2', 'visibility', 'gone');
   } else if(rowWidgets[i].get('visibility') == 'gone') {
    rowWidgets[i].set('visibility', 'visible');
    setState(index, 'link2', 'visibility', 'visible');
   }
  }
 }
});

addStateInit(rowIndex, 'link2', function(index, widgetId, widget, widgets, state) {
 if(state['visibility']) {
  widget.set('visibility', state['visibility']);
 }
});

addEvent(rowIndex, 'link2', 'onClick', function(index, widgetId, widget, rowWidgets) {
 for(var i = 0; i < rowWidgets.length; i ++ ) {
  if(rowWidgets[i].cellWidgetId == 'link1') {
   console.log(rowWidgets[i].get('disabled'));
   if(rowWidgets[i].get('disabled') == true) {
    rowWidgets[i].set('disabled', false);
    setState(index, 'link1', 'disabled', false);
   } else if(rowWidgets[i].get('disabled') == false) {
    rowWidgets[i].set('disabled', true);
    setState(index, 'link1', 'disabled', true);
   }
  }
 }
});

addStateInit(rowIndex, 'link1', function(index, widgetId, widget, widgets, state) {
 if(state['disabled']) {
  widget.set('disabled', state['disabled']);
 }
});


addEvent(rowIndex, 'link3', 'onClick', function(index, widgetId, widget, rowWidgets) {
 for(var i = 0; i < rowWidgets.length; i ++ ) {
  if(rowWidgets[i].cellWidgetId == 'button1') {
   if(rowWidgets[i].get('visibility') == 'visible') {
    rowWidgets[i].set('visibility', 'gone');
    setState(index, 'button1', 'visibility', 'gone');
   } else if(rowWidgets[i].get('visibility') == 'gone') {
    rowWidgets[i].set('visibility', 'visible');
    setState(index, 'button1', 'visibility', 'visible');
   }
  }
 }
});

addStateInit(rowIndex, 'button1', function(index, widgetId, widget, widgets, state) {
 if(state['visibility']) {
  widget.set('visibility', state['visibility']);
 }
});

var flag = parseInt(grid.store.getValue(grid.getItem(rowIndex), 'flag'));
console.log(flag);
var flagValue=flag % 3;
if(flagValue == 0) {
return 
'<a cellWidgetId=\\\"link1\\\" height=\\\"13px\\\" dojoType=\\\"com.ibm.btt.dijit.Anchor\\\"  action=\\\"#\\\" text=\\\"visibility\\\"></a>  | ' +
'<a cellWidgetId=\\\"link2\\\" height=\\\"13px\\\" dojoType=\\\"com.ibm.btt.dijit.Anchor\\\"  action=\\\"#\\\" text=\\\"disabled\\\"></a>  | ' +
'<a cellWidgetId=\\\"link3\\\" height=\\\"13px\\\" dojoType=\\\"com.ibm.btt.dijit.Anchor\\\"  action=\\\"#\\\" text=\\\"hidden \\'visibility\\' button\\\"></a> | ' +
'<a cellWidgetId=\\\"link4\\\" height=\\\"13px\\\" dojoType=\\\"com.ibm.btt.dijit.Anchor\\\"  action=\\\"#\\\" text=\\\"hidden Text widget\\\"></a>';

}
else if (flagValue  == 1){
return  
'<a cellWidgetId=\\\"submitLink1\\\"  dojoType=\\\"com.ibm.btt.dijit.Anchor\\\" bttParams=\\\"' + getBTTParamsStr({'type':'linkin','flowEvent':'next' })  + '\\\" action=\\\"Request\\\" text=\\\"change flow Evt\\\"></a> | ' + 
'<a cellWidgetId=\\\"submitLink2\\\" dojoType=\\\"com.ibm.btt.dijit.Anchor\\\" bttParams=\\\"' + getBTTParamsStr({'type':'linkin','flowId':'IBK_4_11_mutiWidget_newFlow' })  + '\\\" action=\\\"Request\\\" text=\\\"new flow\\\"></a> | ' + 
'<a cellWidgetId=\\\"submitLink3\\\" dojoType=\\\"com.ibm.btt.dijit.Anchor\\\" bttParams=\\\"' + getBTTParamsStr({'type':'linkin','operationId':'IBK_4_11_MutiWidgetNewOp' })  + '\\\" action=\\\"Request\\\" text=\\\"new operation\\\"></a>';
} else if (flagValue  == 2){
return  
'<a cellWidgetId=\\\"URL1\\\"  dojoType=\\\"com.ibm.btt.dijit.Anchor\\\"  action=\\\"http://www.baidu.com\\\" text=\\\"Open url to new window\\\" target=\\\"_blank\\\" ></a> | ' + 
'<a cellWidgetId=\\\"URL2\\\"  dojoType=\\\"com.ibm.btt.dijit.Anchor\\\"  action=\\\"http://www.baidu.com\\\" text=\\\"Open url to self\\\" target=\\\"_self\\\" ></a>';

} 
}" text="LinkFormatter" canSort="false" noresize="false" repeat="true" id="columnId5" headerVAlign="left"/>
                          <bttdojo:column level="1" rowSpan="1" widget="Content" align="left" width="240" colSpan="1" hidden="false" headerHAlign="left" formatter="function(data, rowIndex, grid) {

addEvent(rowIndex, 'mixLink2', 'onClick', function(index, widgetId, widget, rowWidgets) {
 for(var i = 0; i < rowWidgets.length; i ++ ) {
  if(rowWidgets[i].cellWidgetId == 'mixButton3') {
   if(rowWidgets[i].get('visibility') == 'visible') {
    rowWidgets[i].set('visibility', 'gone');
    setState(index, 'mixButton3', 'visibility', 'gone');
   } else if(rowWidgets[i].get('visibility') == 'gone') {
    rowWidgets[i].set('visibility', 'visible');
    setState(index, 'mixButton3', 'visibility', 'visible');
   }
  }
 }
});

addStateInit(rowIndex, 'mixButton3', function(index, widgetId, widget, widgets, state) {
 if(state['visibility']) {
  widget.set('visibility', state['visibility']);
 }
});

addEvent(rowIndex, 'mixButton5', 'onClick', function(index, widgetId, widget, rowWidgets) {
 for(var i = 0; i < rowWidgets.length; i ++ ) {
  if(rowWidgets[i].cellWidgetId == 'mixButton6') {
   if(rowWidgets[i].get('visibility') == 'visible') {
    rowWidgets[i].set('visibility', 'gone');
    setState(index, 'mixButton6', 'visibility', 'gone');
   } else if(rowWidgets[i].get('visibility') == 'gone') {
    rowWidgets[i].set('visibility', 'visible');
    setState(index, 'mixButton6', 'visibility', 'visible');
   }
  }
 }
});

addStateInit(rowIndex, 'mixButton6', function(index, widgetId, widget, widgets, state) {
 if(state['visibility']) {
  widget.set('visibility', state['visibility']);
 }
});



var flag = parseInt(grid.store.getValue(grid.getItem(rowIndex), 'flag'));
var flagValue = flag % 4;
if(flagValue == 0) {
return 
'<div cellWidgetId=\\\"mixButton1\\\" type=\\\"submit\\\" dojoType=\\\"com.ibm.btt.dijit.Button\\\" style=\\\"margin:0px;\\\" text=\\\"new flow\\\" bttParams=\\\"' + getBTTParamsStr({'type':'submit','flowId':'IBK_4_11_mutiWidget_newFlow' })  +'\\\"></div>' +
'<a cellWidgetId=\\\"mixLink1\\\" height=\\\"13px\\\" dojoType=\\\"com.ibm.btt.dijit.Anchor\\\"  action=\\\"Request\\\" text=\\\"changeEvt\\\" bttParams=\\\"' + getBTTParamsStr({'type':'linkin','flowEvent':'next' })  + '\\\"></a> ' +
'<div cellWidgetId=\\\"mixButton2\\\" type=\\\"submit\\\" dojoType=\\\"com.ibm.btt.dijit.Button\\\" style=\\\"margin:0px;\\\" text=\\\"new operation\\\" bttParams=\\\"' + getBTTParamsStr({'type':'submit','operationId':'IBK_4_11_MutiWidgetNewOp' })  +'\\\"></div>';
}
else if (flagValue == 1){
return  
'<a cellWidgetId=\\\"mixLink2\\\" height=\\\"13px\\\" dojoType=\\\"com.ibm.btt.dijit.Anchor\\\"  action=\\\"#\\\" text=\\\"gone reight widget\\\"></a>  ' +
'<div cellWidgetId=\\\"mixButton3\\\" type=\\\"submit\\\" dojoType=\\\"com.ibm.btt.dijit.Button\\\" style=\\\"margin:0px;\\\" text=\\\"changeEvt\\\" bttParams=\\\"' + getBTTParamsStr({'type':'submit','flowEvent':'next' })  +'\\\"></div>' +
'<div cellWidgetId=\\\"mixButton4\\\" type=\\\"submit\\\" dojoType=\\\"com.ibm.btt.dijit.Button\\\" style=\\\"margin:0px;\\\" text=\\\"new operation\\\" bttParams=\\\"' + getBTTParamsStr({'type':'submit','operationId':'IBK_4_11_MutiWidgetNewOp' })  +'\\\"></div>';
} else if (flagValue == 2){
return  

'<div cellWidgetId=\\\"mixButton5\\\" type=\\\"button\\\" dojoType=\\\"com.ibm.btt.dijit.Button\\\" style=\\\"margin:0px;\\\" text=\\\"gone right widget\\\"></div>' +
'<div cellWidgetId=\\\"mixButton6\\\" type=\\\"submit\\\" dojoType=\\\"com.ibm.btt.dijit.Button\\\" style=\\\"margin:0px;\\\" text=\\\"new flow\\\" bttParams=\\\"' + getBTTParamsStr({'type':'submit','flowId':'IBK_4_11_mutiWidget_newFlow' })  +'\\\"></div>'  +
'<a cellWidgetId=\\\"mixLink3\\\" height=\\\"13px\\\" dojoType=\\\"com.ibm.btt.dijit.Anchor\\\"  action=\\\"http://wwww.baidu.com\\\" target=\\\"_blank\\\" text=\\\"Url to new window\\\"></a>  ' ;
}else if (flagValue == 3){
return  
'<a cellWidgetId=\\\"mixLink4\\\" height=\\\"13px\\\" dojoType=\\\"com.ibm.btt.dijit.Anchor\\\" bttParams=\\\"' + getBTTParamsStr({'type':'linkin','flowId':'IBK_4_11_mutiWidget_newFlow' })  +'\\\" text=\\\"new flow\\\"></a>  ' +
'<div cellWidgetId=\\\"mixButton7\\\" type=\\\"submit\\\" dojoType=\\\"com.ibm.btt.dijit.Button\\\" style=\\\"margin:0px;\\\" text=\\\"changeEvt\\\" bttParams=\\\"' + getBTTParamsStr({'type':'submit','flowEvent':'next' })  +'\\\"></div>' +
'<a cellWidgetId=\\\"mixButton5\\\" height=\\\"13px\\\" dojoType=\\\"com.ibm.btt.dijit.Anchor\\\" bttParams=\\\"' + getBTTParamsStr({'type':'linkin','operationId':'IBK_4_11_MutiWidgetNewOp' })  +'\\\" text=\\\"new operation\\\"></a>  ';
}    
}" text="MixFormatter" canSort="false" noresize="false" repeat="true" id="columnId6" headerVAlign="left"/>
                        </bttdojo:table>
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