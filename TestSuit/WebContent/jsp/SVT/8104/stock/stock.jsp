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
<!-- Generated from stock.xui by mashuai, on Fri Jan 17 13:40:45 CST 2014 -->
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

@import "css/G016/G016.css";

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
  <bttdojo:datasource id="stock_bttStoreWidget" fieldSet="CurrentStockDayLineList"></bttdojo:datasource>
  <div style="width:100%;height:100%;" id="stock_panel" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="height:100%;vertical-align:middle;">
        <div style="width:100%;height:100%;;background-color:#181818;" id="stock_borderContainer" data-dojo-type="dijit.layout.BorderContainer">
          <div id="stock_borderContainer_centerPanel" data-dojo-props="region:'center',ioArgs:{content:{dse_sessionId:'${dse_sessionId}'}}" style="text-align:left;;background-color:#181818;" data-dojo-type="dijit.layout.ContentPane">
            <div style="width:100%;height:100%;" class="BTTTableStyle">
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="width:533px;vertical-align:middle;">
                  <div style="width:446px;height:309px;" id="stock_chart2D" theme="dojox.charting.themes.Tom" dojoType="dojox.charting.widget.Chart2D">
                          <div class="plot" name="plot" type="Candlesticks" labels="false" stroke="{'style':'Solid'}"></div>
                          <div class="action" type="Tooltip" plot="plot"></div>
                          <div class="action" type="Highlight" plot="plot"></div>
                          <div class="action" type="Shake" plot="plot"></div>
                          <div class="action" type="Magnify" plot="plot" scale="1.5"></div>
                          <div class="action" type="MoveSlice" plot="plot" scale="1.5" shift="0"></div>
                        <div stroke="{'color':'#FF0000','width':1}" name="series" class="series" plot="plot" fill="'#00FF00'" store="$BTT_DOS('CurrentStockDayLineList', {mapOpt:{'value':{'high':'@high','low':'@low','close':'@close','open':'@open'}}}, 'stock_bttStoreWidget')"></div>
                  </div>
                </div>
              </div>
            </div>
        </div>
          <div class=" backGroundBlackColor" id="stock_borderContainer_rightPanel" data-dojo-props="region:'right',ioArgs:{content:{dse_sessionId:'${dse_sessionId}'}}" style="text-align:left;width:178px;;background-color:#181818;" data-dojo-type="dijit.layout.ContentPane">
            <div style="width:178px;height:100%;" class="BTTTableStyle">
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:titlepane id="stock_titlePane01">
                    <div class="dijitReset BTTTableStyle" style="width:100%;height:100%;">
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:form id="stock_form" errorPage="SVT/8104/stock/stock.jsp">
                            <div class="BTTTableStyle">
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <div id="stock_contentPane" data-dojo-props="ioMethod:dojo.xhrPost,ioArgs:{content:{dse_sessionId:'${dse_sessionId}'}}" style="text-align:left;" data-dojo-type="dijit.layout.ContentPane">
                                    <div style="width:100%;" class="BTTTableStyle">
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:repetitivepanel id="stock_repetitivePanel01_copy" dataNameForList="CurrentStockSale" dataNameForRow="SaleIndex" selectionMode="single">
                                            <div class="BTTTableStyle">
                                              <div class="BTTRowStyle">
                                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                                  <bttdojo:conditionalPanel id="stock_conditionalPanel01_copy_${index}" dataName="CurrentStockSale.${index}.upOrDonw">
                                                    <bttdojo:optionPanel id="stock_OptionPanel03_copy_${index}" optionValue="1" style="width:100%;height:100%;">
                                                      <div style="width:100%;height:100%;" class="BTTTableStyle">
                                                        <div class="BTTRowStyle">
                                                          <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                                            <bttdojo:label id="stock_label02_copy01_${index}" class=" fontWhiteColor" dataName="CurrentStockSale.${index}.saleType" text="Label"/>
                                                          </div>
                                                          <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                                          </div>
                                                          <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                                            <bttdojo:label id="stock_label03_copy01_${index}" class=" fontRedColor" dataName="CurrentStockSale.${index}.salePrice" text="Label"/>
                                                          </div>
                                                          <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                                          </div>
                                                          <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                                            <bttdojo:label id="stock_label04_copy01_${index}" class=" fontYellowColor" dataName="CurrentStockSale.${index}.saleAmount" text="Label"/>
                                                          </div>
                                                        </div>
                                                      </div>
                                                  </bttdojo:optionPanel>
                                                    <bttdojo:optionPanel id="stock_OptionPanel04_copy_${index}" optionValue="2" style="width:100%;height:100%;">
                                                      <div style="width:100%;height:100%;" class="BTTTableStyle">
                                                        <div class="BTTRowStyle">
                                                          <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                                            <bttdojo:label id="stock_label02_copy_copy_${index}" class=" fontWhiteColor" dataName="CurrentStockSale.${index}.saleType" text="%nls.svt/sale2"/>
                                                          </div>
                                                          <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                                          </div>
                                                          <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                                            <bttdojo:label id="stock_label03_copy_copy_${index}" class=" fontGreenColor" dataName="CurrentStockSale.${index}.salePrice" text="Label"/>
                                                          </div>
                                                          <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                                          </div>
                                                          <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                                            <bttdojo:label id="stock_label04_copy_copy_${index}" width="30px" class=" fontYellowColor" dataName="CurrentStockSale.${index}.saleAmount" text="Label" textWrap="false"/>
                                                          </div>
                                                        </div>
                                                      </div>
                                                  </bttdojo:optionPanel>
                                                </bttdojo:conditionalPanel>
                                                </div>
                                              </div>
                                            </div>
                                        </bttdojo:repetitivepanel>
                                        </div>
                                      </div>
                                    </div>
                                </div>
                                </div>
                              </div>
                            </div>
                        </bttdojo:form>
                        </div>
                      </div>
                    </div>
                </bttdojo:titlepane>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:titlepane id="stock_titlePane">
                    <div class="dijitReset BTTTableStyle" style="width:100%;height:100%;">
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:form id="stock_form01" errorPage="SVT/8104/stock/stock.jsp">
                            <div class="BTTTableStyle">
                              <div class="BTTRowStyle">
                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <div id="stock_contentPane01" data-dojo-props="ioArgs:{content:{dse_sessionId:'${dse_sessionId}'}}" style="text-align:left;" data-dojo-type="dijit.layout.ContentPane">
                                    <div style="width:100%;" class="BTTTableStyle">
                                      <div class="BTTRowStyle">
                                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                          <bttdojo:repetitivepanel id="stock_repetitivePanel01" dataNameForList="CurrentStockBuy" dataNameForRow="BuyIndex" selectionMode="single">
                                            <div class="BTTTableStyle">
                                              <div class="BTTRowStyle">
                                                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                                  <bttdojo:conditionalPanel id="stock_conditionalPanel01_${index}" dataName="CurrentStockBuy.${index}.upOrDonw">
                                                    <bttdojo:optionPanel id="stock_OptionPanel03_${index}" optionValue="1" style="width:100%;height:100%;">
                                                      <div style="width:100%;height:100%;" class="BTTTableStyle">
                                                        <div class="BTTRowStyle">
                                                          <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                                            <bttdojo:label id="stock_label02_${index}" class=" fontWhiteColor" dataName="CurrentStockBuy.${index}.buyType" text="Label"/>
                                                          </div>
                                                          <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                                          </div>
                                                          <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                                            <bttdojo:label id="stock_label03_${index}" class=" fontRedColor" dataName="CurrentStockBuy.${index}.buyPrice" text="Label"/>
                                                          </div>
                                                          <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                                          </div>
                                                          <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                                            <bttdojo:label id="stock_label04_${index}" class=" fontYellowColor" dataName="CurrentStockBuy.${index}.buyAmount" text="Label"/>
                                                          </div>
                                                        </div>
                                                      </div>
                                                  </bttdojo:optionPanel>
                                                    <bttdojo:optionPanel id="stock_OptionPanel04_${index}" optionValue="2" style="width:100%;height:100%;">
                                                      <div style="width:100%;height:100%;" class="BTTTableStyle">
                                                        <div class="BTTRowStyle">
                                                          <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                                            <bttdojo:label id="stock_label02_copy_${index}" class=" fontWhiteColor" dataName="CurrentStockBuy.${index}.buyType" text="Label"/>
                                                          </div>
                                                          <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                                          </div>
                                                          <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                                            <bttdojo:label id="stock_label03_copy_${index}" class=" fontGreenColor" dataName="CurrentStockBuy.${index}.buyPrice" text="Label"/>
                                                          </div>
                                                          <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                                          </div>
                                                          <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                                            <bttdojo:label id="stock_label04_copy_${index}" width="30px" class=" fontYellowColor" dataName="CurrentStockBuy.${index}.buyAmount" text="Label" textWrap="false"/>
                                                          </div>
                                                        </div>
                                                      </div>
                                                  </bttdojo:optionPanel>
                                                </bttdojo:conditionalPanel>
                                                </div>
                                              </div>
                                            </div>
                                        </bttdojo:repetitivepanel>
                                        </div>
                                      </div>
                                    </div>
                                </div>
                                </div>
                              </div>
                            </div>
                        </bttdojo:form>
                        </div>
                      </div>
                    </div>
                </bttdojo:titlepane>
                </div>
              </div>
              <div class="BTTRowStyle">
                <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <bttdojo:repetitivepanel id="stock_repetitivePanel" dataNameForList="CurrentStockInfoList">
                    <div class="BTTTableStyle">
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:conditionalPanel id="stock_conditionalPanel_${index}" dataName="CurrentStockInfoList.${index}.upOrDonw">
                            <bttdojo:optionPanel id="stock_OptionPanel01_${index}" optionValue="1" style="width:100%;height:100%;">
                              <div style="width:100%;height:100%;" class="BTTTableStyle">
                                <div class="BTTRowStyle">
                                  <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                      <div id="stock_panel01_${index}" class="BTTTableStyle">
                                        <div class="BTTRowStyle">
                                          <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                            <bttdojo:label id="stock_label01_${index}" class="fontWriteColor fontWhiteColor" dataName="CurrentStockInfoList.${index}.key" text="Label"/>
                                          </div>
                                          <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                            <bttdojo:label id="stock_label_${index}" class=" fontRedColor" dataName="CurrentStockInfoList.${index}.value" text="Label"/>
                                          </div>
                                        </div>
                                      </div>
                                  </div>
                                </div>
                              </div>
                          </bttdojo:optionPanel>
                            <bttdojo:optionPanel id="stock_OptionPanel02_${index}" optionValue="2" style="width:100%;height:100%;">
                              <div style="width:100%;height:100%;" class="BTTTableStyle">
                                <div class="BTTRowStyle">
                                  <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                      <div id="stock_panel01_copy_${index}" class="BTTTableStyle">
                                        <div class="BTTRowStyle">
                                          <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                            <bttdojo:label id="stock_label01_copy_${index}" class=" fontWhiteColor" dataName="CurrentStockInfoList.${index}.key" text="Label"/>
                                          </div>
                                          <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                            <bttdojo:label id="stock_label_copy_${index}" class=" fontGreenColor" dataName="CurrentStockInfoList.${index}.value" text="Label"/>
                                          </div>
                                        </div>
                                      </div>
                                  </div>
                                </div>
                              </div>
                          </bttdojo:optionPanel>
                        </bttdojo:conditionalPanel>
                        </div>
                      </div>
                    </div>
                </bttdojo:repetitivepanel>
                </div>
              </div>
            </div>
        </div>
        </div>
      </div>
    </div>
  </div>

<div url="jsp/SVT/8104/stock/stock.js" prefix="" dojoType="com.ibm.btt.event.ECALoader"></div>
<!-- applet id="printApplet" name="printApplet" code="com.ibm.btt.print.applets.PrintrApplet" codebase="applets" archive="bttprint.jar,JSON4J.jar" style="width:0px; height:0px;"></applet-->
</body>
</html>