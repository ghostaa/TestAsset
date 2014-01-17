<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- Generated from LanguageSelectionPage.xui by Administrator, on Sat Apr 27 11:06:24 CST 2013 -->
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
	padding:1px;
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
<script type="text/javascript" src="js/com/ibm/btt/btt.js"></script>
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
<bttdojo:config>[{"id":"LanguageSelectionPage_mainForm","name":"Form"}, {"style":"","id":"LanguageSelectionPage_LanguageListNLS","name":"Label","text":"%nls.bttsample\/Select_The_Language_To_Display"}, {"style":"","dataNameForList":"LanguageList","dataName":"valueToDisplay","labelField":"languageLabel","valueField":"languageValue","id":"LanguageSelectionPage_LanguageList","name":"SelectList"}, {"style":"","type":"submit","id":"LanguageSelectionPage_button","name":"Button","flowEvent":"VIEW","text":"VIEW"}]</bttdojo:config>
  <div id="LanguageSelectionPage_null" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:form id="LanguageSelectionPage_mainForm" errorPage="SubFolderTestCases/LanguageSelectionPage.jsp">
          <div class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="LanguageSelectionPage_LanguageListNLS" text="%nls.bttsample/Select_The_Language_To_Display"/>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:select id="LanguageSelectionPage_LanguageList" dataName="valueToDisplay" dataNameForList="LanguageList" labelField="languageLabel" valueField="languageValue"/>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="center" style="vertical-align:middle;">
                <bttdojo:button id="LanguageSelectionPage_button" type="submit" text="VIEW" flowEvent="VIEW"/>
              </div>
            </div>
          </div>
        </bttdojo:form>
      </div>
    </div>
  </div>

</body>
</html>
