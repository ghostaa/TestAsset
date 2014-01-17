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
<!-- Generated from ShowAllWidght.xui by mashuai, on Fri Jan 17 15:17:32 CST 2014 -->
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
<script type="text/javascript" data-btt-eca="true" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/ShowAllWidght.js"> </script>
<%request.setAttribute("dse_sessionId", session.getId()); %>
  <div id="ShowAllWidght_panel" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:top;">
        <bttdojo:form id="ShowAllWidght_form" errorPage="ShowAllWidght.jsp">
          <div class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" style="vertical-align:">
                  <div id="ShowAllWidght_panel_copy" class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="center" style="vertical-align:middle;">
                        <bttdojo:a id="ShowAllWidght_link13" text="%nls.bttsample/lang_ch" flowEvent="ch"/>
                      </div>
                      <div class="BTTCellStyle" align="center" style="vertical-align:middle;">
                        <bttdojo:a id="ShowAllWidght_link14" text="%nls.bttsample/lang_English" flowEvent="en"/>
                      </div>
                      <div class="BTTCellStyle" align="center" style="vertical-align:middle;">
                        <bttdojo:a id="ShowAllWidght_link15" text="%nls.bttsample/lang_Korean" flowEvent="ko"/>
                      </div>
                      <div class="BTTCellStyle" align="center" style="vertical-align:middle;">
                        <bttdojo:a id="ShowAllWidght_link16" text="%nls.bttsample/lang_sp" flowEvent="sp"/>
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="center" style="vertical-align:middle;">
                        <bttdojo:button id="ShowAllWidght_button02_copy" type="submit" text="%nls.bttsample/lang_ch" flowEvent="ch"/>
                      </div>
                      <div class="BTTCellStyle" align="center" style="vertical-align:middle;">
                        <bttdojo:button id="ShowAllWidght_button03_copy" type="submit" text="%nls.bttsample/lang_English" flowEvent="en"/>
                      </div>
                      <div class="BTTCellStyle" align="center" style="vertical-align:middle;">
                        <bttdojo:button id="ShowAllWidght_button04_copy" type="submit" text="%nls.bttsample/lang_Korean" flowEvent="ko"/>
                      </div>
                      <div class="BTTCellStyle" align="center" style="vertical-align:middle;">
                        <bttdojo:button id="ShowAllWidght_button05_copy" type="submit" text="%nls.bttsample/lang_sp" flowEvent="sp"/>
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="center" style="vertical-align:middle;">
                        <bttdojo:image id="ShowAllWidght_image_copy" location="img/IBK_F_007/icon_ch.jpg" flowEvent="ch"/>
                      </div>
                      <div class="BTTCellStyle" align="center" style="vertical-align:middle;">
                        <bttdojo:image id="ShowAllWidght_image01_copy" location="img/IBK_F_007/icon_en.jpg" flowEvent="en"/>
                      </div>
                      <div class="BTTCellStyle" align="center" style="vertical-align:middle;">
                        <bttdojo:image id="ShowAllWidght_image02_copy" location="img/IBK_F_007/icon_ko.jpg" flowEvent="ko"/>
                      </div>
                      <div class="BTTCellStyle" align="center" style="vertical-align:middle;">
                        <bttdojo:image id="ShowAllWidght_image03_copy" location="img/IBK_F_007/icon_sp.jpg" flowEvent="sp"/>
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
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
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <div id="ShowAllWidght_panel04" class="BTTTableStyle">
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:label id="ShowAllWidght_label_copy" text="%nls.bttsample/Welcome_To_Btt_Sample"/>
                              </div>
                            </div>
                          </div>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                    </div>
                  </div>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:top;">
                <bttdojo:group id="ShowAllWidght_group" text="Label group--Layout is div">
                  <div class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="ShowAllWidght_label08" text="visibility=visible:"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="ShowAllWidght_label" dataName="TestString" text="Label" hint="%nls.bttsample/Welcome_To_Btt_Sample"/>
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="ShowAllWidght_label09" text="visibility=hidden:"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="ShowAllWidght_label11" text="Label" visibility="hidden"/>
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="ShowAllWidght_label10" text="visibility=gone:"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="ShowAllWidght_label12" text="Label" visibility="gone"/>
                      </div>
                    </div>
                  </div>
              </bttdojo:group>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:top;">
                  <div id="ShowAllWidght_panel01" class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:top;">
                        <bttdojo:group id="ShowAllWidght_group01" text="Radio group--Layout is table">
                          <div class="BTTTableStyle">
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:radio id="ShowAllWidght_radio01" dataName="SexData" value="1" text="%nls.bttsample/sexmale"/>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:radio id="ShowAllWidght_radio" dataName="SexData" value="0" text="%nls.bttsample/sexfemale"/>
                              </div>
                            </div>
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:label id="ShowAllWidght_label13" text="visibility=hidden"/>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:radio id="ShowAllWidght_radio02" text="Radio" visibility="hidden"/>
                              </div>
                            </div>
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:label id="ShowAllWidght_label14" text="visibility=gone"/>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:radio id="ShowAllWidght_radio03" text="Radio" visibility="gone"/>
                              </div>
                            </div>
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:label id="ShowAllWidght_label15" text="disabled=true"/>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:radio id="ShowAllWidght_radio04" text="Radio" disabled="true"/>
                              </div>
                            </div>
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:label id="ShowAllWidght_label16" text="readOnly=true"/>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:radio id="ShowAllWidght_radio05" text="Radio" readOnly="true"/>
                              </div>
                            </div>
                          </div>
                      </bttdojo:group>
                      </div>
                      <div class="BTTCellStyle" style="vertical-align:">
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:top;">
                        <bttdojo:group id="ShowAllWidght_group02" text="CheckBox">
                          <div class="BTTTableStyle">
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:checkbox id="ShowAllWidght_checkBox" dataName="CheckBoxData" checkedValue="true" text="visibility=visible"/>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:checkbox id="ShowAllWidght_checkBox01" checkedValue="true" text="visibility=hidden" visibility="hidden"/>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:checkbox id="ShowAllWidght_checkBox02" checkedValue="true" text="visibility=gone" visibility="gone"/>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:checkbox id="ShowAllWidght_checkBox03" checkedValue="true" text="disabled=true" disabled="true"/>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:checkbox id="ShowAllWidght_checkBox05" checkedValue="true" text="readOnly=true" readOnly="true"/>
                              </div>
                              <div class="BTTCellStyle" style="vertical-align:">
                              </div>
                            </div>
                          </div>
                      </bttdojo:group>
                      </div>
                      <div class="BTTCellStyle" style="vertical-align:">
                      </div>
                    </div>
                  </div>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:top;">
                  <div id="ShowAllWidght_panel02" class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:top;">
                        <bttdojo:group id="ShowAllWidght_group03" text="Text">
                          <div class="BTTTableStyle">
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:label id="ShowAllWidght_label01" text="Text"/>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:textbox id="ShowAllWidght_text" dataName="TextData" type="Number" numberType="integer" minimumValue="-2147483648" maximumValue="2147483647" required="true"/>
                              </div>
                            </div>
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:label id="ShowAllWidght_label02" text="isMandatory=true"/>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:textbox id="ShowAllWidght_text01" dataName="TextData2" type="String" required="true"/>
                              </div>
                            </div>
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:label id="ShowAllWidght_label03" text="visibility=hidden"/>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:textbox id="ShowAllWidght_text03" visibility="hidden"/>
                              </div>
                            </div>
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:label id="ShowAllWidght_label04" text="visibility=gone"/>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:textbox id="ShowAllWidght_text02" visibility="gone"/>
                              </div>
                            </div>
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:label id="ShowAllWidght_label05" text="disabled=true"/>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:textbox id="ShowAllWidght_text04" disabled="true"/>
                              </div>
                            </div>
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:label id="ShowAllWidght_label06" text="readOnly=true"/>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:textbox id="ShowAllWidght_text05" readOnly="true"/>
                              </div>
                            </div>
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:label id="ShowAllWidght_label07" text="password=true"/>
                              </div>
                              <div class="BTTCellStyle" align="center" style="vertical-align:middle;">
                                <bttdojo:textbox id="ShowAllWidght_text06" dataName="PasswordData" type="String" password="true"/>
                              </div>
                            </div>
                          </div>
                      </bttdojo:group>
                      </div>
                    </div>
                  </div>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:top;">
                  <div id="ShowAllWidght_panel03" class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:top;">
                        <bttdojo:group id="ShowAllWidght_group05" text="Select List">
                          <div class="BTTTableStyle">
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:label id="ShowAllWidght_label17" text="dataNameForList=Select_List"/>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:select id="ShowAllWidght_selectList" dataName="Select_DataName_result" dataNameForList="Select_List" labelField="CityName" valueField="CityValue"/>
                              </div>
                            </div>
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:label id="ShowAllWidght_label18" text="urlForList=City"/>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:select id="ShowAllWidght_selectList01" dataName="Select_UrlList_result" storeURL="listFiles/City.js"/>
                              </div>
                            </div>
                          </div>
                      </bttdojo:group>
                      </div>
                    </div>
                  </div>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:top;">
                <bttdojo:group id="ShowAllWidght_group04" text="Combo">
                  <div class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="ShowAllWidght_label21" text="dataNameForList=Combo_List"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:combo id="ShowAllWidght_combo" dataName="Combo_DataName_result" dataNameForList="Combo_List" labelField="CountryName"/>
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="ShowAllWidght_label22" text="urlForList=Country"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:combo id="ShowAllWidght_combo01" dataName="Combo_UrlList_result" storeURL="listFiles/Country.js"/>
                      </div>
                    </div>
                  </div>
              </bttdojo:group>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:top;">
                <bttdojo:group id="ShowAllWidght_group06" text="Link">
                  <div class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" style="vertical-align:">
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:a id="ShowAllWidght_link" text="Change flow Event to finalPage" flowEvent="finalPage"/>
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" style="vertical-align:">
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:a id="ShowAllWidght_link01" text="launch new flow --IBK_30_Test_XHTML_Other_Flow" flowId="IBK_30_Test_XHTML_Other_Flow"/>
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" style="vertical-align:">
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:a id="ShowAllWidght_link02" text="Launch Hello World Operation" operationId="LaunchOp"/>
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" style="vertical-align:">
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:a id="ShowAllWidght_link03" text="Launch URL  -- Naver" target="_blank" action="http://www.naver.com/"/>
                      </div>
                    </div>
                  </div>
              </bttdojo:group>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:top;">
                <bttdojo:group id="ShowAllWidght_group08" text="image">
                  <div class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="ShowAllWidght_label19" text="location=img/7days.jpg"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:image id="ShowAllWidght_image" location="img/7days.jpg" tabIndex="-1"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="ShowAllWidght_label20" text="dataName=TestImage"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:image id="ShowAllWidght_image01" dataName="TestImage" tabIndex="-1"/>
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="ShowAllWidght_label30" text="Launch Hello World Operation"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:image id="ShowAllWidght_image04" location="img/30count.jpg" operationId="LaunchOp"/>
                      </div>
                      <div class="BTTCellStyle" style="vertical-align:">
                        <bttdojo:label id="ShowAllWidght_label29" text="launch new flow --IBK_30_Test_XHTML_Other_Flow"/>
                      </div>
                      <div class="BTTCellStyle" style="vertical-align:">
                        <bttdojo:image id="ShowAllWidght_image03" location="img/10days.jpg" flowId="IBK_30_Test_XHTML_Other_Flow"/>
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="ShowAllWidght_label23" text="Change flow event to final page"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:image id="ShowAllWidght_image02" location="img/15days.jpg" target="_blank" flowEvent="finalPage"/>
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
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:top;">
                <bttdojo:group id="ShowAllWidght_group09" text="RichText">
                  <div class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:richTextEditor id="ShowAllWidght_richText" dataName="RichTextEditorData"/>
                      </div>
                    </div>
                  </div>
              </bttdojo:group>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:top;">
                <bttdojo:group id="ShowAllWidght_group10" text="Text Area">
                  <div class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:textArea id="ShowAllWidght_textArea" dataName="TextAreaData" type="String"/>
                      </div>
                    </div>
                  </div>
              </bttdojo:group>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:top;">
                <bttdojo:group id="ShowAllWidght_group11" text="Message">
                  <div class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:message id="ShowAllWidght_message" dataName="dse_errorMessages"/>
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:button id="ShowAllWidght_button02" type="button" text="This button is used to show Message"/>
                      </div>
                    </div>
                  </div>
              </bttdojo:group>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:top;">
                <bttdojo:group id="ShowAllWidght_group07" text="Button">
                  <div class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:button id="ShowAllWidght_button" type="submit" text="submit" flowEvent="viewEvt"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:button id="ShowAllWidght_button01" type="reset" text="reset"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:button id="ShowAllWidght_button03" type="cancel" text="submit with no data" flowEvent="viewEvt"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:button id="ShowAllWidght_button04" type="save" text="submit without validation" flowEvent="viewEvt"/>
                      </div>
                    </div>
                  </div>
              </bttdojo:group>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:top;">
                <bttdojo:group id="ShowAllWidght_group12" text="Script">
                  <table>
                    <tr>
                      <td align="left" valign="middle" style="vertical-align:middle;">
                        <bttdojo:button id="ShowAllWidght_button05" type="button" text="Execute script by url"/>
                      </td>
                      <td style="vertical-align:">
                        <bttdojo:button id="ShowAllWidght_button06" type="button" text="Execute script by content"/>
                      </td>
                      <td style="vertical-align:">
                      </td>
                      <td align="left" valign="middle" style="vertical-align:middle;">
                        <bttdojo:label id="ShowAllWidght_label24" text="Label"/>
                      </td>
                      <td align="left" valign="middle" style="vertical-align:middle;">
                        <bttdojo:label id="ShowAllWidght_label25" text="Label"/>
                      </td>
                      <td align="left" valign="middle" style="vertical-align:middle;">
                        <bttdojo:label id="ShowAllWidght_label26" text="Label"/>
                      </td>
                      <td align="left" valign="middle" style="vertical-align:middle;">
                        <bttdojo:label id="ShowAllWidght_label27" text="Label"/>
                      </td>
                      <td align="left" valign="middle" style="vertical-align:middle;">
                        <bttdojo:label id="ShowAllWidght_label28" text="Label"/>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="2" align="left" valign="middle" style="vertical-align:middle;">
                        <bttdojo:label id="ShowAllWidght_LabelForScript" text="Label"/>
                      </td>
                      <td align="left" valign="middle" style="vertical-align:middle;">
                      </td>
                      <td colspan="5" align="left" valign="middle" style="vertical-align:middle;">
                      </td>
                    </tr>
                  </table>
                  <bttdojo:script id="ShowAllWidght_Script01" location="js/scriptJSFloder/TestScriptWidget.js"/>
                  <bttdojo:script id="ShowAllWidght_Script02" content="dijit.byId(\"ShowAllWidght_label24\").set('value', param0);
dijit.byId(\"ShowAllWidght_label25\").set('value', param1);
dijit.byId(\"ShowAllWidght_label26\").set('value', param2);
dijit.byId(\"ShowAllWidght_label27\").set('value', param3);
dijit.byId(\"ShowAllWidght_label28\").set('value', param4);
"/>
                  <bttdojo:script id="ShowAllWidght_Script03" content="dijit.byId(\"ShowAllWidght_LabelForScript\").set(\"value\",\"This case is used to test executeOnLoad\");"/>
              </bttdojo:group>
              </div>
            </div>
          </div>
          <bttdojo:hidden id="ShowAllWidght_HiddenField01" value="Hi,I'm hidden value"/>
          <bttdojo:hidden id="ShowAllWidght_HiddenField02" dataName="StringForHiddenField"/>
      </bttdojo:form>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:group id="ShowAllWidght_group13" text="HiddenField">
          <div class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:button id="ShowAllWidght_button07" type="button" text="Get HiddenField value"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="ShowAllWidght_labelHiddenValue" text="Label"/>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:button id="ShowAllWidght_button08" type="button" text="Get HiddenField value by DataName"/>
              </div>
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="ShowAllWidght_labelHiddenDataName" text="Label"/>
              </div>
            </div>
          </div>
      </bttdojo:group>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:group id="ShowAllWidght_group15" text="Group">
          <div class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="ShowAllWidght_label32" text="This function requires additional support."/>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:fileupload id="ShowAllWidght_fileUpload" dataName="userFiles"/>
              </div>
            </div>
          </div>
      </bttdojo:group>
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:group id="ShowAllWidght_group14" text="Test form">
          <div class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:form id="ShowAllWidght_form01" flowEvent="viewEvt" errorPage="ShowAllWidght.jsp">
                  <div class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="ShowAllWidght_label31" text="click me to submit form"/>
                      </div>
                    </div>
                  </div>
              </bttdojo:form>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:form id="ShowAllWidght_form02" errorPage="ShowAllWidght.jsp">
                  <div class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="ShowAllWidght_label33" text="Click me,form is NO action"/>
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
  </div>

<!-- applet id="printApplet" name="printApplet" code="com.ibm.btt.print.applets.PrintrApplet" codebase="applets" archive="bttprint.jar,JSON4J.jar" style="width:0px; height:0px;"></applet-->
</body>
</html>