<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- Generated from IBK_4_11_mutiWidget_Link.xui by ghost, on Wed Apr 10 16:54:03 CST 2013 -->
<head>
<%@ taglib uri="/WEB-INF/xhtml.tld" prefix="bttdojo"%>
<%@ page import="com.ibm.btt.cs.html.JSPUtil" %> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
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
@import "js/dojox/form/resources/CheckedMultiSelect.css";

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
.BTTTableStyle {
	display:table;
	border-collapse:collapse;
}

.BTTRowStyle {
	display:table-row;
}

.BTTCellStyle {
	display:table-cell;
	padding:5px;
}
</style>
<script type="text/javascript">
	var djConfig =  {
		baseUrl:"js/dojo/",
		<bttdojo:locale/>,
		isDebug: true, 
		parseOnLoad: true
	};
</script>

<script type="text/javascript" src="js/dojo/dojo_BTT.js"></script>
<script type="text/javascript" src="js/com/ibm/btt/btt.js.uncompressed.js"></script>
<script type="text/javascript" src="js/config/globalConfiguration.js"></script>
<script type="text/javascript">
dojo.addOnLoad(function(){
	if(window.dse_widgetsConfig){
		for(var idx = window.dse_widgetsConfig.length -1; idx>=0; idx --){
			var config = window.dse_widgetsConfig[idx];
			if(config.id){
				try{
					dojo.parser.instantiate([dojo.byId(config.id)], config);
				} catch(e) {
					console.error(e);
				}
			}
		}
	}
});

dojo.addOnLoad(function(){
	dojo.style(document.body, "visibility", "");
});
</script>

<script type="text/javascript">
	if(!window.engine){
		<%if(utb.ajaxNavigationEnabled()){%>
			window.engine = new com.ibm.btt.event.NavigationEngine();
		<%}else{%>
			window.engine = new com.ibm.btt.event.Engine();
		<%}%>
		engine.setMonitor(new com.ibm.btt.event.BaseMonitor());
		engine.registerCond("js/condition/condition.js");
		//<![CDATA[
		/** Uncomment this to use Global Function Key **/
		/** load definition in global project if necessary **/
		// engine.registerKeys("<url to global project>js/keymap/globalKeyMap.js");
		/** load definition in this(local) project **/
		// engine.registerKeys("js/keymap/globalKeyMap.js");
		/** please note that the local definition will override the global definition with the same name **/
		//]]>
	}
</script>
</head>
<body class="claro" style="visibility:hidden">
<bttdojo:config>[{"id":"IBK_4_11_mutiWidget_Link_form","name":"Form"}, {"style":"","id":"IBK_4_11_mutiWidget_Link_label03","name":"Label","text":"RowIndex:"}, {"style":"","id":"IBK_4_11_mutiWidget_Link_RowIndexResult","name":"Label","text":"Label"}, {"style":"","id":"IBK_4_11_mutiWidget_Link_label04","name":"Label","text":"MenuId"}, {"style":"","id":"IBK_4_11_mutiWidget_Link_MenuItemId","name":"Label","text":"Label"}, {"style":"","id":"IBK_4_11_mutiWidget_Link_label02","name":"Label","text":"WidgetId"}, {"style":"","id":"IBK_4_11_mutiWidget_Link_WidgetIdResult","name":"Label","text":"Label"}, {"style":"","id":"IBK_4_11_mutiWidget_Link_label01","name":"Label","text":"test validation(Must input number)"}, {"style":"","dataName":"testValidation","type":"Number","id":"IBK_4_11_mutiWidget_Link_text","name":"Text"}, {"style":"","dataNameForList":"TestMutiWidgetList","isPageable":"false",
"menus":
[
{"hasCloseButton":"false","menuItems":[{"type":"noAction","id":"menu0_item0","text":"menu0_item0"},{"type":"noAction","id":"menu0_item1","text":"menu0_item1"}],"bindingCellWidgetId":"columnId2","leftClickToOpen":"true","position":"point"}
,{"hasCloseButton":"false","menuItems":[{"type":"noAction","id":"link1_item0","text":"link1_item0"},{"type":"noAction","id":"link1_item1","text":"link1_item1"}],"bindingCellWidgetId":"link1","leftClickToOpen":"true","position":"point"}
,{"hasCloseButton":"true","menuItems":[{"type":"noAction","id":"link2_item0","text":"link2_item0"},{"type":"noAction","id":"link2_item1","text":"link2_item1"}],"bindingCellWidgetId":"link2","leftClickToOpen":"false","position":"below"}

],"dataName":"singleResult","id":"IBK_4_11_mutiWidget_Link_table","name":"Table","columns":[{"dataName":"Field1","noresize":"false","align":"left","width":"80","hidden":"false","id":"columnId0","text":"column0"},{"dataName":"Field2","noresize":"false","align":"left","width":"80","hidden":"false","id":"columnId1","text":"column1"},{"newWindow":"false","widget":"Link","dataName":"Field3","noresize":"false","align":"left","width":"80","renderMode":"text","hidden":"false","id":"columnId2","flowEvent":"evtLink","text":"column2"}
,{"showTooltip":"true","tooltipPosition":"above","columnTooltip":"Field1","widget":"Content","align":"left","width":"180","hidden":"false","id":"column8","text":"link","content":[{"name":"Link","cellWidgetId":"link1","action":"#","text":"ECA1(Left click)"},
{"name":"Link","cellWidgetId":"link2","action":"#","text":"ECA2(Right click)"}]}
,{"showTooltip":"true","tooltipPosition":"before","columnTooltip":"Field1","widget":"Content","align":"left","width":"350","hidden":"false","id":"column9","text":"submit","content":[{"name":"Link","cellWidgetId":"submitlink2","text":"change flow event","flowEvent":"evtLink"},
{"name":"Link","cellWidgetId":"submitlink3","text":"launch new flow","flowId":"IBK_4_11_mutiWidget_newFlow"},
{"name":"Link","cellWidgetId":"submitlink4","text":"launch new operation","operationId":"IBK_4_11_MutiWidgetNewOp"},
{"name":"Link","cellWidgetId":"submitlink4","text":"url","action":"http://www.baidu.com"}
]}
]}]</bttdojo:config>
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/IBK_4_11_mutiWidget/IBK_4_11_mutiWidget_Link.js"> </script>
  <div id="IBK_4_11_mutiWidget_Link_panel" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:form id="IBK_4_11_mutiWidget_Link_form" errorPage="IBK_4_11_mutiWidget/IBK_4_11_mutiWidget_Link.jsp">
          <div class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <div id="IBK_4_11_mutiWidget_Link_panel02" class="BTTTableStyle">
                    <div class="BTTRowStyle">
                     
                     
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="IBK_4_11_mutiWidget_Link_label03" text="RowIndex:"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="IBK_4_11_mutiWidget_Link_RowIndexResult" text="Label"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="IBK_4_11_mutiWidget_Link_label04" text="MenuId"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="IBK_4_11_mutiWidget_Link_MenuItemId" text="Label"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="IBK_4_11_mutiWidget_Link_label02" text="WidgetId"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="IBK_4_11_mutiWidget_Link_WidgetIdResult" text="Label"/>
                      </div>
                    </div>
                  </div>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <div id="IBK_4_11_mutiWidget_Link_Panel01" class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="aab01" text="test validation(Must input number)"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:textbox id="IBK_4_11_mutiWidget_Link_text" dataName="testValidation" type="Number"/>
                      </div>
                    </div>
                  </div>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:table id="IBK_4_11_mutiWidget_Link_table" dataName="singleResult" dataNameForList="TestMutiWidgetList" isPageable="false">
                  <bttdojo:column align="left" noresize="false" dataName="Field1" width="80" hidden="false" id="columnId0" text="column0"/>
                  <bttdojo:column align="left" noresize="false" dataName="Field2" width="80" hidden="false" id="columnId1" text="column1"/>
                  <bttdojo:column newWindow="false" widget="Link" align="left" noresize="false" dataName="Field3" width="80" renderMode="text" hidden="false" id="columnId2" flowEvent="evtLink" text="column2"/>
                  <bttdojo:tableMenu hasCloseButton="false" leftClickToOpen="true" bindingCellWidgetId="columnId2" position="point">
                    <bttdojo:tableMenuItem type="noAction" id="menu0_item0" text="menu0_item0"/>
                    <bttdojo:tableMenuItem type="noAction" id="menu0_item1" text="menu0_item1"/>
                  </bttdojo:tableMenu>
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

</body>
</html>
