<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from EditableTable.xui by Administrator, on Tue Jan 29 10:56:09 CST 2013 -->
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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/EditableTablePage/EditableTable.js"> </script>
  <table id="EditableTable_panel">
    <tr>
      <td align="left" valign="top">
        <bttdojo:form id="EditableTable_form" flowId="comboboxFlow" errorPage="EditableTablePage/EditableTable.jsp">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="EditableTable_label" text="editable table: this panel is Event onKeyDown" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:table id="EditableTable_table" dataName="selectAccountList" dataNameForList="EditableAccountList" selectionMode="multiple" selectionRequired="true" flowId="editableTableFlow" isActionable="true" textWrap="false" isPageable="false">
                  <bttdojo:column widget="TextBox" align="left" dataName="AccountName" width="80" type="String" hidden="true" text="%nls.testtable/AccountName"/>
                  <bttdojo:column widget="Select" align="left" dataName="TradeTime" width="80" text="%nls.testtable/TradeTime" storeURL="listFiles/tradeTimeForSelect.js"/>
                  <bttdojo:column align="left" dataName="TradeTime" width="80" text="%nls.testtable/TradeTimeValue"/>
                  <bttdojo:column dataNameForList="AccountTypeForSelect" widget="Select" align="left" dataName="AccountType" width="80" labelField="labelField" valueField="valueField" text="%nls.testtable/AccountType"/>
                  <bttdojo:column align="left" dataName="AccountType" width="80" text="%nls.testtable/AccountTypeValue"/>
                  <bttdojo:column pattern="yyyy-MM-dd" widget="TextBox" align="left" dataName="AccountOpeningDate" width="100" type="Date" text="%nls.testtable/AccountOpeningDate"/>
                  <bttdojo:column currency="EUR" numberType="bigDecimal" widget="TextBox" align="left" dataName="AccountBlance" width="80" type="Currency" text="%nls.testtable/AccountBlance"/>
                  <bttdojo:column widget="ComboBox" align="left" dataName="Rate" width="80" text="%nls.testtable/Rate" storeURL="listFiles/rateForCombo.js"/>
                  <bttdojo:column dataNameForList="LocaltionForComboBox" widget="ComboBox" align="left" dataName="Localtion" width="80" labelField="labelField" text="%nls.testtable/Localtion"/>
                  <bttdojo:column unCheckedValue="false" widget="CheckBox" align="left" dataName="Usable" width="80" checkedValue="true" text="%nls.testtable/Usable"/>
                  <bttdojo:column widget="LabelFromList" align="left" dataName="accountAttribution" width="80" text="%nls.testtable/accountAttribution" storeURL="listFiles/accountAttribution.js"/>
                  <bttdojo:column widget="Image" align="left" dataName="ImageField" width="80" hidden="true" text="%nls.testtable/Image"/>
                </bttdojo:table>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:radio id="EditableTable_radio01" dataName="AccountInfoRecord.ImageField" text="Radio" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="top">
                  <table id="EditableTable_panel01">
                    <tr>
                      <td align="left" valign="top">
                          <table id="EditableTable_panel02">
                            <tr>
                              <td align="left" valign="top">
                                <bttdojo:group id="EditableTable_group" text="Test in group" textWrap="false">
                                  <table>
                                    <tr>
                                      <td align="left" valign="middle">
                                        <bttdojo:a id="EditableTable_link" text="Link to \'table in group\' page" flowEvent="LinkToGroup" textWrap="false"/>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td align="left" valign="middle">
                                        <bttdojo:a id="EditableTable_link02" text="Link to popup page" flowEvent="group popup" textWrap="false"/>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td align="left" valign="middle">
                                        <bttdojo:button id="EditableTable_button10" type="submit" text="Submit to group popup" flowEvent="group popup" textWrap="false"/>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td align="left" valign="top">
                                          <table id="EditableTable_panel04">
                                            <tr>
                                              <td align="left" valign="middle">
                                                <bttdojo:button id="EditableTable_button" type="submit" text="submit to group page" flowEvent="submit to group page" icon="a" textWrap="false"/>
                                              </td>
                                              <td align="left" valign="middle">
                                                <bttdojo:button id="EditableTable_button02" type="submit" text="submit to group popup page" flowEvent="submit to group popup page" textWrap="false"/>
                                              </td>
                                            </tr>
                                          </table>
                                      </td>
                                    </tr>
                                  </table>
                                </bttdojo:group>
                              </td>
                              <td align="left" valign="top">
                                <bttdojo:group id="EditableTable_group04" text="Group" width="353px" height="79px" textWrap="false">
                                  <table style="width:353px;height:79px;">
                                    <tr>
                                      <td align="left" valign="middle">
                                        <bttdojo:button id="EditableTable_button04" type="button" text="Hide/Show Column" textWrap="false"/>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td align="left" valign="middle">
                                        <bttdojo:label id="EditableTable_label01" for="EditableTable_button04" textWrap="false"/>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td align="left" valign="middle">
                                        <bttdojo:label id="EditableTable_label02" text="E:Button.onClick,C:isColumnVisible(0),A:Hide/Show Column" textWrap="false"/>
                                      </td>
                                    </tr>
                                  </table>
                                </bttdojo:group>
                              </td>
                            </tr>
                            <tr>
                              <td align="left" valign="top">
                                <bttdojo:group id="EditableTable_group01" text="Test inTabbedpane" textWrap="false">
                                  <table>
                                    <tr>
                                      <td align="left" valign="middle">
                                        <bttdojo:a id="EditableTable_link01" text="Link to \'table in TabbedPane\' page" flowEvent="LinkToPane" textWrap="false"/>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td align="left" valign="middle">
                                        <bttdojo:a id="EditableTable_link04" text="Link to popup page" flowEvent="pane popup" textWrap="false"/>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td align="left" valign="top">
                                          <table id="EditableTable_panel05">
                                            <tr>
                                              <td align="left" valign="middle">
                                                <bttdojo:button id="EditableTable_button01" type="submit" text="submit to pane page" flowEvent="submit to pane page" textWrap="false"/>
                                              </td>
                                              <td align="left" valign="middle">
                                                <bttdojo:button id="EditableTable_button03" type="submit" text="submit to pane popup page" flowEvent="submit to pane popup page" textWrap="false"/>
                                              </td>
                                            </tr>
                                          </table>
                                      </td>
                                    </tr>
                                  </table>
                                </bttdojo:group>
                              </td>
                              <td align="left" valign="top">
                                <bttdojo:group id="EditableTable_group05" text="Group" width="353px" height="72px" textWrap="false">
                                  <table style="width:353px;height:72px;">
                                    <tr>
                                      <td align="left" valign="middle">
                                        <bttdojo:button id="EditableTable_button05" type="button" text="setCellValueByName" textWrap="false"/>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td align="left" valign="middle">
                                        <bttdojo:label id="EditableTable_label03" for="EditableTable_button05" textWrap="false"/>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td align="left" valign="middle">
                                        <bttdojo:label id="EditableTable_label04" text="setCellValueByName(Name,RowIndex,Value)" textWrap="false"/>
                                      </td>
                                    </tr>
                                  </table>
                                </bttdojo:group>
                              </td>
                            </tr>
                            <tr>
                              <td align="left" valign="top">
                                  <table id="EditableTable_panel03">
                                    <tr>
                                      <td align="left" valign="top">
                                        <bttdojo:group id="EditableTable_group02" text="Test in \'manipulate table\'" textWrap="false">
                                          <table>
                                            <tr>
                                              <td align="left" valign="middle">
                                                <bttdojo:a id="EditableTable_link03" text="Link to \'manipulate table\' page" flowEvent="manipulatetable" textWrap="false"/>
                                              </td>
                                            </tr>
                                          </table>
                                        </bttdojo:group>
                                      </td>
                                    </tr>
                                  </table>
                              </td>
                              <td align="left" valign="top">
                                <bttdojo:group id="EditableTable_group06" text="Group" width="353px" height="76px" textWrap="false">
                                  <table style="width:353px;height:76px;">
                                    <tr>
                                      <td align="left" valign="middle">
                                        <bttdojo:button id="EditableTable_button06" type="button" text="setCellValueByIndex" textWrap="false"/>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td align="left" valign="middle">
                                        <bttdojo:label id="EditableTable_label05" for="EditableTable_button06" textWrap="false"/>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td align="left" valign="middle">
                                        <bttdojo:label id="EditableTable_label06" text="setCellValueByIndex(ColumnIndex,RowIndex,Value)" textWrap="false"/>
                                      </td>
                                    </tr>
                                  </table>
                                </bttdojo:group>
                              </td>
                            </tr>
                            <tr>
                              <td align="left" valign="top">
                                <bttdojo:group id="EditableTable_group03" text="Test selection and bombo box" textWrap="false">
                                  <table>
                                    <tr>
                                      <td align="left" valign="middle">
                                        <bttdojo:a id="EditableTable_link05" text="Link to \'selection and combo box\' page" flowEvent="selection and combo box" textWrap="false"/>
                                      </td>
                                    </tr>
                                  </table>
                                </bttdojo:group>
                              </td>
                              <td align="left" valign="top">
                                <bttdojo:group id="EditableTable_group07" text="Group" width="353px" height="77px" textWrap="false">
                                  <table style="width:353px;height:77px;">
                                    <tr>
                                      <td align="left" valign="middle">
                                        <bttdojo:button id="EditableTable_button07" type="button" text="getValueInSelectedItem" textWrap="false"/>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td align="left" valign="middle">
                                        <bttdojo:label id="EditableTable_label07" for="EditableTable_button07" textWrap="false"/>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td align="left" valign="middle">
                                        <bttdojo:label id="EditableTable_label08" text="getValueInSelectedItem(ItemId)" textWrap="false"/>
                                      </td>
                                    </tr>
                                  </table>
                                </bttdojo:group>
                              </td>
                            </tr>
                            <tr>
                              <td align="left" valign="top">
                                <bttdojo:group id="EditableTable_group08" text="Group" width="325px" height="63px" textWrap="false">
                                  <table style="width:325px;height:63px;">
                                    <tr>
                                      <td align="left" valign="middle">
                                        <bttdojo:button id="EditableTable_button08" type="button" text="Condition:getCellValueByIndex" textWrap="false"/>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td align="left" valign="middle">
                                        <bttdojo:label id="EditableTable_label09" textWrap="false"/>
                                      </td>
                                    </tr>
                                  </table>
                                </bttdojo:group>
                              </td>
                              <td align="left" valign="top">
                                <bttdojo:group id="EditableTable_group09" text="Group" width="353px" height="62px" textWrap="false">
                                  <table style="width:353px;height:62px;">
                                    <tr>
                                      <td align="left" valign="middle">
                                        <bttdojo:button id="EditableTable_button09" type="button" text="Condition:Expression:getCellValueByName" textWrap="false"/>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td align="left" valign="middle">
                                        <bttdojo:label id="EditableTable_label10" textWrap="false"/>
                                      </td>
                                    </tr>
                                  </table>
                                </bttdojo:group>
                              </td>
                            </tr>
                            <tr>
                              <td align="left" valign="top">
                                <bttdojo:group id="EditableTable_group10" text="Group" width="325px" height="50px" textWrap="false">
                                  <table style="width:325px;height:50px;">
                                    <tr>
                                      <td align="left" valign="middle">
                                        <bttdojo:checkbox id="EditableTable_checkBox" dataName="AccountInfoRecord.accountAttribution" checkedValue="true" text="CheckBox" textWrap="false"/>
                                      </td>
                                    </tr>
                                  </table>
                                </bttdojo:group>
                              </td>
                              <td align="left" valign="top">
                                <bttdojo:group id="EditableTable_group11" text="Group" width="353px" height="51px" textWrap="false">
                                  <table style="width:353px;height:51px;">
                                    <tr>
                                      <td align="left" valign="middle">
                                        <bttdojo:radio id="EditableTable_radio" dataName="AccountInfoRecord.Localtion" text="Radio" textWrap="false"/>
                                      </td>
                                    </tr>
                                  </table>
                                </bttdojo:group>
                              </td>
                            </tr>
                          </table>
                      </td>
                    </tr>
                  </table>
              </td>
            </tr>
          </table>
        </bttdojo:form>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:button id="EditableTable_button11" type="submit" text="Button" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td>
      </td>
    </tr>
  </table>

</body>
</html>