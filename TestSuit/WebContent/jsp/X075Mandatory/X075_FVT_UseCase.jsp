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
<!-- Generated from X075_FVT_UseCase.xui by mashuai, on Fri Jan 17 13:41:14 CST 2014 -->
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
  <div id="X075_FVT_UseCase_panel" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="X075_FVT_UseCase_label" text="Use case"/>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:group id="X075_FVT_UseCase_group01" text="single">
          <div class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:form id="X075_FVT_UseCase_form" errorPage="X075Mandatory/X075_FVT_UseCase.jsp">
                  <div class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="X075_FVT_UseCase_label03" text="Your name"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:textbox id="X075_FVT_UseCase_text01" dataName="X075_Mandatory_FVT_UserInfo.X075_Mandatory_FVT_Username" type="String"/>
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="X075_FVT_UseCase_label01" text="isMarried?"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:checkbox id="X075_FVT_UseCase_checkBox" dataName="X075_Mandatory_FVT_UserInfo.X075_Mandatory_FVT_isMarried" checkedValue="true" text="married"/>
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="X075_FVT_UseCase_label02" text="partnerName"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:textbox id="X075_FVT_UseCase_text" dataName="X075_Mandatory_FVT_UserInfo.X075_Mandatory_FVT_partnerName" type="String" required="true"/>
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:button id="X075_FVT_UseCase_button01" type="save" text="save" flowEvent="viewEvt"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:button id="X075_FVT_UseCase_button" type="submit" text="submit" flowEvent="viewEvt"/>
                      </div>
                    </div>
                  </div>
              </bttdojo:form>
              </div>
            </div>
          </div>
      </bttdojo:group>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:group id="X075_FVT_UseCase_group" text="multi">
          <div class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:form id="X075_FVT_UseCase_form01" errorPage="X075Mandatory/X075_FVT_UseCase.jsp">
                  <div class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:radio id="X075_FVT_UseCase_radio" dataName="X075_Mandatory_FVT_multi.X075_Mandatory_FVT_type" value="true" text="simple"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:radio id="X075_FVT_UseCase_radio01" dataName="X075_Mandatory_FVT_multi.X075_Mandatory_FVT_type" value="false" text="complex"/>
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
                        <bttdojo:label id="X075_FVT_UseCase_label04" text="non-mandatory"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:textbox id="X075_FVT_UseCase_text02" dataName="X075_Test_Client_Used" type="String"/>
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
                        <bttdojo:label id="X075_FVT_UseCase_label05" text="mandatory select:"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:combo id="X075_FVT_UseCase_combo" dataName="X075_Mandatory_FVT_multi.X075_Mandatory_FVT_one_result" dataNameForList="X075_Mandatory_FVT_multi.X075_Mandatory_FVT_one" labelField="X075_Mandatory_FVT_Field" valueField="X075_Mandatory_FVT_Field_value" required="true"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="X075_FVT_UseCase_label07" text="mandatory textArea:"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:textArea id="X075_FVT_UseCase_textArea" dataName="X075_Mandatory_FVT_multi.X075_Mandatory_FVT_textArea" type="String" isMandatory="true"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:button id="X075_FVT_UseCase_button02" type="submit" text="Button" flowEvent="mutil"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                    </div>
                  </div>
              </bttdojo:form>
              </div>
            </div>
          </div>
      </bttdojo:group>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:form id="X075_FVT_UseCase_form02" errorPage="X075Mandatory/X075_FVT_UseCase.jsp">
          <div class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:group id="X075_FVT_UseCase_group02" text="ref">
                  <div class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="X075_FVT_UseCase_label06" text="ref1"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:textbox id="X075_FVT_UseCase_text03" dataName="X075_Mandatory_FVT_ref.X075_Mandatory_FVT_Ref1" type="String" required="true"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:checkbox id="X075_FVT_UseCase_checkBox01" dataName="X075_Mandatory_FVT_ref.X075_Mandatory_FVT_ref1_checked" checkedValue="true" text="isMandatory"/>
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="X075_FVT_UseCase_label08" text="ref2"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:textbox id="X075_FVT_UseCase_text04" dataName="X075_Mandatory_FVT_ref.X075_Mandatory_FVT_Ref2" type="String" required="true"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:checkbox id="X075_FVT_UseCase_checkBox02" dataName="X075_Mandatory_FVT_ref.X075_Mandatory_FVT_ref2_checked" checkedValue="true" text="isMandatory"/>
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:button id="X075_FVT_UseCase_button03" type="submit" text="submit" flowEvent="ref"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                    </div>
                  </div>
              </bttdojo:group>
              </div>
            </div>
          </div>
      </bttdojo:form>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:form id="X075_FVT_UseCase_form03" errorPage="X075Mandatory/X075_FVT_UseCase.jsp">
          <div class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:group id="X075_FVT_UseCase_group03" text="lazy">
                  <div class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:checkbox id="X075_FVT_UseCase_checkBox03" dataName="X075_Mandatory_FVT_lazy.X075_Mandatory_FVT_lazy.X075_Mandatory_FVT_Data_isCheck" checkedValue="true"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:textbox id="X075_FVT_UseCase_text05" dataName="X075_Mandatory_FVT_lazy.X075_Mandatory_FVT_lazy.X075_Mandatory_FVT_Data_lazy" type="String" required="true"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="X075_FVT_UseCase_label09" text="X075_Mandatory_FVT_lazy.X075_Mandatory_FVT_lazy.X075_Mandatory_FVT_Data_lazy"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:checkbox id="X075_FVT_UseCase_checkBox04" dataName="X075_Mandatory_FVT_lazy.X075_Mandatory_FVT_lazy.X075_Mandatory_FVT_lazy.X075_Mandatory_FVT_Data_isCheck" checkedValue="true"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:textbox id="X075_FVT_UseCase_text06" dataName="X075_Mandatory_FVT_lazy.X075_Mandatory_FVT_lazy.X075_Mandatory_FVT_lazy.X075_Mandatory_FVT_Data_lazy" type="String" required="true"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="X075_FVT_UseCase_label11" text="X075_Mandatory_FVT_lazy.X075_Mandatory_FVT_lazy.X075_Mandatory_FVT_lazy.X075_Mandatory_FVT_Data_lazy"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:checkbox id="X075_FVT_UseCase_checkBox05" dataName="X075_Mandatory_FVT_lazy.X075_Mandatory_FVT_lazy.X075_Mandatory_FVT_lazy.X075_Mandatory_FVT_lazy.X075_Mandatory_FVT_Data_isCheck" checkedValue="true"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:textbox id="X075_FVT_UseCase_text07" dataName="X075_Mandatory_FVT_lazy.X075_Mandatory_FVT_lazy.X075_Mandatory_FVT_lazy.X075_Mandatory_FVT_lazy.X075_Mandatory_FVT_Data_lazy" type="String" required="true"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="X075_FVT_UseCase_label10" text="X075_Mandatory_FVT_lazy.X075_Mandatory_FVT_lazy.X075_Mandatory_FVT_lazy.X075_Mandatory_FVT_lazy.X075_Mandatory_FVT_Data_lazy"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:button id="X075_FVT_UseCase_button04" type="submit" text="submit" flowEvent="lazy"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                    </div>
                  </div>
              </bttdojo:group>
              </div>
            </div>
          </div>
      </bttdojo:form>
      </div>
    </div>
  </div>

<div url="jsp/X075Mandatory/X075_FVT_UseCase.js" prefix="" dojoType="com.ibm.btt.event.ECALoader"></div>
<!-- applet id="printApplet" name="printApplet" code="com.ibm.btt.print.applets.PrintrApplet" codebase="applets" archive="bttprint.jar,JSON4J.jar" style="width:0px; height:0px;"></applet-->
</body>
</html>