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
<!-- Generated from QueryPoints.xui by mashuai, on  -->
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

@import "css/main.css";
@import "css/testGridEnhancement.css";

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
<script type="text/javascript" data-btt-eca="true" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/B001/QueryPoints.js"> </script>
<%request.setAttribute("dse_sessionId", session.getId()); %>
  <div id="QueryPoints_panel" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:form id="QueryPoints_form" errorPage="B001/QueryPoints.jsp">
          <table style="width:801px;">
            <tr>
              <td align="left" valign="middle" style="width:142px;vertical-align:middle;">
                <bttdojo:label id="QueryPoints_label06" text="Selected Row Num"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="QueryPoints_label08" dataName="RowNum" text="Label"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="width:142px;vertical-align:middle;">
                <bttdojo:label id="QueryPoints_label07" text="Selected Acct Num"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="QueryPoints_label05" dataName="selectAcctNo" text="Label"/>
              </td>
            </tr>
            <tr>
              <td colspan="2" align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="QueryPoints_label" text="%nls.testb001/Query_Points"/>
              </td>
            </tr>
            <tr>
              <td colspan="2" align="left" valign="middle" style="vertical-align:middle;">
                  <table style="width:369px;" id="QueryPoints_panel01">
                    <tr>
                      <td rowspan="2" align="left" valign="middle" style="vertical-align:middle;">
                        <bttdojo:image id="QueryPoints_image" location="img/images5/blue/icon_success.gif" tabIndex="-1"/>
                      </td>
                      <td align="left" valign="middle" style="vertical-align:middle;">
                        <bttdojo:label id="QueryPoints_label01" text="%nls.testb001/Dear_Customer"/>
                      </td>
                      <td align="left" valign="middle" style="vertical-align:middle;">
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle" style="vertical-align:middle;">
                        <bttdojo:label id="QueryPoints_label02" text="%nls.testb001/Suc_Query_Points"/>
                      </td>
                      <td align="left" valign="middle" style="vertical-align:middle;">
                      </td>
                    </tr>
                  </table>
              </td>
            </tr>
            <tr>
              <td colspan="2" align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:table id="QueryPoints_table" dataNameForList="MyPoints" isPageable="false">
                  <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="%nls.testb001/Given_Name" dataName="GivenName" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
                  <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="%nls.testb001/Acct_No" dataName="AcctNo" noresize="false" repeat="true" id="columnId1" headerVAlign="left"/>
                  <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="%nls.testb001/Cur_Type" dataName="ParentType" noresize="false" repeat="true" id="columnId2" headerVAlign="left"/>
                  <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="%nls.testb001/Opening_Bank" dataName="BranchBank" noresize="false" repeat="true" id="columnId3" headerVAlign="left"/>
                  <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="%nls.testb001/Balance_Points" dataName="BalancePoints" noresize="false" repeat="true" id="columnId4" headerVAlign="left"/>
                  <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="%nls.testb001/Consumption_Points" dataName="ConsumptionPoints" noresize="false" repeat="true" id="columnId5" headerVAlign="left"/>
                  <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="%nls.testb001/Reward_Points" dataName="RewardPoints" noresize="false" repeat="true" id="columnId6" headerVAlign="left"/>
                </bttdojo:table>
              </td>
            </tr>
          </table>
      </bttdojo:form>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
          <table style="width:660px;" id="QueryPoints_panel02">
            <tr>
              <td align="left" valign="middle" style="width:85px;vertical-align:middle;">
                <bttdojo:label id="QueryPoints_label03" text="%nls.testb001/Friendly_Tips"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="width:85px;vertical-align:middle;">
                <bttdojo:label id="QueryPoints_label04" text="%nls.testb001/Tip_ExchangePoint"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:a id="QueryPoints_link" text="%nls.testb001/Exchange_Point" action="#"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
            <tr>
              <td colspan="3" align="center" valign="middle" style="width:85px;vertical-align:middle;">
                  <div style="width:274px;height:49px;" id="QueryPoints_panel03" class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:button id="QueryPoints_button" type="button" text="%nls.testb001/print"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:button id="QueryPoints_button01" type="cancel" text="%nls.testb001/Close" flowEvent="close"/>
                      </div>
                    </div>
                  </div>
              </td>
            </tr>
            <tr>
              <td colspan="3" align="left" valign="middle" style="width:85px;height:20px;vertical-align:middle;">
                <bttdojo:conditionalPanel id="QueryPoints_conditionalPanel" dataName="RowNum" width="579px">
                  <bttdojo:optionPanel id="QueryPoints_OptionPanel01" optionValue="0" style="width:100%;height:100%;">
                    <div style="width:100%;height:100%;" class="BTTTableStyle">
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="width:166px;vertical-align:middle;">
                          <bttdojo:label id="QueryPoints_label09" text="When Row Num is 0, the selected Acct Num is :"/>
                        </div>
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:label id="QueryPoints_label10" dataName="selectAcctNo" text="Label"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="width:166px;vertical-align:middle;">
                          <bttdojo:label id="QueryPoints_label14" text="Row Num"/>
                        </div>
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:label id="QueryPoints_label15" dataName="RowNum" text="Label"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="width:166px;vertical-align:middle;">
                          <bttdojo:textbox id="QueryPoints_text"/>
                        </div>
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        </div>
                      </div>
                    </div>
                </bttdojo:optionPanel>
                  <bttdojo:optionPanel id="QueryPoints_OptionPanel02" optionValue="1" style="width:100%;height:100%;">
                    <div style="width:100%;height:100%;" class="BTTTableStyle">
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:label id="QueryPoints_label11" text="when the row num is 1, show this panel"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:textbox id="QueryPoints_text01"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        </div>
                      </div>
                    </div>
                </bttdojo:optionPanel>
                  <bttdojo:optionPanel id="QueryPoints_OptionPanel03" optionValue="2" style="width:100%;height:100%;">
                    <div style="width:100%;height:100%;" class="BTTTableStyle">
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:label id="QueryPoints_label12" text="when the row num is 2, show this panel,this is optionPanel03"/>
                        </div>
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:textbox id="QueryPoints_text02"/>
                        </div>
                      </div>
                    </div>
                </bttdojo:optionPanel>
                  <bttdojo:optionPanel id="QueryPoints_OptionPanel04" optionValue="3" style="width:100%;height:100%;">
                    <table style="width:100%;height:100%;">
                      <tr>
                        <td align="left" valign="middle" style="vertical-align:middle;">
                          <bttdojo:textbox id="QueryPoints_text03"/>
                        </td>
                        <td align="left" valign="middle" style="vertical-align:middle;">
                        </td>
                      </tr>
                      <tr>
                        <td colspan="2" align="left" valign="middle" style="width:171px;vertical-align:middle;">
                          <bttdojo:label id="QueryPoints_label13" text="Row Num can not be 3, just have a test."/>
                        </td>
                      </tr>
                    </table>
                </bttdojo:optionPanel>
              </bttdojo:conditionalPanel>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="width:85px;vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="width:85px;vertical-align:middle;">
                <bttdojo:label id="QueryPoints_label16" text="Label"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="QueryPoints_label17" text="Label"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="QueryPoints_label18" text="Label"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="width:85px;vertical-align:middle;">
                <bttdojo:button id="QueryPoints_button02" type="button" text="Test conditionalPanel in ECA valid condition"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:button id="QueryPoints_button03" type="button" text="Test conditionalPanel in ECA invalid condition"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="width:85px;vertical-align:middle;">
                <bttdojo:button id="QueryPoints_button05" type="button" text="Test optionPanel id in ECA condition"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="width:85px;vertical-align:middle;">
                <bttdojo:button id="QueryPoints_button06" type="button" text="set conditionalPanel's style"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:button id="QueryPoints_button07" type="button" text="Button"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="width:85px;vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="width:85px;vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
          </table>
      </div>
    </div>
  </div>

<!-- applet id="printApplet" name="printApplet" code="com.ibm.btt.print.applets.PrintrApplet" codebase="applets" archive="bttprint.jar,JSON4J.jar" style="width:0px; height:0px;"></applet-->
</body>
</html>