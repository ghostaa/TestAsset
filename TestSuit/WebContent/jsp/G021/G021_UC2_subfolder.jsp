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
<!-- Generated from G021_UC2_subfolder.xui by mashuai, on Fri Jan 17 15:16:48 CST 2014 -->
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
<script type="text/javascript" data-btt-eca="true" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/G021/G021_UC2_subfolder.js"> </script>
<%request.setAttribute("dse_sessionId", session.getId()); %>
  <div id="G021_UC2_subfolder_panel" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="border:solid 1px #8080FF;vertical-align:middle;">
        <bttdojo:form id="G021_UC2_subfolder_form1" errorPage="G021/G021_UC2_subfolder.jsp">
          <table>
            <tr>
              <td colspan="3" align="left" valign="middle" style="width:500px;vertical-align:middle;">
                <bttdojo:label id="G021_UC2_subfolder_label08" text="Form1:" width="100%" height="100%" textWrap="false"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="G021_UC2_subfolder_label" text="PW1"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:textbox id="G021_UC2_subfolder_pw1" dataName="pw1" password="true"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="G021_UC2_subfolder_label01" text="PW2"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:textbox id="G021_UC2_subfolder_pw2" dataName="pw2" type="String" password="true"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:button id="G021_UC2_subfolder_button" type="submit" text="Confirm" flowEvent="confirm"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
          </table>
      </bttdojo:form>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="border:solid 1px #8080FF;vertical-align:middle;">
        <bttdojo:form id="G021_UC2_subfolder_form2" errorPage="G021/G021_UC2_subfolder.jsp">
          <table>
            <tr>
              <td colspan="3" align="left" valign="middle" style="width:500px;vertical-align:middle;">
                <bttdojo:label id="G021_UC2_subfolder_label08_form2" text="Form2:" width="100%" height="100%" textWrap="false"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="G021_UC2_subfolder_label02_form2" text="From Date"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:textbox id="G021_UC2_subfolder_fromDate_form2" dataName="fromDate" type="Date" pattern="yyyy-MM-dd"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="G021_UC2_subfolder_label03_form2" text="To Date"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:textbox id="G021_UC2_subfolder_toDate_form2" dataName="toDate" type="Date" pattern="yyyy-MM-dd"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:button id="G021_UC2_subfolder_button_form2" type="submit" text="Confirm" flowEvent="confirm"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
          </table>
      </bttdojo:form>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="border:solid 1px #8080FF;vertical-align:middle;">
        <bttdojo:form id="G021_UC2_subfolder_form3" errorPage="G021/G021_UC2_subfolder.jsp">
          <table>
            <tr>
              <td colspan="3" align="left" valign="middle" style="width:500px;vertical-align:middle;">
                <bttdojo:label id="G021_UC2_subfolder_label08_form3" text="Form3:" width="100%" height="100%" textWrap="false"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="G021_UC2_subfolder_label04_form3" text="Balance"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:textbox id="G021_UC2_subfolder_balance_form3" dataName="balance" readOnly="true"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="G021_UC2_subfolder_label06_form3" text="Amount"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:textbox id="G021_UC2_subfolder_amount_form3" dataName="amount" type="Number" numberType="double" decimalPlaces="3"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:label id="G021_UC2_subfolder_label07_form3" text="Bank Code"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:textbox id="G021_UC2_subfolder_bankCode_form3" dataName="bankCode" type="String"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
            <tr>
              <td colspan="2" align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:checkbox id="G021_UC2_subfolder_checkBox01_form3" dataName="isAccept" checkedValue="true" text="Accept the agreement"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
                <bttdojo:button id="G021_UC2_subfolder_button_form3" type="submit" text="Confirm" flowEvent="confirm"/>
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
              <td align="left" valign="middle" style="vertical-align:middle;">
              </td>
            </tr>
          </table>
      </bttdojo:form>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
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