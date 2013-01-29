<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from comboboxtInFlow.xui by Administrator, on Tue Jan 29 10:56:46 CST 2013 -->
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



@import "css/dijit/main.css";

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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/comboboxtInFlow.js"> </script>
  <table id="comboboxtInFlow_panel">
    <tr>
      <td>
        <bttdojo:tabbedpane id="comboboxtInFlow_tabbedPane" textWrap="false">
          <bttdojo:contentpane id="comboboxtInFlow_ContentPane01" title="submit the data in Flow">
            <table style="table-layout:fixed">
              <tr>
                <td>
                  <bttdojo:form id="comboboxtInFlow_form" errorPage="comboboxtInFlow.jsp">
                    <table>
                      <tr>
                        <td>
                          <bttdojo:group id="comboboxtInFlow_group" text="Functional Scenario in Flow" textWrap="false">
                            <table>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="comboboxtInFlow_label01_copy" text="Combobox from dataName" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:combo id="comboboxtInFlow_combo" dataName="selectData.selectName" storeURL="listFiles/select/normal.js" dataNameForList="selectDataList" labelField="labelselect" textWrap="false"/>
                                </td>
                                <td colspan="2" align="left" valign="middle">
                                  <bttdojo:label id="comboboxtInFlow_label08" text="dataNameForList prior to storeURL" textWrap="false"/>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="comboboxtInFlow_label" text="Combobox from dataName,no default" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:combo id="comboboxtInFlow_combo01" dataName="selectData.selectName2" storeURL="listFiles/select/normal.js" dataNameForList="selectDataList" labelField="labelselect" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="comboboxtInFlow_label42" text="dataNameForList prior to storeURL" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="comboboxtInFlow_text02" textWrap="false"/>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="comboboxtInFlow_label01" text="Combobox from normal js" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:combo id="comboboxtInFlow_combo02" dataName="selectData.selectName3" storeURL="listFiles/select/normal.js" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:button id="comboboxtInFlow_button14" type="button" text="Button" textWrap="false"/>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="comboboxtInFlow_label02" text="Combobox from NLS js" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:combo id="comboboxtInFlow_combo03" dataName="selectData.selectName4" storeURL="listFiles/select/i18n.js" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="comboboxtInFlow_label03" text="Combobox from abnormal JS" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:combo id="comboboxtInFlow_combo04" dataName="selectData.selectName5" storeURL="listFiles/select/gender.js" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:button id="comboboxtInFlow_button" type="submit" text="Submit" flowEvent="flow" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td>
                                </td>
                                <td>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:button id="comboboxtInFlow_button15" type="submit" text="Submit By Popup Page" flowEvent="viewEvt" textWrap="false"/>
                                </td>
                                <td>
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
                <td>
                  <bttdojo:form id="comboboxtInFlow_form01" errorPage="comboboxtInFlow.jsp">
                    <table>
                      <tr>
                        <td>
                          <bttdojo:group id="comboboxtInFlow_group09" text="Static file loading test" textWrap="false">
                            <table>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="comboboxtInFlow_label43" text="ECA loading data" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:combo id="comboboxtInFlow_combo05" dataName="selectData.selectName2" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:button id="comboboxtInFlow_button02" type="button" text="Load" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="comboboxtInFlow_label50" text="display data" textWrap="false"/>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="comboboxtInFlow_label44" text="ECA loading data" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:combo id="comboboxtInFlow_combo06" dataName="selectData.selectName2" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:button id="comboboxtInFlow_button03" type="button" text="Load" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:button id="comboboxtInFlow_button04" type="button" text="Reload" visibility="hidden" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="comboboxtInFlow_label45" text="load no  existing data , then reload the other data" textWrap="false"/>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="comboboxtInFlow_label27" text="Reveal Above a Combo\'s Value" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="comboboxtInFlow_text01" dataName="selectData.selectName2" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:button id="comboboxtInFlow_button06" type="button" text="Reveal" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="comboboxtInFlow_label46" text="Mass data" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:combo id="comboboxtInFlow_combo07" dataName="selectData.selectName2" storeURL="listFiles/select/massdata.js" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="comboboxtInFlow_label49" text="display mass data" textWrap="false"/>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="comboboxtInFlow_label47" text="Malformed" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:combo id="comboboxtInFlow_combo08" dataName="selectData.selectName2" storeURL="listFiles/select/malformed.js" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="comboboxtInFlow_label48" text="no data display" textWrap="false"/>
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
                <td>
                </td>
              </tr>
            </table>
          </bttdojo:contentpane>
          <bttdojo:contentpane id="comboboxtInFlow_ContentPane02" title="propertyInView">
            <table style="table-layout:fixed">
              <tr>
                <td>
                  <bttdojo:group id="comboboxtInFlow_group01" text="Disabled" textWrap="false">
                    <table>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:combo id="comboboxtInFlow_combo09" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" disabled="true" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label04" text="True" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:combo id="comboboxtInFlow_combo10" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label05" text="False" textWrap="false"/>
                        </td>
                      </tr>
                    </table>
                  </bttdojo:group>
                </td>
              </tr>
              <tr>
                <td>
                  <bttdojo:group id="comboboxtInFlow_group02" text="ReadOnly" textWrap="false">
                    <table>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:combo id="comboboxtInFlow_combo11" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" readOnly="true" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label06" text="True" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:combo id="comboboxtInFlow_combo12" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label07" text="False" textWrap="false"/>
                        </td>
                      </tr>
                    </table>
                  </bttdojo:group>
                </td>
              </tr>
              <tr>
                <td>
                  <bttdojo:group id="comboboxtInFlow_group03" text="Hint" textWrap="false">
                    <table>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:combo id="comboboxtInFlow_combo13" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" hint="old hint" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:button id="comboboxtInFlow_button01" type="button" text="Change the hint" textWrap="false"/>
                        </td>
                      </tr>
                    </table>
                  </bttdojo:group>
                </td>
              </tr>
              <tr>
                <td>
                  <bttdojo:group id="comboboxtInFlow_group04" text="shortCut" textWrap="false">
                    <table>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:combo id="comboboxtInFlow_combo14" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label09" text="Alt+W or Shift+Alt+W" textWrap="false"/>
                        </td>
                      </tr>
                    </table>
                  </bttdojo:group>
                </td>
              </tr>
              <tr>
                <td>
                  <bttdojo:group id="comboboxtInFlow_group05" text="Visibility" textWrap="false">
                    <table>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:combo id="comboboxtInFlow_combo15" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label12" text="visible" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label10" text="________________________" textWrap="false"/>
                        </td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:combo id="comboboxtInFlow_combo16" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" visibility="hidden" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label13" text="hidden" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label11" text="________________________" textWrap="false"/>
                        </td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:combo id="comboboxtInFlow_combo17" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" visibility="gone" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label14" text="gone" textWrap="false"/>
                        </td>
                      </tr>
                    </table>
                  </bttdojo:group>
                </td>
              </tr>
              <tr>
                <td>
                  <bttdojo:group id="comboboxtInFlow_group10" text="Set properties" textWrap="false">
                    <table>
                      <tr>
                        <td colspan="3" align="left" valign="middle">
                          <bttdojo:combo id="comboboxtInFlow_propertiesList" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" textWrap="false"/>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:button id="comboboxtInFlow_btnToggleReadonly" type="button" text="toggle readonly" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:button id="comboboxtInFlow_btnToggleDisable" type="button" text="toggle disable" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:button id="comboboxtInFlow_btnSetFocus" type="button" text="set focus" textWrap="false"/>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:button id="comboboxtInFlow_btnVisible" type="button" text="visibility=visible" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:button id="comboboxtInFlow_btnHidden" type="button" text="visibility=hidden" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:button id="comboboxtInFlow_btnGone" type="button" text="visibility=gone" textWrap="false"/>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td colspan="2" align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label51" text="Set the value for the propertiesList" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="comboboxtInFlow_text" dataName="selectData.selectName" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:button id="comboboxtInFlow_button05" type="button" text="Set value" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label72" text="(the value from the combobox)" textWrap="false"/>
                        </td>
                      </tr>
                    </table>
                  </bttdojo:group>
                </td>
              </tr>
              <tr>
                <td>
                  <bttdojo:group id="comboboxtInFlow_group11" text="API: showErrorMessage() - display messages(support nls)" textWrap="false">
                    <table>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label53" text="Sample Widget:" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:combo id="comboboxtInFlow_selectList40" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" textWrap="false"/>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:button id="comboboxtInFlow_button07" type="button" text="ShowNonNlsMsg" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:button id="comboboxtInFlow_button08" type="button" text="ShowNonNlsParamedMsg" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:button id="comboboxtInFlow_button09" type="button" text="ShowConstantMsgWithParams" textWrap="false"/>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:button id="comboboxtInFlow_button10" type="button" text="ShowNlsMsg" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:button id="comboboxtInFlow_button11" type="button" text="ShowParamedNlsMsg" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:button id="comboboxtInFlow_button12" type="button" text="ShowExtraParamedNlsMsg" textWrap="false"/>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                      </tr>
                    </table>
                  </bttdojo:group>
                </td>
              </tr>
              <tr>
                <td>
                  <bttdojo:group id="comboboxtInFlow_group12" text="Static file loading error handlingon/AsyncOK,onAsyncError" textWrap="false">
                    <table>
                      <tr>
                        <td colspan="4" align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label54" text="Click the button and the error message will display error information" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:combo id="comboboxtInFlow_selectList43" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:button id="comboboxtInFlow_button13" type="button" text="stop server and then click" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:message id="comboboxtInFlow_message02" dataName="dse_errorMessages" textWrap="false"/>
                        </td>
                        <td>
                        </td>
                      </tr>
                    </table>
                  </bttdojo:group>
                </td>
              </tr>
              <tr>
                <td>
                  <bttdojo:group id="comboboxtInFlow_group13" text="Appearance" textWrap="false">
                    <table>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:combo id="comboboxtInFlow_combo18" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" width="265px" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label71" text="Set the width of combobox" textWrap="false"/>
                        </td>
                      </tr>
                    </table>
                  </bttdojo:group>
                </td>
              </tr>
              <tr>
                <td>
                </td>
              </tr>
              <tr>
                <td>
                </td>
              </tr>
              <tr>
                <td>
                </td>
              </tr>
              <tr>
                <td>
                </td>
              </tr>
              <tr>
                <td>
                </td>
              </tr>
            </table>
          </bttdojo:contentpane>
          <bttdojo:contentpane id="comboboxtInFlow_ContentPane03" title="comboboxECA">
            <table style="table-layout:fixed">
              <tr>
                <td>
                  <bttdojo:group id="comboboxtInFlow_group06" text="Event" textWrap="false">
                    <table>
                      <tr>
                        <td colspan="3" align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label29" text="%nls.bttsample/selectListMark01" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:combo id="comboboxtInFlow_combo19" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label15" text="onClick" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label52" text="Label" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:combo id="comboboxtInFlow_combo20" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label16" text="onFocus" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label55" text="Label" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:combo id="comboboxtInFlow_combo21" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label17" text="onBlur" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label56" text="Label" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:combo id="comboboxtInFlow_combo22" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label18" text="onKeyDown" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label57" text="Label" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:combo id="comboboxtInFlow_combo23" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label19" text="onKeyPress" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label58" text="Label" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:combo id="comboboxtInFlow_combo24" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label20" text="onKeyUp" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label59" text="Label" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:combo id="comboboxtInFlow_combo25" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label21" text="onMouseDown" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label60" text="Label" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:combo id="comboboxtInFlow_combo26" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label22" text="onMouseUp" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label61" text="Label" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:combo id="comboboxtInFlow_combo27" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label23" text="onMouseEnter" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label62" text="Label" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:combo id="comboboxtInFlow_combo28" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label24" text="onMouseLeave" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label63" text="Label" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:combo id="comboboxtInFlow_combo29" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label25" text="onMouseMove" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label64" text="Label" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:combo id="comboboxtInFlow_combo30" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label26" text="onChange" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label65" text="Label" textWrap="false"/>
                        </td>
                      </tr>
                    </table>
                  </bttdojo:group>
                </td>
              </tr>
              <tr>
                <td>
                  <bttdojo:group id="comboboxtInFlow_group07" text="Condition" textWrap="false">
                    <table>
                      <tr>
                        <td colspan="3" align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label35" text="%nls.bttsample/comboboxMark03" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:combo id="comboboxtInFlow_combo40" dataName="selectData.selectName4" dataNameForList="selectDataList" labelField="labelselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label28" text="isFocusableByOnfocus" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label36" text="Label" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:combo id="comboboxtInFlow_combo31" dataName="selectData.selectName2" dataNameForList="selectDataList" labelField="labelselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label31" text="isFocusable" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label68" text="Label" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:combo id="comboboxtInFlow_combo32" dataName="selectData.selectName2" dataNameForList="selectDataList" labelField="labelselect" disabled="true" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label32" text="disabled" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label69" text="Label" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:combo id="comboboxtInFlow_combo41" dataName="selectData.selectName5" dataNameForList="selectDataList" labelField="labelselect" readOnly="true" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label66" text="readOnlyByOnFocus" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label67" text="Label" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:combo id="comboboxtInFlow_combo33" dataName="selectData.selectName2" dataNameForList="selectDataList" labelField="labelselect" readOnly="true" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label33" text="readOnly" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label70" text="Label" textWrap="false"/>
                        </td>
                      </tr>
                    </table>
                  </bttdojo:group>
                </td>
              </tr>
              <tr>
                <td>
                  <bttdojo:group id="comboboxtInFlow_group08" text="Action" textWrap="false">
                    <table>
                      <tr>
                        <td colspan="2" align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label34" text="%nls.bttsample/comboboxMark02" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:combo id="comboboxtInFlow_combo34" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label30" text="styleClass" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:combo id="comboboxtInFlow_combo35" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label37" text="visibility(hidden)" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:combo id="comboboxtInFlow_combo36" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label38" text="disabled" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:combo id="comboboxtInFlow_combo37" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label39" text="readOnly" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:combo id="comboboxtInFlow_combo38" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label40" text="hint" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:combo id="comboboxtInFlow_combo39" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="comboboxtInFlow_label41" text="showErrorMessage" textWrap="false"/>
                        </td>
                      </tr>
                    </table>
                  </bttdojo:group>
                </td>
              </tr>
            </table>
          </bttdojo:contentpane>
        </bttdojo:tabbedpane>
      </td>
    </tr>
  </table>

</body>
</html>