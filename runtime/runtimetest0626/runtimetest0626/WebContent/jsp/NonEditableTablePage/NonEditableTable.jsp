<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from NonEditableTable.xui by Administrator, on Mon Jan 28 14:33:15 CST 2013 -->
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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/NonEditableTablePage/NonEditableTable.js"> </script>
  <table id="NonEditableTable_panel">
    <tr>
      <td align="left" valign="top">
        <bttdojo:form id="NonEditableTable_form" flowEvent="LinkToGroup" errorPage="NonEditableTablePage/NonEditableTable.jsp">
          <table>
            <tr>
              <td align="left" valign="top">
                  <table id="NonEditableTable_panel01">
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="NonEditableTable_label" text=" non-editable table" textWrap="false"/>
                      </td>
                    </tr>
                  </table>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:table id="NonEditableTable_table" dataName="selectAccountList" dataNameForList="nonEditableAccountList" selectionMode="multiple" selectionRequired="true" flowEvent="manipulatetable" isActionable="true" width="597px" height="100px" textWrap="false" isPageable="false">
                  <bttdojo:column align="left" dataName="AccountName" width="80" hidden="true" text="%nls.testtable/AccountName"/>
                  <bttdojo:column align="left" dataName="TradeTime" width="80" hidden="true" text="%nls.testtable/TradeTime"/>
                  <bttdojo:column align="left" dataName="MaximumAmount" width="80" hidden="false" text="%nls.testtable/MaximumAmount"/>
                  <bttdojo:column align="left" dataName="AccountOpeningDate" width="100" hidden="false" text="%nls.testtable/AccountOpeningDate"/>
                  <bttdojo:column align="left" dataName="AccountBlance" width="80" hidden="false" text="%nls.testtable/AccountBlance"/>
                  <bttdojo:column align="left" dataName="Rate" width="80" hidden="false" text="%nls.testtable/Rate"/>
                  <bttdojo:column widget="Image" align="left" dataName="Usable" width="80" hidden="false" text="%nls.testtable/Usable"/>
                </bttdojo:table>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:radio id="NonEditableTable_radio" dataName="AccountInfo.ImageField" text="Radio" tabIndex="1" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="NonEditableTable_button05" type="button" text="table.getValueInFirstSelected(AccountName)" tabIndex="2" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="NonEditableTable_button06" type="button" text="table.getLengthOfSelectedRow" tabIndex="3" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="NonEditableTable_button04" type="button" text="Click this button make the table focusOn" tabIndex="4" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="NonEditableTable_button07" type="button" text="Click this button make this button focusOn" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="NonEditableTable_label01" text="Table Onfocus event make this text changed. Is For Example" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="top">
                  <table id="NonEditableTable_panel02">
                    <tr>
                      <td align="left" valign="top">
                        <bttdojo:group id="NonEditableTable_group" text="Test in group" textWrap="false">
                          <table>
                            <tr>
                              <td align="left" valign="middle">
                                <bttdojo:a id="NonEditableTable_link" text="Link to \'table in group\' page" flowEvent="LinkToGroup" textWrap="false"/>
                              </td>
                            </tr>
                            <tr>
                              <td align="left" valign="middle">
                                <bttdojo:a id="NonEditableTable_link02" text="Link to popup page" flowEvent="group popup" tabIndex="1232" textWrap="false"/>
                              </td>
                            </tr>
                            <tr>
                              <td align="left" valign="top">
                                  <table id="NonEditableTable_panel04">
                                    <tr>
                                      <td align="left" valign="middle">
                                        <bttdojo:button id="NonEditableTable_button" type="submit" text="submit to group page" flowEvent="submit to group page" textWrap="false"/>
                                      </td>
                                      <td align="left" valign="middle">
                                        <bttdojo:button id="NonEditableTable_button02" type="submit" text="submit to group popup page" flowEvent="submit to group popup page" tabIndex="1234" textWrap="false"/>
                                      </td>
                                    </tr>
                                  </table>
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
                        <bttdojo:group id="NonEditableTable_group01" text="Test inTabbedpane" textWrap="false">
                          <table>
                            <tr>
                              <td align="left" valign="middle">
                                <bttdojo:a id="NonEditableTable_link01" text="Link to \'table in TabbedPane\' page" flowEvent="LinkToPane" textWrap="false"/>
                              </td>
                            </tr>
                            <tr>
                              <td align="left" valign="middle">
                                <bttdojo:a id="NonEditableTable_link04" text="Link to popup page" flowEvent="pane popup" textWrap="false"/>
                              </td>
                            </tr>
                            <tr>
                              <td align="left" valign="top">
                                  <table id="NonEditableTable_panel05">
                                    <tr>
                                      <td align="left" valign="middle">
                                        <bttdojo:button id="NonEditableTable_button01" type="submit" text="submit to pane page" flowEvent="submit to pane page" textWrap="false"/>
                                      </td>
                                      <td align="left" valign="middle">
                                        <bttdojo:button id="NonEditableTable_button03" type="submit" text="submit to pane popup page" flowEvent="submit to pane popup page" textWrap="false"/>
                                      </td>
                                    </tr>
                                  </table>
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
                          <table id="NonEditableTable_panel03">
                            <tr>
                              <td align="left" valign="top">
                                <bttdojo:group id="NonEditableTable_group02" text="Test in \'manipulate table\'" textWrap="false">
                                  <table>
                                    <tr>
                                      <td align="left" valign="middle">
                                        <bttdojo:a id="NonEditableTable_link03" text="Link to \'manipulate table\' page" flowEvent="manipulatetable" textWrap="false"/>
                                      </td>
                                    </tr>
                                  </table>
                                </bttdojo:group>
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