<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from TF.xui by Administrator, on Tue Jan 29 10:56:25 CST 2013 -->
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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/PaginationTablePage/TF/TF.js"> </script>
  <table id="TF_panel">
    <tr>
      <td align="left" valign="top">
        <bttdojo:form id="TF_form" errorPage="PaginationTablePage/TF/TF.jsp">
          <table>
            <tr>
              <td align="left" valign="top">
                  <table id="TF_panel01">
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="TF_label" text="TFtable" textWrap="false"/>
                      </td>
                    </tr>
                  </table>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:table id="TF_tableTF" dataName="AccountInfoRecord" dataNameForList="AccountInfoList" isPageable="true" selectionMode="single" selectionRequired="true" textWrap="false" operationName="PAG_PaginationTablePage$TF$TF_tableTF" directPagination="true" paginationWhenLoading="false" rowsPerPage="10" timeout="50000">
                  <bttdojo:column widget="TextBox" align="left" dataName="AccountName" width="80" type="String" hidden="true" text="1"/>
                  <bttdojo:column dataNameForList="AccountTypeForSelect" widget="Select" align="left" dataName="AccountType" width="80" labelField="labelField" valueField="valueField" hidden="true" text="2"/>
                  <bttdojo:column widget="Select" align="left" dataName="TradeTime" width="80" text="3" storeURL="listFiles/tradeTimeForSelect.js"/>
                  <bttdojo:column numberType="bigDecimal" widget="TextBox" align="left" dataName="MaximumAmount" width="80" type="Number" decimalPlaces="3" text="4"/>
                  <bttdojo:column pattern="yyyy-MM-dd" widget="TextBox" align="left" dataName="AccountOpeningDate" width="100" type="Date" text="5"/>
                  <bttdojo:column currency="EUR" numberType="bigDecimal" widget="TextBox" align="left" dataName="AccountBlance" width="80" type="Currency" text="6"/>
                </bttdojo:table>
              </td>
            </tr>
            <tr>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="top">
                <bttdojo:group id="TF_group02" text="Disable" width="916px" height="64px" textWrap="false">
                  <table style="width:916px;height:64px;">
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:button id="TF_button01" type="button" text="Disable is true" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:button id="TF_button02" type="button" text="Disable is false" textWrap="false"/>
                      </td>
                    </tr>
                  </table>
                </bttdojo:group>
              </td>
            </tr>
            <tr>
              <td align="left" valign="top">
                  <table id="TF_panel02">
                    <tr>
                      <td align="left" valign="top">
                        <bttdojo:group id="TF_group" text="Test in group" textWrap="false">
                          <table>
                            <tr>
                              <td align="left" valign="middle">
                                <bttdojo:a id="TF_link" text="Link to \'TFtable in group\'" flowEvent="LinkToGroup" textWrap="false"/>
                              </td>
                            </tr>
                            <tr>
                              <td align="left" valign="middle">
                                <bttdojo:a id="TF_link02" text="Link to \'TFtable in popup group\'" flowEvent="group popup" textWrap="false"/>
                              </td>
                            </tr>
                          </table>
                        </bttdojo:group>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="top">
                        <bttdojo:group id="TF_group01" text="Test in Tabbedpane" textWrap="false">
                          <table>
                            <tr>
                              <td align="left" valign="middle">
                                <bttdojo:a id="TF_link01" text="Link to \'TFtable in TabbedPane\'" flowEvent="LinkToPane" textWrap="false"/>
                              </td>
                            </tr>
                            <tr>
                              <td align="left" valign="middle">
                                <bttdojo:a id="TF_link04" text="Link to \'TFtable in popup TabbedPane\'" flowEvent="pane popup" textWrap="false"/>
                              </td>
                            </tr>
                          </table>
                        </bttdojo:group>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="top">
                          <table id="TF_panel03">
                            <tr>
                              <td>
                              </td>
                            </tr>
                          </table>
                      </td>
                      <td>
                      </td>
                    </tr>
                  </table>
              </td>
            </tr>
          </table>
        </bttdojo:form>
      </td>
    </tr>
  </table>

</body>
</html>