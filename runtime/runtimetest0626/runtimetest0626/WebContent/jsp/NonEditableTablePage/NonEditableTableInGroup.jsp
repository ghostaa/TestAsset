<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from NonEditableTableInGroup.xui by Administrator, on Tue Jan 29 10:56:17 CST 2013 -->
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
@import "js/com/ibm/btt/dijit/templates/message.css";
@import "css/dijit/main.css";
@import "css/dijit/dijit.css";
@import "css/dijit/FileUpload.css";
@import "css/dijit/Grid.css";
@import "css/dijit/Group.css";
@import "css/dijit/Label.css";
@import "css/dijit/ScreenCover.css";
@import "css/dijit/show.css";




.dojoxGrid table { margin: 0; }
.dj_gecko .dijitTextBoxReadOnly INPUT.dijitInputInner {
    -moz-user-input: auto;
}
.dj_gecko .dijitTextBoxReadOnlyFocused INPUT.dijitInputInner {
	-moz-user-input: none;
}
</style>
<script>
	var djConfig =  {
		baseUrl:"js/dojo/",
		<bttdojo:locale/>,
		isDebug: false, 
		parseOnLoad: true
	};
</script>

<script type="text/javascript" src="js/dojo/dojo_BTT.js" ></script>
<script type="text/javascript" src="js/com/ibm/btt/btt.js"></script>

<script type="text/javascript" >
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
		engine.registerKeys("http://9.181.87.190:9082/runtimetest0626/js/attendGlobalKey.js");
		
		
	}
	<%if(utb.ajaxNavigationEnabled()){%>
		dojo.require("dojo.back");
		var state = {
		    back: function() { /* window.engine.onBack(); */},
		    forward: function() { /* window.engine.onForward(); */ }
		};
		dojo.back.setInitialState(state);
	<%}%>

</script>
</head>
<body class="claro" style="visibility:hidden">
  <table id="NonEditableTableInGroup_panel">
    <tr>
      <td align="left" valign="top">
        <bttdojo:form id="NonEditableTableInGroup_form" flowEvent="returnToNonEditableTable" errorPage="NonEditableTablePage/NonEditableTableInGroup.jsp">
          <table>
            <tr>
              <td align="left" valign="top">
                  <table id="NonEditableTableInGroup_panel01">
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:a id="NonEditableTableInGroup_link" text=" non-editable table" flowEvent="returnToNonEditableTable" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="NonEditableTableInGroup_label" text=" -> non-editable table in group" textWrap="false"/>
                      </td>
                    </tr>
                  </table>
              </td>
            </tr>
            <tr>
              <td align="left" valign="top">
                <bttdojo:group id="NonEditableTableInGroup_group" text="Group" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:table id="NonEditableTableInGroup_table" dataName="AccountInfo.AccountName" dataNameForList="nonEditableAccountList" flowEvent="returnToNonEditableTable" isActionable="true" textWrap="false" isPageable="false">
                          <bttdojo:column align="left" dataName="AccountName" width="80" text="%nls.testtable/AccountName"/>
                          <bttdojo:column align="left" dataName="TradeTime" width="80" text="%nls.testtable/TradeTime"/>
                          <bttdojo:column align="left" dataName="MaximumAmount" width="80" text="%nls.testtable/MaximumAmount"/>
                          <bttdojo:column align="left" dataName="AccountOpeningDate" width="80" text="%nls.testtable/AccountOpeningDate"/>
                          <bttdojo:column align="left" dataName="AccountBlance" width="80" text="%nls.testtable/AccountBlance"/>
                          <bttdojo:column align="left" dataName="Rate" width="80" text="%nls.testtable/Rate"/>
                          <bttdojo:column align="left" dataName="Usable" width="80" text="%nls.testtable/Usable"/>
                        </bttdojo:table>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:checkbox id="NonEditableTableInGroup_checkBox" dataName="AccountInfo.ImageField" checkedValue="true" text="CheckBox" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="top">
                          <table id="NonEditableTableInGroup_panel02">
                            <tr>
                              <td align="left" valign="middle">
                                <bttdojo:button id="NonEditableTableInGroup_button" type="submit" text="to group popup page" flowEvent="to group popup page" textWrap="false"/>
                              </td>
                              <td align="left" valign="middle">
                                <bttdojo:button id="NonEditableTableInGroup_button01" type="submit" text="to pane page" flowEvent="to pane page" textWrap="false"/>
                              </td>
                            </tr>
                          </table>
                      </td>
                    </tr>
                  </table>
                </bttdojo:group>
              </td>
            </tr>
          </table>
        </bttdojo:form>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="NonEditableTableInGroup_label01" text="This is a Link From From Action" textWrap="false"/>
      </td>
    </tr>
  </table>

</body>
</html>