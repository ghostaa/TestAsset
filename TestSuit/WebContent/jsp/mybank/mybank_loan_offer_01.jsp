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
<!-- Generated from mybank_loan_offer_01.xui by mashuai, on Fri Jan 17 13:41:20 CST 2014 -->
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

@import "css/mybank/slider/mybankSlider.css";
@import "css/mybank/mybankMain.css";
@import "css/mybank/titlepane/titlepane.css";
@import "css/mybank/button/button.css";

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
  <bttdojo:datasource id="mybank_loan_offer_01_localContextStore" fieldSet="termLength,borrowAmount"></bttdojo:datasource>
<bttdojo:form id="mybank_loan_offer_01_form" errorPage="mybank/mybank_loan_offer_01.jsp">
  <div class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <div data-dojo-props="class:' mybankTitlePane',ioArgs:{content:{dse_sessionId:'${dse_sessionId}'}},style:{textAign:'left',width:'702px'}" id="mybank_loan_offer_01_titlePane" data-dojo-type="dijit.TitlePane">
            <div class="sliderPanel BTTTableStyle" style="width:700px;height:362px;" id="mybank_loan_offer_01_panel">
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="center" style="width:33%;height:170px;vertical-align:middle;">
                    <table id="mybank_loan_offer_01_panel05">
                      <tr>
                        <td rowspan="2" align="left" valign="middle" style="vertical-align:middle;">
                          <bttdojo:label id="mybank_loan_offer_01_label06" class="sliderLabel_03" text="1"/>
                        </td>
                        <td align="left" valign="middle" style="vertical-align:middle;">
                          <bttdojo:label id="mybank_loan_offer_01_label07" class=" sliderLabel_04" text="Borrow Ammount"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle" style="vertical-align:middle;">
                          <bttdojo:label id="mybank_loan_offer_01_label08" width="141px" class="sliderLabel_05" text="Adjust the amount you would like to borrow" textWrap="true"/>
                        </td>
                      </tr>
                    </table>
                </div>
                <div class="BTTCellStyle" align="center" style="width:36%;height:170px;vertical-align:middle;">
                    <table id="mybank_loan_offer_01_panel06">
                      <tr>
                        <td rowspan="2" align="left" valign="middle" style="vertical-align:middle;">
                          <bttdojo:label id="mybank_loan_offer_01_label09" class=" sliderLabel_03" text="2"/>
                        </td>
                        <td align="left" valign="middle" style="vertical-align:middle;">
                          <bttdojo:label id="mybank_loan_offer_01_label10" class=" sliderLabel_04" text="Term Length"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle" style="vertical-align:middle;">
                          <bttdojo:label id="mybank_loan_offer_01_label11" width="158px" text="Adjust the term length you would like for repayments" textWrap="true"/>
                        </td>
                      </tr>
                    </table>
                </div>
                <div class="BTTCellStyle" align="center" style="width:33%;height:170px;vertical-align:middle;">
                    <table id="mybank_loan_offer_01_panel06_copy">
                      <tr>
                        <td rowspan="2" align="left" valign="middle" style="vertical-align:middle;">
                          <bttdojo:label id="mybank_loan_offer_01_label09_copy" class=" sliderLabel_03" text="3"/>
                        </td>
                        <td align="left" valign="middle" style="vertical-align:middle;">
                          <bttdojo:label id="mybank_loan_offer_01_label10_copy" class=" sliderLabel_04" text="Interest Rate"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle" style="vertical-align:middle;">
                          <bttdojo:label id="mybank_loan_offer_01_label11_copy" width="158px" text="Interest Rate is calculated here base on you needs" textWrap="true"/>
                        </td>
                      </tr>
                    </table>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="center" style="width:33%;height:160px;vertical-align:middle;">
                    <div style="width:100%;height:100%;" id="mybank_loan_offer_01_panel02" class="BTTTableStyle">
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="center" style="height:50px;vertical-align:bottom;">
                          <bttdojo:label id="mybank_loan_offer_01_amountLabel" class="sliderLabel" text="$50,000"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="center" style="vertical-align:top;">
                          <div data-dojo-props="class:'mybankSlider',value:$BTT_DF('borrowAmount', 'mybank_loan_offer_01_localContextStore'),name:'borrowAmount',discreteValues:21,intermediateChanges:true,maximum:250000,minimum:50000,showButtons:false,style:{width:'160px'}" id="mybank_loan_offer_01_dijit_form_HorizontalSlider" data-dojo-type="dijit.form.HorizontalSlider">
                            <div data-dojo-props="container:'topDecoration',count:6,style:{height:'5px'}" data-dojo-type="dijit.form.HorizontalRule">
                            </div>
                            <ol data-dojo-props="container:'bottomDecoration',count:2,labels:['$50,000','$250,000'],labelStyle:'top:5px;color:#FFFFFF;',style:{height:'1.2em'}" data-dojo-type="dijit.form.HorizontalRuleLabels">
                            </ol>
                          </div>
                        </div>
                      </div>
                    </div>
                </div>
                <div class="BTTCellStyle" align="left" style="width:36%;height:160px;vertical-align:middle;">
                    <div style="width:100%;height:100%;" id="mybank_loan_offer_01_panel03_copy" class="BTTTableStyle">
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="center" style="height:50px;vertical-align:bottom;">
                          <bttdojo:label id="mybank_loan_offer_01_yearLabel" class=" sliderLabel_02" text="1 years"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="center" style="vertical-align:top;">
                          <div data-dojo-props="class:'mybankSlider',value:$BTT_DF('termLength', 'mybank_loan_offer_01_localContextStore'),name:'termLength',discreteValues:15,intermediateChanges:true,maximum:15,minimum:1,showButtons:false,style:{width:'160px'}" id="mybank_loan_offer_01_dijit_form_HorizontalSlider01" data-dojo-type="dijit.form.HorizontalSlider">
                            <div data-dojo-props="container:'topDecoration',count:8,style:{height:'5px'}" data-dojo-type="dijit.form.HorizontalRule">
                            </div>
                            <ol data-dojo-props="container:'bottomDecoration',count:2,labels:['1 year','15 years'],labelStyle:'top:5px;width:50px;color:#808000;',style:{height:'1.2em'}" data-dojo-type="dijit.form.HorizontalRuleLabels">
                            </ol>
                          </div>
                        </div>
                      </div>
                    </div>
                </div>
                <div class="BTTCellStyle" align="left" style="width:33%;height:160px;vertical-align:middle;">
                    <div style="width:100%;height:100%;" id="mybank_loan_offer_01_panel04" class="BTTTableStyle">
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="center" style="vertical-align:bottom;">
                          <bttdojo:label id="mybank_loan_offer_01_label05" class=" sliderLabel_03" text="6%"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="center" style="height:58px;vertical-align:middle;">
                          <bttdojo:button id="mybank_loan_offer_01_button" type="button" class="mybankButtonGreen" text="ACCEPT"/>
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
</bttdojo:form>

<div url="jsp/mybank/mybank_loan_offer_01.js" prefix="" dojoType="com.ibm.btt.event.ECALoader"></div>
<!-- applet id="printApplet" name="printApplet" code="com.ibm.btt.print.applets.PrintrApplet" codebase="applets" archive="bttprint.jar,JSON4J.jar" style="width:0px; height:0px;"></applet-->
</body>
</html>